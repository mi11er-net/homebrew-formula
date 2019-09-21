require "language/node"

class CloudflareWrangler < Formula
  desc "Wrangle your Cloudflare Workers"
  homepage "https://github.com/cloudflare/wrangler#readme"
  url "https://registry.npmjs.org/@cloudflare/wrangler/-/wrangler-1.2.0.tgz"
  version "1.2.0"
  sha256 "2162e42d1fac6e3c252378a358016c9a3085d1769ded4327104995e0bdbc13a9"

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
