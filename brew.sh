#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg pinentry-mac

# Install more recent versions of some macOS tools.
# brew install vim --with-override-system-vi
brew install neovim
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php71
brew install homebrew/php/php-cs-fixer
brew install python3
brew cask install ngrok
brew cask install android-file-transfer
brew cask install insomnia
brew cask install kap

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
# brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install htop
brew install octave

# Cask
brew cask install atom
apm stars --install

brew cask install telegram
brew cask install whatsapp
brew cask install iterm2
brew cask install Transmission
brew cask install spectacle
brew cask install skype
brew cask install gitter

# Devtools
brew cask install sourcetree
brew cask install slack

brew install composer
brew install gpg2
brew install npm
brew cask install docker
brew cask install sequel-pro
brew cask install imageoptim
brew cask install filezilla
brew cask install dash
brew cask install alfred
brew cask install github

brew tap caskroom/fonts
brew cask install font-source-code-pro

brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install qlimagesize
brew cask install webpquicklook

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
