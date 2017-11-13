echo "########## Installing tmp##########"
if [ -d ~/.tmux/plugins/tpm ]; then
  echo "########## tpm already installed. Skipping..."
else
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "################################################"
