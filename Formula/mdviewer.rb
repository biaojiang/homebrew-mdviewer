class Mdviewer < Formula
  include Language::Python::Virtualenv

  desc "Local browser UI for viewing Markdown files with search and file tree"
  homepage "https://github.com/biaojiang/mdviewer"
  url "https://files.pythonhosted.org/packages/55/74/4b8101e5457312c948e49363c59ce28113c47ba76b622499cff829d36b4c/mdviewer-0.2.2.tar.gz"
  sha256 "58aceff42c6fffdafab8374f2124c2bad7e15b78b612dbf61415aec4c4822c29"
  license "MIT"

  depends_on "python@3.13"
  depends_on "ripgrep"
  depends_on "fd"

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
  
  resource "blinker" do
    url "https://files.pythonhosted.org/packages/21/28/9b3f50ce0e048515135495f198351908d99540d69bfdc8c1d15b73dc55ce/blinker-1.9.0.tar.gz"
    sha256 "b4ce2265a7abece45e7cc896e98dbebe6cead56bcf805a3d23136d145f5445bf"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
    sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
  end

  resource "itsdangerous" do
    url "https://files.pythonhosted.org/packages/9c/cb/8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d/itsdangerous-2.2.0.tar.gz"
    sha256 "e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c81fa6eb73e5f6173"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/b2/97/5d42485e71dfc078108a86d6de8fa46db44a1a9295e89c5d6d4a06e23a62/markupsafe-3.0.2.tar.gz"
    sha256 "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/3f/f4/4a80cd6ef364b2e8b65b15816a843c0980f7a5a2b4dc701fc574952aa19f/soupsieve-2.7.tar.gz"
    sha256 "ad282f9b6926286d2ead4750552c8a6142bc4c783fd66b0293547c8fe6ae126a"
  end

  resource "tornado" do
    url "https://files.pythonhosted.org/packages/51/89/c72771c81d25d53fe33e3dca61c233b665b2780f21820ba6fd2c6793c12b/tornado-6.5.1.tar.gz"
    sha256 "84ceece391e8eb9b2b95578db65e920d2a61070260594819589609ba9bc6308c"
  end

  resource "typing_extensions" do
    url "https://files.pythonhosted.org/packages/f6/37/23083fcd6e35492953e8d2aaaa68b860eb422b34627b13f2ce3eb6106061/typing_extensions-4.13.2.tar.gz"
    sha256 "e6c81219bd689f51865d9e372991c540bda33a0379d5573cddb9a3a23f7caaef"
  end

  resource "Werkzeug" do
    url "https://files.pythonhosted.org/packages/9f/69/83029f1f6300c5fb2471d621ab06f6ec6b3324685a2ce0f9777fd4a8b71e/werkzeug-3.1.3.tar.gz"
    sha256 "60723ce945c19328679790e3282cc758aa4a6040e4bb330f53d30fa546d44746"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # basic CLI check
    assert_match "usage", shell_output("#{bin}/mdviewer --help")
  end
end

