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
if [[ -n `command -v nvim` ]]; then
  export EDITOR='nvim'
  alias vim="nvim"
else
  export EDITOR='vim'
fi

# Aliases
alias tmux="tmux -2"

#GPG setup
if [ -z "$GPG_TTY" ]; then
  gpg-connect-agent /bye
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  GPG_TTY=$(tty); export GPG_TTY
fi

# Color term setup
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
fi

# Base16 Shell
BASE16_SCHEME="tomorrow"
BASE16_FLAVOR="dark"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.$BASE16_FLAVOR.sh"
if [ "$USER" != "root" ]; then
  [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
fi

# fzf with ripgrep setup
[[ -d /usr/share/fzf ]] && source /usr/share/fzf/completion.zsh && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Load rust toolchain
source $HOME/.cargo/env
