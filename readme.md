# dguay's Dotfiles

Reference: https://driesvints.com/blog/getting-started-with-dotfiles

## Features

* zsh
* [zplug](https://github.com/zplug/zplug)
* [Spaceship zsh theme](https://github.com/denysdovhan/spaceship-zsh-theme)
* [Dotbot](https://github.com/anishathalye/dotbot)
* [Homebrew](https://brew.sh/)
* [Homebrew cask](https://github.com/caskroom/homebrew-cask)

## Get started

Follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file
7. Run `install` to start the installation
10. Restart your computer to finalize the process

## Your Own Dotfiles

If you want to start your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

* Go through the [`macos`](./macos) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

* Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

* Check out the [`aliases`](./aliases) file and add your own aliases.

* Check out the [`zsh config`](./zshrc) file and add your plugins.
