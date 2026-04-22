<!--
  Copyright (C) Indrajit Roy <eendroroy@gmail.com>

  SPDX-License-Identifier: AGPL-3.0-or-later

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.
-->


# dotfiles

Personal dotfiles and configuration management for macOS and Linux, designed for easy setup, portability, and reproducibility. This repository includes shell, editor, terminal, and tool configurations, plus automation scripts for streamlined environment setup.

---

## Features

- One-command installation for new systems
- Modular and portable dotfile management
- Automated symlink creation and removal
- Preconfigured settings for zsh, tmux, git, neovim, and more
- Theme and color scheme utilities
- Easily extensible for new tools

## Installation

### Quick Install

```sh
curl -s 'https://raw.githubusercontent.com/eendroroy/dotfiles/refs/heads/master/installer.sh' | bash
```

### Manual Install

```sh
git clone https://github.com/eendroroy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./dotfiles install
```

## Usage

```sh
./dotfiles help
```

Example output:

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

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for improvements, bug fixes, or new features. For major changes, open an issue first to discuss your ideas.

## License

This project is licensed under the [AGPL3 License](https://www.fsf.org/licensing/licenses/agpl.html).
