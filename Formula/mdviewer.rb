class Mdviewer < Formula
  include Language::Python::Virtualenv

  desc "Local browser UI for viewing Markdown files with search and file tree"
  homepage "https://github.com/biaojiang/mdviewer"
  url "https://files.pythonhosted.org/packages/55/74/4b8101e5457312c948e49363c59ce28113c47ba76b622499cff829d36b4c/mdviewer-0.2.2.tar.gz"
  sha256 "58aceff42c6fffdafab8374f2124c2bad7e15b78b612dbf61415aec4c4822c29"
  license "MIT"

  depends_on "python@3.13"

  resource "Flask" do
    url "https://files.pythonhosted.org/packages/c0/de/e47735752347f4128bcf354e0da07ef311a78244eba9e3dc1d4a5ab21a98/flask-3.1.1.tar.gz"
    sha256 "284c7b8f2f58cb737f0cf1c30fd7eaf0ccfcde196099d24ecede3fc2005aa59e"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/d8/e4/0c4c39e18fd76d6a628d4dd8da40543d136ce2d1752bd6eeeab0791f4d6b/beautifulsoup4-4.13.4.tar.gz"
    sha256 "dbb3c4e1ceae6aefebdaf2423247260cd062430a410e38c66f2baa50a8437195"
  end

  resource "livereload" do
    url "https://files.pythonhosted.org/packages/43/6e/f2748665839812a9bbe5c75d3f983edbf3ab05fa5cd2f7c2f36fffdf65bd/livereload-2.7.1.tar.gz"
    sha256 "3d9bf7c05673df06e32bea23b494b8d36ca6d10f7d5c3c8a6989608c09c986a9"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # basic CLI check
    assert_match "usage", shell_output("#{bin}/mdviewer --help")
  end
end

