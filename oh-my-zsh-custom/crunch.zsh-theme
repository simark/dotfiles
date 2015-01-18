source ~/.oh-my-zsh/themes/crunch.zsh-theme

host_color="%{$fg[red]%}"

if [ -n "$SSH_CONNECTION" ]; then
    host="$(hostname) "
fi

PROMPT="${host_color}${host}${PROMPT}"

unset host
unset host_color
