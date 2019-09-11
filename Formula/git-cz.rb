require "language/node"

class GitCz < Formula
  desc "Semantic emojified git commit, git-cz"
  homepage "https://github.com/streamich/git-cz"
  url "https://registry.npmjs.org/git-cz/-/git-cz-3.2.1.tgz"
  version "3.2.1"
  sha256 "13b92ed997b1ed86c127e778ca454e348c87257db42a4a32dcbfb66d006e5224"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end