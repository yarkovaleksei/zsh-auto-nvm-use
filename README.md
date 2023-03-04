# zsh-auto-nvm-use
An Oh-My-Zsh Plugin that automatically loads the node version specified in `.nvmrc`.

## Installation
Clone this repo into `~/.oh-my-zsh/custom/plugins` (or wherever your plugins are configured to live)

```bash
git clone https://github.com/yarkovaleksei/zsh-auto-nvm-use ~/.oh-my-zsh/custom/plugins/zsh-auto-nvm-use
```

Update the plugins config in your `~/.zshrc` file to include `zsh-auto-nvm-use`:

```bash
plugins=(zsh-auto-nvm-use)
```

## Usage
If a directory has a file named `.nvmrc` in it, then when you `cd` into that directory
this plugin will read the contents of the file and change or install Node.js with version written in this file.
