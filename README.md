# dotfiles
 
## Installation

Clone the repo:

```bash
git clone https://github.com/eendroroy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash dot_install 
bash dot_install --force # force install even if already installed from different source
```

## Uninstallation

```bash
cd ~/.dotfiles
bash dot_uninstall                  # uninstall from cache
bash dot_uninstall --search         # uninstall by links
bash dot_uninstall --search --force # uninstall by links and remove even if installed from different source
```

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
