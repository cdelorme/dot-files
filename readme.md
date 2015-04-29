
# dot-files

These are my dot files.  There are many like them, but these are mine.

The intention of these files are to enhance your terminal experience and productivity.


## features

If you are looking for automation with extended features, see my [system-setup repository](https://www.github.com/cdelorme/system-setup).  These are plain files that can be copied into your home folder.

Features include:

- linux, osx, and windows (git-bash) compatibility
- installation script
- vim customization
- prompt & git enhancements

The vim customizations include color scheme settings and autoloading of plugins, _but the installation of plugins and color schemes are to be handled separately._  No errors will (or should) occur from using the vimrc.

Prompt enhancements include automated loading of ssh keys (if they exist, and from non-login shells), and color-coding with timestamps and appropriate prompt command spacing.

The git enhancements include automated displaying of the current branch, and git repository status while inside a repository.


## usage

The easiest way is to download or clone the repository and copy and paste the files in `src/` into `~/`.  Doing so will omit the `git-completion` file (which may not be necessary on all platforms)  Alternatively you can run `./install` locally to copy the files for you.

By default the installer will ask for confirmation, simply add `-q` after the closing parenthesis to automate silently.

You can also use `curl` to execute it remotely, adding the `-s -- -q` to silence the prompt:

	curl -L "https://raw.githubusercontent.com/cdelorme/dot-files/master/install" | bash -s -- -q

Or if you'd rather see the prompt, you can use `curl` or `wget` with subshells (which may not work on older bash shells or windows `git-bash`):

    bash <(wget --no-check-certificate -qO- "https://raw.githubusercontent.com/cdelorme/dot-files/master/install")

_The `wget` command is slower and requires the additional parameters for https compatibility, making it more verbose._


### dependencies

The script relies on either `curl` or `wget` to download the remote files.


## future plans

- shared clipboard support between vim sessions
- vim mapping control/command + v hotkey to trigger `:set paste` and `:set nopaste`
