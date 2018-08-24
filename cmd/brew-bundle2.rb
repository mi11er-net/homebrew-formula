#
#: *  `bundle2`
#:    Extends the regular brew bundle with defualts for the global
#:    Brewfile.
#:
#:    Works exactly like regular bundle command except it adds a --file argument
#:    with the global Brewfile specified.
#:
#:    The global Brewfile can be:
#:      1) in $HOME/.Brewfile
#:      2) in $HOME/.config/brew/Brewfile
#:      3) specified in a HOMEBREW_BREWFILE envronment variable
#:
#:    The HOMEBREW_BREWFILE environment variable has highest priority
#:
#:    Use regular bundle command for normal behavoir.
#

require "pathname"

path1 = ENV["HOMEBREW_BREWFILE"] ? Pathname(ENV["HOMEBREW_BREWFILE"]).expand_path : Pathname(".Brewfile")
path2 = Pathname(Dir.home).expand_path + ".Brewfile"
path3 = Pathname(Dir.home).expand_path+".config"+"brew"+"Brewfile"

if path1.exist?
  brewfile = path1.to_s
elsif path2.exist?
  brewfile = path2.to_s
elsif path3.exist?
  brewfile = path3.to_s
else
  raise("No Brewfile found")
end
puts "#{Tty.blue}Using #{brewfile} #{Tty.default}"
exec("brew", "bundle", "--file=#{brewfile}", *ARGV)
