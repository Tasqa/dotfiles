source $HOME/.antigen/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle systemd
antigen bundle archlinux
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle junegunn/fzf

# Load the theme.
antigen theme terminalparty

# Tell antigen that you're done.
antigen apply

#fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path configuration
export PATH="/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/opt/android-sdk/platform-tools:$HOME/.gem/ruby/2.2.0"

# Preferred editor
export EDITOR='nvim'
# Aliases
alias tmux="tmux -2"

# Color term setup
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
fi

# GPG setup
gpg-connect-agent /bye
SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"; export SSH_AUTH_SOCK;
GPG_TTY=$(tty); export GPG_TTY

# Base16 Shell
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
if [ "$USER" != "root" ]; then
  [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
fi

