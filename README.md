## Install instructions


Install `Ripgrep` and `SilverGrep` for fuzzy finding.

Installing rip-grep
```bash
$ sudo apt-get install ripgrep
```
Installing silver-grep
```bash
$ sudo apt-get install silversearcher-ag
```

Then set `rg` as the default binary for fzf by editing the .bashrc file

In my case its zsh. So it is .zshrc

```zsh
export FZF_DEFAULT_COMMAND='rg --files'
```

Then clone the repo to `~/.config/nvim`

```bash
git clone https://github.com/shiyaamsunder/nvim-config.git ~/.config/nvim
```


