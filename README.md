# homebrew-mdviewer

This repository contains:

- A [Homebrew](https://brew.sh) formula for installing `mdviewer`, a Markdown viewer CLI.
- A Python tool [`reqs2brew`](./src/reqs2brew) for generating Homebrew `resource` blocks from a `requirements.txt`, e.g., [`requirements_mdviewer.txt`](requirements_mdviewer.txt).

---

## 📦 mdviewer Formula

Install `mdviewer` using this Homebrew tap:

```bash
brew tap biaojiang/mdviewer
brew install biaojiang/mdviewer/mdviewer
```

## `reqs2brew` tool

Generate Homebrew `resource` blocks from a `requirements.txt`.

This tool helps Homebrew formula authors convert a list of Python dependencies into `resource` stanzas suitable for use with `virtualenv_install_with_resources`. It supports version resolution, SHA256 calculation, and optional filtering of pre-releases.

### Features

- Automatically fetches the latest stable release of each package.
- Downloads the source tarball (`sdist`) for proper SHA256 calculation.
- Outputs Homebrew `resource` blocks to both terminal and file.
- Caches downloads to avoid redundant network requests.

### Installation

```bash
pip install reqs2brew
```

