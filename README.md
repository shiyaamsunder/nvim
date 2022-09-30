This is a minimal version of my nvim config with less number of plugins.

## Prerequistes

Install ripgrep

`sudo apt-get install ripgrep`

Then set `rg` (ripgrep) as the default binary for fzf by editing the .bashrc file

```bash
export FZF_DEFAULT_COMMAND='rg --files'
```

## How to use this

- Clone this repo 
`git clone -b minimal https://github.com/shiyaamsunder/nvim.git ~/.config/nvim`
