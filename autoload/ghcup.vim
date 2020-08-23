"=============================================================================
" File: ghcup.vim
" Author: Julian Ospald
" Created: 2020-08-23
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_ghcup')
  finish
endif
let g:loaded_ghcup = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

" Public

function! ghcup#ghcup_start() abort
  call s:exec_ghcup_command('tui')
endfunction



" Private

function! s:ghcup_available() abort
  if !executable('ghcup')
    echoerr 'You need to install ghcup.'
    return 0
  endif
  return 1
endfunction

function! s:ghcup_callback(exit_code) abort
  if a:exit_code == 0
    if has('nvim')
      silent! Bclose!
    else
      let current_buf = bufnr('%')
      silent! buffer #
      " NOTE: Prevent to quit vim
      if winnr('$') == 1 && bufnr('%') ==# current_buf
        enew
      endif
    endif
  endif

endfunction

function! s:exec_ghcup_command(ghcup_args) abort
  if !s:ghcup_available()
    return
  endif

  let current_dir = getcwd()

  let command = 'ghcup' . ' ' . a:ghcup_args
  if has('nvim')
    enew
    call termopen(command, {
          \ 'name': 'ghcup',
          \ 'on_exit': {job_id, code, event -> s:ghcup_callback(code)},
          \ })
    startinsert
  elseif has('terminal')
    call term_start('env ' . command, {
         \ 'term_name': 'ghcup',
         \ 'curwin': v:true,
         \ 'term_finish': 'close',
         \ 'exit_cb': {status, code -> s:ghcup_callback(code)},
         \ })
  else
    echoerr 'ghcup.vim: no terminal'
	return
  endif
  " NOTE: Back to current_dir
  execute 'lcd ' . fnamemodify(current_dir, ':p')
  redraw!
endfunction

" Initialize

" NOTE: '<sfile>' must be called top level
let s:plugin_root=expand('<sfile>:p:h:h')

let &cpoptions = s:save_cpo
unlet s:save_cpo


