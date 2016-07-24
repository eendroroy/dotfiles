if [ ! -L /usr/bin/zsh ]; then
	sudo apt install -y zsh
	echo "Configuring zsh as default shell"
	chsh -s $(which zsh)
fi
