# ghcup.vim

Vim plugin to use [GHCup](https://gitlab.haskell.org/haskell/ghcup-hs) from within vim buffers.
* Seamless switching between Vim and GHCup
* Support Vim8 / NeoVim terminal

Code and ideas inspired from [tig-explorer](https://github.com/iberianpig/tig-explorer.vim).

## Requirement

* [GHCup](https://www.haskell.org/ghcup/)

## Installation

```vim
" vim-plug
Plug 'hasufell/ghcup'

" NeoBundle
NeoBundle 'hasufell/ghcup'
```

**NOTE: If you use Neovim, you have to add the dependency to the plugin bclose.vim:**

```vim
" vim-plug
Plug 'rbgrouleff/bclose.vim'

" NeoBundle
NeoBundle 'rbgrouleff/bclose.vim'
```

## Usage

### Keymap on Vim

Add following script to ~/.vimrc

```vim
" open ghcup in the current buffer
nnoremap <Leader>g :GHCup<CR>
```
