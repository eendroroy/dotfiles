## function

# dnext/dprev -- go to next/prev directory at same level
dnext() {
  local d; d=( ../*(/) )
  cd "${d[d[(i)../$PWD:t]${1:-+1}]:?no such dir}" || echo "No Next Directory"
}
alias dprev='dnext -1'

#mkdir and cd $1
mkcdir() {
    mkdir -p -- "$1" && cd -P -- "$1" || return
}

# history
hst(){
    \history -DE "$@" \
     | awk '{printf("\033[31m%5s\033[m \033[34m%s\033[m \033[36m%s\033[m \033[93m%s\033[m",$1, $2, $3, $4); $1=""; $2=""; $3=""; $4=""; printf("\033[92m%s\033[m\n",$0)}' \
     | less -RXF
}

# alacritty theme switcher
if [[ "$(uname)" == "Darwin" ]]; then
    __switch_theme() {
        local __theme; __theme=$(\
          find ~/.config/alacritty/theme -name '*.toml'\
          | sed "s|${HOME}/.config/alacritty/theme/||g"\
          | awk -F. '{print $1}'\
          | fzf --tmux 40% +m --no-preview\
        )
        [[ -n ${__theme} ]] && \
          sed -i.bak "s|/theme/.*\.toml|/theme/${__theme}.toml|g" ~/.config/alacritty/alacritty.toml && \
          echo "Theme changed to ${__theme}"
    }
    zle -N __switch_theme_widget __switch_theme
    bindkey '^y' __switch_theme_widget
fi
