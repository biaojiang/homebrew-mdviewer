import os
import sys
import hashlib
import requests
from packaging.version import Version, InvalidVersion


CACHE_DIR = "cache_tarballs"
os.makedirs(CACHE_DIR, exist_ok=True)


def is_stable(version_str):
    try:
        v = Version(version_str)
        return not v.is_prerelease
    except InvalidVersion:
        return False


def sha256sum(filename):
    h = hashlib.sha256()
    with open(filename, "rb") as f:
        for chunk in iter(lambda: f.read(8192), b""):
            h.update(chunk)
    return h.hexdigest()


def fetch_pypi_tarball_url(pkg_name):
    url = f"https://pypi.org/pypi/{pkg_name}/json"
    r = requests.get(url)
    r.raise_for_status()
    data = r.json()

    # Try to get the latest source distribution URL (tar.gz)
    releases = data["releases"]
    stable_versions = [v for v in releases.keys() if is_stable(v)]
    stable_versions.sort(key=Version, reverse=True)

    for version in stable_versions:
        for file_info in releases[version]:
            if file_info["packagetype"] == "sdist" and file_info["filename"].endswith(
                ".tar.gz"
            ):
                return file_info["url"], file_info["filename"], version

    raise ValueError(f"No sdist tar.gz found for package")


def main(requirements_file):
    with open(requirements_file) as f:
        pkgs = [
            line.strip().split("==")[0]
            for line in f
            if line.strip() and not line.startswith("#")
        ]
    
    output_lines = []

    for pkg in pkgs:
        try:
            url, filename, _ = fetch_pypi_tarball_url(pkg)
            cache_path = os.path.join(CACHE_DIR, filename)
            if not os.path.exists(cache_path):
                print(f"Downloading {filename} ...")
                resp = requests.get(url)
                resp.raise_for_status()
                with open(cache_path, "wb") as f:
                    f.write(resp.content)
            else:
                print(f"Using cached {filename}")

            checksum = sha256sum(cache_path)
            # print(f'resource "{pkg}" do')
            # print(f'  url "{url}"')
            # print(f'  sha256 "{checksum}"')
            # print("end\n")
            block = f'''resource "{pkg}" do
  url "{url}"
  sha256 "{checksum}"
end

'''
            print(block)
            output_lines.append(block)

        except Exception as e:
            print(f"Error processing {pkg}: {e}", file=sys.stderr)

    with open("resources.txt", "w") as f:
        f.writelines(output_lines)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python generate_resources.py requirements.txt")
        sys.exit(1)
    main(sys.argv[1])
