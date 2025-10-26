# NeoVim Config

## Setup

### NeoVim

1. `brew install neovim`

#### Supporting Software

- `brew install lazygit` - For lazygit, the interactive git UI
- `brew install font-hack-nerd-font` For neotree's icons
- `brew install ripgrep` - for global text search

### Go Language Server

1. `brew install go`
2. `go install golang.org/x/tools/gopls@latest`
3. Fix your PATH by appending this to your `.zshrc` or `.bash_profile`
```
cat >> ~/.zshrc << 'EOF'

  # GO for NeoVim START
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:/opt/homebrew/bin:$PATH
  # GO for NeoVim END
  EOF
```

### Configure NeoVim

1. `cd ~/.config`
2. `git clone https://github.com/maxbethke/neovim.git nvim`
