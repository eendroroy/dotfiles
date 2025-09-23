# dotfiles
 
## Installation

### Using the installer

```shell
curl -s 'https://raw.githubusercontent.com/eendroroy/dotfiles/refs/heads/master/installer.sh' | bash
```

### Manually

Clone the repo:

```bash
git clone https://github.com/eendroroy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./dotfiles -i
```

## Usage

```shell
./dotfiles -h
```

```text
Usage: dotfiles [options]

Options:
  -h, --help          Show this help message and exit
  -l, --list          List all managed dotfiles
      -s, --status    Show installation status
  -i, --install       Install dotfiles
  -u, --uninstall     Uninstall dotfiles
      -f, --force     Force while uninstalling dotfiles
  -v, --verbose       Enable verbose output
```

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
