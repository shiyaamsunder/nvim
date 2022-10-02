This is a minimal version of my nvim config with less number of plugins.

## Prerequistes

Install ripgrep

`sudo apt-get install ripgrep`

Then set `rg` (ripgrep) as the default binary for fzf by editing the .bashrc file

```bash
export FZF_DEFAULT_COMMAND='rg --files'
```

Then install node js. I prefer using nvm to install nodejs.
First install [nvm](https://github.com/nvm-sh/nvm#installing-and-updating)

`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`


Installing LTS node version using nvm
`nvm install --lts`

## How to use this

- Clone this repo 
`git clone -b minimal https://github.com/shiyaamsunder/nvim.git ~/.config/nvim`
