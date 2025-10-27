<!--
  Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>

  SPDX-License-Identifier: AGPL-3.0-or-later

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.
-->

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
