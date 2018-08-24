require "language/node"

class NpmMergeDriver < Formula
  desc "git merge driver for automatically merging lockfiles"
  homepage "https://github.com/npm/npm-merge-driver#readme"
  url "https://registry.npmjs.org/npm-merge-driver/-/npm-merge-driver-2.3.5.tgz"
  version "2.3.5"
  sha256 "39e728b0a0662604758075b2ac734e8214bc737a9b26d74a05cdb92c5aafffa6"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end