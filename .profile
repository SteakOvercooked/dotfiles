# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set path to zig
if [ -d "$HOME/.local/bin/zig-0.12.0-dev" ] ; then
    PATH="$HOME/.local/bin/zig-0.12.0-dev:$PATH"
fi

# set path to go
if [ -d "$HOME/.local/bin/go-1.21.6/bin" ] ; then
    PATH="$HOME/.local/bin/go-1.21.6/bin:$PATH"
fi

# set path to nvim
if [ -d "/opt/nvim-linux64/bin" ] ; then
    PATH="/opt/nvim-linux64/bin:$PATH"
fi

# Run ssh-agent
eval "$(ssh-agent -s)"
