
# Dot Files Repo

These are my dot files.  There are many like them, but these are mine.

My install script and related are licensed under GPLv3, they will forever remain free to edit and modify provided you grant the same courtesy to future generations.


## Usage

These dot files can be used to greatly enhance your terminal experience.

Features include:

- Enhanced prompt with plenty of details
- Support for git information in your prompt
- Colored output by default with various terminal commands
- Fully configured vim with common plugins


## Installation

The included `install` script is a bash script that will install the files.  Simply execute it with `./install`.

Executing as root or with sudo privileges will also throw a copy into `/etc/skel` if your system uses that directory, allowing all new users to take advantage of the same configuration.

**The install script will overwrite any files with conflicting names.**


### Automatic Downloads

The script can be downloaded and executed independently of the repository.

It will attempt to download any missing files over the network.

Any downloaded files will be placed next to the script in `downloads/`.  Simply delete the folder (or its contents) to download a fresh copy if you run it again at a later time.


