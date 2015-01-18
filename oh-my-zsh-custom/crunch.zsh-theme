source ~/.oh-my-zsh/themes/crunch.zsh-theme

if [ -n "$SSH_CONNECTION" ]; then
    host="$(hostname) "
fi

PROMPT="${host}${PROMPT}"
