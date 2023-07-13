# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias vim="nvim"
alias vi="nvim"
alias mc="mcli" # minio client for (minio s3 emulator)

export XDG_CONFIG_HOME=/home/stm/xdg_config_home

export ANDROID_SDK_ROOT=/home/stm/Android/Sdk

export PATH=$PATH:/home/stm/scripts
export PATH=$PATH:/home/stm/.bin
export PATH=$PATH:/home/stm/.bin/android-studio/bin
export PATH=$PATH:/home/stm/go/bin

export PATH=$PATH:/home/stm/spring-2.7.5/bin

export TORCH_CUDA_ARCH_LIST=7.5
export FORCE_CUDA="1"
export PATH=$PATH:/opt/cuda/bin
export PATH=$PATH:/opt/metasploit
export PNPM_HOME=/home/stm/.pnpm/bin
export PATH=$PATH:$PNPM_HOME
export PATH=$PATH:/home/stm/.cargo/bin
export PATH=$PATH:/home/stm/.local/share/gem/ruby/3.0.0/bin
export PATH="$HOME/.phpenv/bin:$PATH"
export PATH=$PATH:$XDG_CONFIG_HOME/composer/vendor/bin
export EDITOR=vim
export NDK_HOME=/home/stm/android-ndk-r25c
export ANDROID_HOME=/home/stm/Android/Sdk

export OPENSSL_INCLUDE_DIR=/usr/include/openssl-1.1/
export OPENSSL_LIB_DIR=/usr/lib/openssl-1.1

eval "$(phpenv init -)"

alias turbo='sudo /home/stm/acer-predator-turbo-and-rgb-keyboard-linux-module/install.sh'
alias cr="cargo run"
alias cb="cargo build"
alias file-manager=joshuto
alias tree="tree -I 'node_modules|vendor'"
alias todo-list="nvim ~/todo.md"
# alias zoom="/home/stm/Downloads/zoom/zoom/ZoomLauncher"
#
#


# Last command it runs.. shown in tmux window name
update_tmux_window_name() {
  if [ -n "$TMUX" ]; then
    local window_name
    if [[ $1 == "nvim" ]] || [[ $1 == "vim" ]] || [[ $1 == "vi" ]]; then
      window_name="$1 - $(basename $PWD)"
    else
      window_name="$(echo $1 | cut -c 1-50)"
    fi

    if [[ ${#window_name} -gt 15 ]]; then
      window_name="${window_name:0:15}..."
    fi

    tmux rename-window "$window_name"
  fi
}
autoload -Uz add-zsh-hook

add-zsh-hook preexec update_tmux_window_name

pcd() {
  REGISTERED_PATHS_FILE=~/.registered_paths

  # Choose a path using fzf and change the current directory
  SELECTED_PATH=$(cat $REGISTERED_PATHS_FILE | fzf)
  if [ -n "$SELECTED_PATH" ]; then
    cd "$SELECTED_PATH"
  fi
}

project_vim() {
  #  see. ~/scripts/registered_paths.sh
  #  Set the path to the registered_paths file
  REGISTERED_PATHS_FILE=~/.registered_paths

  # Choose a path using fzf and open with Vim
  SELECTED_PATH=$(cat $REGISTERED_PATHS_FILE | fzf)
  if [ -n "$SELECTED_PATH" ]; then
    cd "$SELECTED_PATH"
    nvim ./
  fi
}
source /usr/share/nvm/init-nvm.sh
alias ilp-settlement-ethereum="RUST_LOG=interledger_settlement,ilp_settlement_ethereum=debug cargo run --bin ilp-settlement-ethereum --"
alias ilp-node="cargo run --bin ilp-node --"
alias ilp-cli="cargo run --bin ilp-cli --"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
