#
#:
#: *  `up2`
#:    Updates the brew environment and installed packages
#:
#

puts "\n#{Tty.blue}Updating brew...#{Tty.default}"
system("brew", "update")

puts "\n#{Tty.blue}Upgrading brew...#{Tty.default}"
system("brew", "upgrade")

which("mas") || system("brew", "install", "mas")

system ("mas account >/dev/null 2>&1") || raise("You must sign-in to the App store to continue.")

puts "\n#{Tty.blue}Running brew bundle...#{Tty.default}"
system("brew", "bundle2")

system("mas", "upgrade")

system("brew", "cleanup", "-s")

puts "\n\n#{Tty.blue}...done#{Tty.default}"
