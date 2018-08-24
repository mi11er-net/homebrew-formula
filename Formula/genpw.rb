require "language/node"

class Genpw < Formula
  desc "Generate a password"
  homepage "https://genpw.com"
  url "https://registry.npmjs.org/genpw/-/genpw-2.0.12.tgz"
  version "2.0.12"
  sha256 "c68452fffbffe85d86134424c56eec7496b7eb379ebf57bed3e144ca8982e1ba"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end