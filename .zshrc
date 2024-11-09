# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Node.jsのバージョン管理ツールnodebrewを使うためのPATH設定
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Python 3.11を使うためのPATH設定
export PATH="/usr/local/opt/python@3.11/libexec/bin:$PATH"

# Go言語のバイナリが置かれているディレクトリをPATHに追加
export PATH=$PATH:$HOME/go/bin

# Homebrewがインストールされているか確認し、インストールされていれば設定を読み込む
if type brew &>/dev/null; then
  # Homebrewでインストールしたzsh補完機能のファイルパスを設定
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  # zshの自動提案機能を有効にするスクリプトを読み込む
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  # 補完機能を初期化
  autoload -Uz compinit
  compinit
fi

# PostgreSQLのバージョン15を使うためのPATH設定
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Gitのステータスと差分表示のためのエイリアス設定
alias gs='git status'
alias gd='git diff'

# ターミナルのプロンプトに現在のGitブランチ名を表示する関数
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# プロンプト表示のための色設定
COLOR_DEF=$'%f'  # デフォルト色
COLOR_USR=$'%F{80}'  # ユーザー名の色
COLOR_DIR=$'%F{222}'  # カレントディレクトリの色
COLOR_GIT=$'%F{39}'  # Gitブランチの色

# プロンプトが動的に評価されるように設定
setopt PROMPT_SUBST

# カスタマイズされたプロンプトを設定
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '
source "$HOME/.rye/env"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
