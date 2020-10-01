require "language/node"

class CloudflareWrangler < Formula
  desc "Wrangle your Cloudflare Workers"
  homepage "https://github.com/cloudflare/wrangler#readme"
  url "https://registry.npmjs.org/@cloudflare/wrangler/-/wrangler-1.11.0.tgz"
  version "1.11.0"
  sha256 "2e80f5c212edf69f8fc267c4d18fabe7f84e03f12a7a9cf8e0123e260f024846"

  depends_on "node"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    system "node",  "#{libexec}/lib/node_modules/@cloudflare/wrangler/install-wrangler.js"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end
