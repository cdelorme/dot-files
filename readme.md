
# Dot Files Repo

These are my dot files.  There are many like them, but these are mine.

My install script and related are licensed under GPLv3, they will forever remain free to edit and modify provided you grant the same courtesy to future generations.


## Features

These dot files can be used to greatly enhance your terminal experience.

Features include:

- Enhanced prompt with plenty of details
- Detailed git output, giving you an instant summary of your working branch
- Support for git information in your prompt
- Colored output by default with various terminal commands
- Fully configured vim with common plugins


## Dependencies

This script will attempt to use `curl` and fallback on `wget` to download individual files.  For plugins or entire missing packages it will attempt to use `git`, otherwise it will use the previously selected download command and require `unzip` to decompress the packages.

So, either have `curl` __or__ `wget` installed, **and** either `git` __or__ `unzip` installed.


## Installation

The included `install` script is a bash script that will install the files.  Simply execute it with `./install`.

Executing as root or with sudo privileges will also throw a copy into `/etc/skel` if your system uses that directory, allowing all new users to take advantage of the same configuration.

**The install script will overwrite any files with conflicting names.**


#### Installer Requirements

- must be executed from a directory you have write permissions on
- remote install, vim plugins, and colorscheme require either git, or unzip and curl or wget

_The script will fail silently, skipping any tasks it cannot perform.  You can check for failed actions in the log file it generates._


### Automatic Downloads

The script can be downloaded and executed independently of the repository.

It will attempt to download any missing files over the network.

Any downloaded files will be placed next to the script in `downloads/`.  Simply delete the folder (or its contents) to download a fresh copy if you run it again at a later time.


## Additional Tips

You may consider [remapping capslock](http://c2.com/cgi/wiki?RemapCapsLock), since nobody really uses that key anymore.

OS X has used "Darwin" as their [uname response](http://en.wikipedia.org/wiki/Uname) for many years now, so it is reliable.

If you are using OSX and the hostname is really like (eg. `Firstname Lastname's Macbook.local`) you can fix that easily with `sudo scutil --set HostName newname.local`.


## Planned Features

- Mapping control/command + v hotkey to auto-trigger `:set paste` and then `:set nopaste`
- Shared clipboard support with vim
