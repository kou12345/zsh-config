export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/opt/python@3.11/libexec/bin:$PATH"

if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -Uz compinit
compinit
fi


export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


alias gs='git status'
alias gd='git diff'

# promptにgitのブランチ名を表示
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{80}'
COLOR_DIR=$'%F{222}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '
