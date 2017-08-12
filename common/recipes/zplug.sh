echo "########## Installing zplug for zsh ##########"
if [ -d $HOME/.zplug ]; then
  echo "########## zplug already installed. Skipping..."
else
  git clone https://github.com/zplug/zplug.git $HOME/.zplug
fi
echo "################################################"
