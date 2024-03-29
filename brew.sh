#!/usr/bin/bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
#brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install a modern version of Bash.
brew install bash
brew install watch

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install --cask iterm2
brew install zsh
brew install wget

brew install git
brew install ssh-copy-id
brew install --cask visual-studio-code
brew install --cask termius

# Code

brew install hugo

# DevOps

brew install --cask docker
brew install helm
brew install terraform
brew install kubectl
brew install kubectx
brew install awscli
brew install --cask lens
brew install openshift-cli
brew install --cask vagrant
brew install ansible
#brew install --cask virtualbox
brew install kind

# DevSecOps 

brew install trivy

# Communication

brew install --cask slack
brew install --cask zoom
brew install --cask microsoft-teams

# Other

brew install --cask google-chrome
brew install --cask spotify
brew install --cask grammarly

# Remove outdated versions from the cellar.
brew cleanup
