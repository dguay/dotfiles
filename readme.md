# dguay's Dotfiles

Reference: https://driesvints.com/blog/getting-started-with-dotfiles

## Features

* [Dotbot](https://github.com/anishathalye/dotbot)
* [Mackup](https://github.com/lra/mackup)
* [Homebrew](https://brew.sh/)
* [Homebrew cask] (https://github.com/caskroom/homebrew-cask)
* [zplug](https://github.com/zplug/zplug)
* zsh

## Get started 

Follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file
7. Run `install` to start the installation
8. Make sure Dropbox is set up and synced
9. Restore preferences by running `mackup restore`
10. Restart your computer to finalize the process
11. We're ready to work!

## Your Own Dotfiles

If you want to start your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

* One thing you'll need to do manually is add your `~/.zshrc` file. You can't symlink the `.zshrc` file from your dotfiles because Mackup will already symlink your `.zshrc` from your home directory. That's why we'll need to create the file manually. Add the contents below to a `.zshrc` file in your `~` directory. What it will do is load the `.zshrc` file from your dotfiles. Make sure that the path to your dotfiles is correct.

```zsh
# Load Zsh
source ~/.dotfiles/.zshrc
```

* Go through the [`macos`](./macos) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

* Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

* Check out the [`aliases`](./aliases) file and add your own aliases. 

* When installing these dotfiles for the first time you'll need to backup all of your settings with Mackup. Install and backup your settings with the command below. Your settings will be synced to your Dropbox so you can use them to sync between computers and reinstall them when reinstalling your Mac. If you want to save your settings to a different folder or different medium than Dropbox, [checkout the documentation](https://github.com/lra/mackup#supported-storages).

```zsh
brew install mackup
mackup backup
```
