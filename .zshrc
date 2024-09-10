export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fino"

plugins=(git)

source $ZSH/oh-my-zsh.sh

#TMUX stuff
function switch_tmux_window_prev {
  if [[ -n "$TMUX" ]]; then
    # Switch to the next session
    tmux switch-client -p
  else
    echo "Not inside a tmux session."
  fi
}

function switch_tmux_window_next {
  if [[ -n "$TMUX" ]]; then
    # Switch to the next session
    tmux switch-client -n
  else
    echo "Not inside a tmux session."
  fi
}

XDG_CONFIG_HOME="$HOME/.config"

zle -N switch_tmux_window_prev
zle -N switch_tmux_window_next
bindkey '^p' switch_tmux_window_prev
bindkey '^n' switch_tmux_window_next

# Bind a key to invoke the custom function
bindkey -s ^f "tmux-sessionizer\r\n"
bindkey -s ^t "tmux list-sessions"

export PATH="$HOME/bin:$PATH"
