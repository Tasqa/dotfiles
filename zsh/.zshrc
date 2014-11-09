source .antigen/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle docker
antigen bundle systemd
antigen bundle archlinux
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle junegunn/fzf

# Load the theme.
antigen theme terminalparty

# Tell antigen that you're done.
antigen apply

# User configuration
export PATH="/home/tako/.gem/ruby/2.1.0/bin:/home/tako/.gem/ruby/2.1.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"

# Preferred editor
export EDITOR='nvim'

# Base16 Shell
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

#Wine settings
export WINEARCH=win32
export WINEDEBUG=-all

#fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
