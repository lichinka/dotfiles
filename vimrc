"
" Pathogen load (for python-mode bundle)
"
"filetype off
"call pathogen#infect()
"call pathogen#helptags()

filetype off
filetype plugin indent on
syntax on

"
" GUI settings
"
if has('gui_running')
  set guifont=Lucida\ Console\ Semi-Condensed\ 14
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l  "remove left-hand scroll bar
endif

"
" Settings for editing Python code
"
"colorscheme slate
colorscheme desert
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set foldmethod=syntax

"
" Python interpreter
" 
let g:python = "/usr/bin/python2"

"
" Python documentation
"
" Load show documentation plugin
let g:pymode_doc = 1
" Key for show python documentation
let g:pymode_doc_key = 'K'
" Executable command for documentation search
let g:pydoc = "/usr/bin/pydoc2"

"
" Python code checking
"
" Load pylint code plugin
let g:pymode_lint = 1

" Switch pylint or pyflakes code checker
" values (pylint, pyflakes)
let g:pymode_lint_checker = "pylint"

" Run linter on the fly
let g:pymode_lint_onfly = 0

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"

" Check code every save
let g:pymode_lint_write = 1

" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1

" Auto jump on first error
let g:pymode_lint_jump = 0

" Place error signs
let g:pymode_lint_signs = 1

" Minimal height of pylint error window
let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6

"
" Python Rope refactoring library
"
" Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1

let g:pymode_rope_autoimport_underlineds = 0

let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 1

let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<C-x>p"

let g:pymode_rope_local_prefix = "<C-c>r"

let g:pymode_rope_vim_completion = 1

let g:pymode_rope_guess_project = 1

let g:pymode_rope_goto_def_newwin = 0

let g:pymode_rope_always_show_complete_menu = 0

"
" Python Misc stuff
"
" Load python objects and motion
let g:pymode_motion = 1

" Load breakpoints plugin
let g:pymode_breakpoint = 1

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'

" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1

" Set default pymode python indent options
let g:pymode_options_indent = 1

" Set default pymode python fold options
let g:pymode_options_fold = 0
let g:pymode_folding = 0

" Set default pymode python other options
let g:pymode_options_other = 1


"
"additoins
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
