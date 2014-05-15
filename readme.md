
# Dot Files Repo

These are my dot files.  There are many like them, but these are mine.

My install script and related are licensed under GPLv3, they will forever remain free to edit and modify provided you grant the same courtesy to future generations.

**This script no-longer overwrites existing dot-files unless you ask it to! (though a backup is still recommended)**


## Features

These dot files can be used to greatly enhance your terminal experience, and automate initial user configuration and setup.

Features include:

- osx & linux compatibility (_and possibly bsd_)
- enhanced prompt with colors to cleanly display more information
- automatic detailed git information when in a git project, giving you an instant summary
- togglable and extendable prompt features
- fully configured vim with common plugins
- **optional** automatic pulling of github public keys to ~/.ssh/authorized_keys
- **optional** automatic ssh-keygen and push to github
- **optional** automatic osx homebrew github token creation


## Dependencies

This script will attempt to use `curl` and fallback on `wget` as a download command to download individual files.  For plugins or entire missing packages it will attempt to use `git`, otherwise it will use the previously selected download command and require `unzip` to decompress the packages.

So any combination of `curl` _or_ `wget` **and** `git` _or_ `unzip`.  **I suggest installing all of them anyways, and then working from there.**


## Installation

My dot-files comes with an `install` bash script.  This script will look for local files, and download whatever is missing, then copy it into the current users `$HOME` path.  It will also attempt to copy the files into `/etc/skel`, if the path exists and privileges allow.

You can download just the install script and run it:

    wget "https://raw.github.com/cdelorme/dot-files/master/install"

or:

    curl -o "install" "https://raw.github.com/cdelorme/dot-files/master/install"

then:

    chmod +x install
    ./install

_Alternatively you can clone the repository and run `./install` inside it._

This will create a `downloads/` folder with all of the files that you may then copy to your `$HOME/` folder manually.


**The script now accepts proper arguments.  For a more detailed list use `./install -h`**.

To automatically copy the files to your `$HOME/` folder **overwriting any files already there**:

    ./install -a

To install dot-files into `/etc/skel` (for linux systems):

    ./install --skel

If you want to automatically pull your accounts github pub keys just add a github username:

    ./install -u username

To automate ssh keygen and osx homebrew token processing:

    ./install -u username -p password

_It will generate a key only if no default key already exists, and will not run if the user is root._

If you want to specify a different key password than your github account (such as a user or system password):

    ./install -u username -p password --ssl-password=secondpassword


#### Installer Requirements

- must be executed from a directory you have write permissions on
- remote install, vim plugins, and colorscheme require either git, or unzip and curl or wget

_The script will fail silently, skipping any tasks it cannot perform.  You can check for failed actions in the log file it generates._


## OS X

You may consider [remapping capslock](http://c2.com/cgi/wiki?RemapCapsLock), since nobody really uses that key anymore.

OS X has used "Darwin" as their [uname response](http://en.wikipedia.org/wiki/Uname) for many years now, so it is reliable.

If you are using OSX with a default hostname, it'll be obsurdly long (eg. `Firstname Lastname's Macbook.local`).  yYou can fix that easily with `sudo scutil --set HostName newname.local`, or by going through `System Setting` to `Sharing` and changing the name from there.  _You will have to reboot or relogin for this change to take affect._

The root user exists on osx, and its home dir is `/var/root`.  By default the root account on OSX uses the `/bin/sh` shell, to switch to bash you will first have to run:

    sudo su
    chsh -s /bin/bash root

Then you may use the dot-files as the root account if necessary.


## Planned Features

- vim mapping control/command + v hotkey to trigger `:set paste` and `:set nopaste`
- shared clipboard support between vim sessions


## References

- [remapping capslock](http://c2.com/cgi/wiki?RemapCapsLock)
- [uname response](http://en.wikipedia.org/wiki/Uname)
