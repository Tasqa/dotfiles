# Set up zsh pkg manager
export ZPLUG_HOME=$HOME/.zplug
source $HOME/.zplug/init.zsh

# Setup history
HISTFILE=${HOME}/.zsh_history
setopt hist_ignore_all_dups
setopt histignorespace

# Load terminal theme
zplug "ohmyzsh/ohmyzsh", use:themes/terminalparty.zsh-theme, from:github, as:theme

# Apply plugins
zplug load

# Preferred editor
if [[ -n `command -v nvim` ]]; then
  export EDITOR='nvim'
  alias vim="nvim"
else
  export EDITOR='vim'
fi

# Aliases
alias tmux="tmux -2"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias irc='mosh turris.hex.sh --ssh="ssh -p 2222"'

export PATH=$HOME/.local/bin:$PATH

