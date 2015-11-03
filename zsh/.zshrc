source $HOME/.antigen/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle systemd
antigen bundle archlinux
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme terminalparty

# Tell antigen that you're done.
antigen apply

# Preferred editor
export EDITOR='nvim'

# Aliases
alias vim="nvim"
alias tmux="tmux -2"

# Path configuration
export PATH="$HOME/.gem/ruby/2.2.0:$PATH"

# GPG setup
if [ -z "$GPG_TTY" ]; then
  gpg-connect-agent /bye
  SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"; export SSH_AUTH_SOCK;
  GPG_TTY=$(tty); export GPG_TTY
fi

# Color term setup
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
fi

# Base16 Shell
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
if [ "$USER" != "root" ]; then
  [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
fi

