"=============================================================================
" File: ghcup.vim
" Author: Julian Ospald
" Created: 2020-08-23
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_ghcup')
    finish
endif
let g:loaded_ghcup = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

command! Ghcup
      \  call ghcup#ghcup_start()

let &cpoptions = s:save_cpo
unlet s:save_cpo

