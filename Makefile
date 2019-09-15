.PHONY: update-npm-formulas

# Requires noob
update-npm-formulas:
	@noob git-cz > Formula/git-cz.rb
	@noob genpw > Formula/genpw.rb
	@noob npm-merge-driver > Formula/npm-merge-driver.rb
	@noob @cloudflare/wrangler > Formula/wrangler.rb
