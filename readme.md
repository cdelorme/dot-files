
# dot-files

These are my dot files.  There are many like them, but these are mine.

The intention of these files are to enhance your terminal experience and productivity.


## features

**If you are looking for full-stack automation that sets up a bunch of tools and configures them, then you want to check out my [system-setup repository](https://www.github.com/cdelorme/system-setup).**

These are plain text configuration files that can be copied into your home folder (`$HOME` or `~/`) on linux or osx (mac).  They are (mostly) compatible with windows using [git-scm's git-bash](http://git-scm.com/).

The configuration files are loaded when you open a new terminal, and enhance:

- vim terminal text editor customization
- prompt enhancement with colors and timestamps
- base git configuration with global gitignore and command aliases
- git prompt enhancements showing the branch and short-status
- enlarged tmux history
- sets consistent shared history file, and terminal settings
- adds color and descriptive information to common terminal commands
- adds local bin, and golang (if it exists) to uses `$PATH`
- loads utilities like bash completion
- loads shared ssh agent and attempts to auto-load keys

Additional enhancements are supported inherently, but are not included as part of this project.

The git configuration depends on git version 2.0 (which added and some default settings).

The terminal enhancements have been written in a clean error-free way.

_The installation script will simply replace existing files by the same names.  If you would rather merge them then you will need to do so manually._


## installation

The easiest way is to download or clone the repository and copy the files in `src/` to `~/`.  Alternatively you can run `./install` locally to copy the files for you.

For convenience, the `./install` script will also work if executed remotely.  However, by default it asks for confirmation since it will overwrite files with matching names in `~/`.

For a silent install without sub-shells pass the file directly to bash with `-s -- -q`:

	curl -L "https://raw.githubusercontent.com/cdelorme/dot-files/master/install" | bash -s -- -q

Or `wget` you can use this approach to see the confirmation:

    bash <(wget --no-check-certificate -qO- "https://raw.githubusercontent.com/cdelorme/dot-files/master/install")


### dependencies

The script relies on either `curl` or `wget` to download the remote files.

If `git` is available, it will clone the repository instead (faster and more reliable).


## usage

Simply launch a new terminal and it will automatically load the installed shell files.

Services that depend on configuration files will find them in your home folder automatically.
