export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fino"

plugins=(git)

source $ZSH/oh-my-zsh.sh

tmux has-session -t pog &> /dev/null

if [ $? != 0 ] 
 then
    tmux new-session -s pog -x- -y- -d -n 1
    tmux split-window -v -t pog:0.0
    tmux select-pane -t pog:0.1
    tmux resize-pane -D 20
    tmux send-keys -t pog:0.1 "cd git" Enter
    tmux send-keys -t pog:0.0 "cd git" Enter
    tmux send-keys -t pog:0.0 "nvim ." Enter
    tmux select-pane -t pog:0.0
fi

tmux attach -t pog
