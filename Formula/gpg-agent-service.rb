class GpgAgentService < Formula
    url "https://github.com/mi11er-net/noop/releases/download/v1.0.0/noop-1.0.0.tgz"
    depends_on "gnupg"
    version "1.0.0"
    sha256 "278e2b7198ff3ef299509bbf32a191ed74f74b26e523bbecbd48da2c17d59092"

    keg_only :because, "it's not meant to have a binary"
    def install
      bin.install "bin/noop"
      (prefix/"launch_wrapper").write launch_wrapper
      File.chmod(0755,(prefix/"launch_wrapper"))
    end

  def launch_wrapper; <<~EOS
    #! /bin/sh

    # This process might work better using launchd to manage
    # the socket, but don't know how to implement yet.
    # man launch_activate_socket
    # man launchd.plist

    # see https://superuser.com/questions/1120480/cant-change-ssh-auth-sock-with-launchctl-setenv
    # see https://evilmartians.com/chronicles/stick-with-security-yubikey-ssh-gnupg-macos

    gpgconf --launch gpg-agent
    /bin/ln -sf "$(/usr/local/bin/gpgconf --list-dirs agent-ssh-socket)" "$SSH_AUTH_SOCK"
    #/bin/launchctl setenv SSH_AUTH_SOCK $(gpgconf --list-dirs agent-ssh-socket)

  EOS
  end

  plist_options :startup => true
  # brew reinstall Formula/gpg-agent-service.rb
  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <!-- Sets a name for a task -->
      <key>Label</key>
      <string>#{plist_name}</string>
      <!-- Sets a command to run and its options -->
      <key>ProgramArguments</key>
      <array>
        <string>#{prefix}/launch_wrapper</string>
      </array>
      <!-- Tells it to run the task once the XML is loaded -->
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
  EOS
  end
  end






