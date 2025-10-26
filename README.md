[//]: # (SPDX-License-Identifier: AGPL-3.0-or-later)
[//]: # (Copyright &#40;c&#41; 2025 Indrajit Roy)
[//]: # (Part of `dotfiles`)
[//]: # (See https://www.fsf.org/licensing/licenses/agpl.html)
[//]: # (OR https://spdx.org/licenses/AGPL-3.0-or-later.html)

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
./dotfiles install
```

## Usage

```shell
./dotfiles help
```

```
Usage: ./dotfiles [command] [options]

Commands:
  h, help       Show this help
  l, list       List managed dotfiles
  i, install    Install symlinks
  u, uninstall  Remove symlinks

Common options:
  -s, --status  Show status only
  -v, --verbose Increase verbosity
  -f, --force   Force overwrite

Script location: /Users/indrajit/.dotfiles
```

## License

The project is available as open source under the terms of the [AGPL3 License](https://www.fsf.org/licensing/licenses/agpl.html).
