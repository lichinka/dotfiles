" Plugin collection
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'techlivezheng/vim-plugin-minibufexpl'
Plug 'rking/ag.vim'
"Plug 'joonty/vdebug'
call plug#end()

"
" Common settings
"
filetype plugin indent on
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set foldmethod=syntax
let g:mapleader=','
" Search and Replace
nnoremap <Leader>s :%s//g<Left><Left>

"
" Use deoplete
"
let g:deoplete#enable_at_startup = 1

"
" GUI settings
"
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ 13
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l  "remove left-hand scroll bar
endif

"
" Defx settings
"
augroup vimrc_defx
  autocmd!
  autocmd FileType defx call s:defx_mappings()     " Defx mappings
  autocmd VimEnter * call s:setup_defx()
  "autocmd VimEnter * call fugitive#detect(expand('<afile>'))
augroup END

nnoremap <Leader>n :call <sid>defx_open({ 'split': v:true })<CR>
nnoremap <Leader>hf :call <sid>defx_open({ 'split': v:true, 'find_current_file': v:true })<CR>

function! s:setup_defx() abort
  call defx#custom#column('filename', {
        \ 'min_width': 80,
        \ 'max_width': 80,
        \ })

  call defx#custom#option('_', {
        \ 'columns': 'git:icons:filename:size:time',
        \ })

  call s:defx_open({ 'dir': expand('<afile>') })
endfunction

function! s:defx_open(...) abort
  let l:opts = get(a:, 1, {})
  let l:path = get(l:opts, 'dir', getcwd())

  if !isdirectory(l:path) || &filetype ==? 'defx'
    return
  endif

  let l:args = '-winwidth=40 -direction=topleft'
  let l:is_opened = bufwinnr('defx') > 0

  if has_key(l:opts, 'split')
    let l:args .= ' -split=vertical'
  endif

  if has_key(l:opts, 'find_current_file')
    if &filetype ==? 'defx'
      return
    endif
    call execute(printf('Defx %s -search=%s %s', l:args, expand('%:p'), expand('%:p:h')))
  else
    call execute(printf('Defx -toggle %s %s', l:args, l:path))
    if l:is_opened
      call execute('wincmd p')
    endif
  endif

  return execute("norm!\<C-w>=")
endfunction

function! s:defx_context_menu() abort
  let l:actions = ['new_multiple_files', 'rename', 'copy', 'move', 'paste', 'remove']
  let l:selection = confirm('Action?', "&New file/directory\n&Rename\n&Copy\n&Move\n&Paste\n&Delete")
  silent exe 'redraw'

  return feedkeys(defx#do_action(l:actions[l:selection - 1]))
endfunction

function! s:defx_mappings() abort
  nnoremap <buffer>m :call <sid>defx_context_menu()<CR>
  nnoremap <buffer><expr> o defx#do_action('drop')
  nnoremap <buffer><expr> <CR> defx#do_action('drop')
  nnoremap <buffer><expr> <2-LeftMouse> defx#do_action('drop')
  nnoremap <buffer><expr> s defx#do_action('open', 'botright vsplit')
  nnoremap <buffer><expr> R defx#do_action('redraw')
  nnoremap <buffer><expr> u defx#do_action('cd', ['..'])
  nnoremap <buffer><expr> cd defx#do_action('change_vim_cwd')
  nnoremap <buffer><expr> H defx#do_action('toggle_ignored_files')
  nnoremap <buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <buffer><expr> yy defx#do_action('yank_path')
  nnoremap <buffer><expr> q defx#do_action('quit')
  nnoremap <buffer><expr> gh defx#do_action('cd', [getcwd()])
endfunction

"
"additoins
"
set title
set wildmenu
set completeopt=menuone,preview
set ruler
set cursorline

set hlsearch
set incsearch
set showmatch

"
" MiniBufExpl options
"
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

""
"" VDebug options
""
"" Allows Vdebug to bind to all interfaces.
"let g:vdebug_options = {}
"
"" Stops execution at the first line.
"let g:vdebug_options['break_on_open'] = 1
"let g:vdebug_options['max_children'] = 128
"
"" Use the compact window layout.
"let g:vdebug_options['watch_window_style'] = 'compact'
"
"" Need to set as empty for this to work with Vagrant boxes.
"let g:vdebug_options['server'] = ""
"let g:vdebug_options['port'] = "9009"
"
"" Mapping '/remote/path' : '/local/path'
"let g:vdebug_options['path_maps'] = {'/var/www/f3/' : '/home/luka/ownCloud/etc/delaius/www/f3/public_html/'}
