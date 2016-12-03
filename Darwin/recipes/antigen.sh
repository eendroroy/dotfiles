echo "########## Installing antigen for zsh ##########"
if [ -d $HOME/.antigen ]; then
  echo "########## antigen already installed. Skipping..."
else
  git clone https://github.com/zsh-users/antigen.git $HOME/.antigen --depth=1
fi
echo "################################################"
