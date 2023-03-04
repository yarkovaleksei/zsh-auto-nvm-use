# Checks if a file .nvmrc exists in a directory, and if so, change Node.js version.
# If the file does not exist, it changes the Node.js version to the default.
_zsh_auto_nvm_use() {
  if [[ $(command -v nvm) != "nvm" ]]; then
    # nvm is not installed
    return 0
  fi

  local node_version="$(nvm version)"

  # File .npmrc exists in current folder
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    # Read the Node.js version from the file and check whether it is installed or not
    local nvmrc_node_version=$(nvm version "$(cat .nvmrc)")

    # Node.js version is not installed
    if [ "$nvmrc_node_version" = "N/A" ]; then
      # Install Node.js version from file
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      # Change Node.js version from file
      nvm use
    fi
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    # Reverting to nvm default version
    nvm use default
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _zsh_auto_nvm_use
_zsh_auto_nvm_use