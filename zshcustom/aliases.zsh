# References:
# - https://blog.lftechnology.com/command-line-productivity-with-zsh-aliases-28b7cebfdff9

alias vim='vim -u ~/repositories/dotfiles/.vimrc'

# mac
alias dndon='defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean true && defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturbDate -date "`date -u +\"%Y-%m-%d %H:%M:%S +0000\"`" && killall NotificationCenter'
alias dndoff='defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean false && killall NotificationCenter'

# git
alias gpl='git pull'
alias gps='git push'
alias gst='git status'
alias gci='git commit'
alias gca='git commit -a'
alias gdf='git diff'
alias rebase-dev-with-master='git checkout master && git pull && git checkout develop && git pull && git rebase'
alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitlogmine="git log --author=\"<$(git config user.email)>\" --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# file associations
alias -s txt=subl
# alias -s md=typora

# Global aliases
alias -g G="| grep" # example: 'apt-cache search vlc G data' will translate to 'apt-cache search vlc | grep data'
alias -g L="| less" # example: 'cat readme.md L' will translate to 'cat readme.md | less'

# Android
alias android-sha1-debug="keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android"
alias astudio="open -a /Applications/Android\ Studio.app ."

# Merge PDF
pdf-merge() {
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=merged.pdf $1 $2 $3 $4 $5 $6 $7
  open merged.pdf
}

pdf-compress() {
  mv $1 $1.original
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4  -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$1 $1.original
  mv $1.original ~/.Trash/
}

# Passbolt
# (You need to install https://github.com/passbolt/passbolt_cli)
passbolt-get() {
  passbolt get $1 | gpg -q --no-tty | pbcopy
  echo "Secrect copied to clipboard"
}

# Worklog
worklog() {
  for dir in `ls ~/repositories`; do
    log=`cd ~/repositories/$dir && git --no-pager log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --since="yesterday"`
    if [ -z "$log" ]
    then
      echo "######################"
      echo $dir
      echo "######################"
      echo $log
      echo ""
    fi
  done
}
