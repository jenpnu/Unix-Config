#!/bin/sh

cat << 'EOF'
███████╗███╗   ██╗██╗   ██╗██╗   ██╗
██╔════╝████╗  ██║╚██╗ ██╔╝██║   ██║
█████╗  ██╔██╗ ██║ ╚████╔╝ ██║   ██║
██╔══╝  ██║╚██╗██║  ╚██╔╝  ██║   ██║
███████╗██║ ╚████║   ██║   ╚██████╔╝
╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ 
EOF

copy_file () {
  local filename=$1
  if [ -e ~/$filename ]; then
    DIFF=$(diff -rq ~/$filename $BASEPATH/$filename) 
    if [ "$DIFF" != "" ] ; then
      # they need backup
      echo "Backup: ~/$filename as  ~/$filename.save"
      mv ~/$filename ~/$filename.save
      echo "Create: $filename"
      cp -r $BASEPATH/$filename ~/$filename
    else
      echo "No changed: $filename"
    fi
  else
    echo "Create: $filename"
    cp -r $BASEPATH/$filename ~/$filename
  fi
}

echo "[Initializing]"
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
BASEPATH=$(dirname "$SCRIPT")

echo "[Installing vim Vundle]"
git clone https://github.com/VundleVim/Vundle.vim.git $BASEPATH/.vim/bundle/Vundle.vim

echo "[Copying files and directories]"
for filename in .vimrc .vim .bashrc .screenrc .tmux.conf .tmuxline; do
  copy_file "${filename}"
done

echo "[Vundle install]"
vim +PluginInstall +qall

echo "[Git configuration]"
username=`whoami`
if [ "${username}" != "enyu" -a "${username}" != "jenpe" -a "${username}" != "LuLu" ]; then
  echo "It seems that your name is not enyu."
  echo "Skipping change configuration for git."
else
  copy_file ".gitconfig"
fi
