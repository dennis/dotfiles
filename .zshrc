alias xdk="setxkbmap -layout dk"
alias xus="setxkbmap -layout us"
alias mysqlr="mysql -u root"
alias be="bundle exec"

export EDITOR=vim
export VISUAL=vim

# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" to
