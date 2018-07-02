" Anciety's personal (Neo)vim config

"""""""""""""""""""""""""""""""
" basic configs
"""""""""""""""""""""""""""""""
syntax on
filetype on
filetype plugin on
set ignorecase
set incsearch
set wildmenu
set nu
syntax enable
set background=dark
let g:solarized_termcolors=256
filetype indent on
set shiftwidth=4
set autoindent
set tabstop=4
set expandtab
set mouse=a
let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"

""""""""""""""""""""""""""""""""
" Plugin specific configs
""""""""""""""""""""""""""""""""

"########################"
" LanguageClient-neovim
"########################"

set hidden


let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyls'],
    \ 'cpp': ['cquery', '--language-server', '--log-stdin-stdout-to-stderr', '--log-file=/tmp/cquery.log']
    \ }

" cquery needed
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/anciety/.config/nvim/cquery/settings.json'

" mappings
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"##########################"
" deoplete-nvim
"##########################"
set runtimepath+=/home/anciety/.config/nvim/plugged/deoplete.nvim
let g:deoplete#enable_at_startup = 1

filetype plugin indent on
syntax enable

" key bindings (tab support)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

"----------------------------------------------------------
" Neovim's Python provider
"----------------------------------------------------------

" Clipbord
set clipboard+=unnamedplus  " use clipboard ( see : help clipboard )

" Mouse ( see :help mouse-using )
set mouse=nvic

""""""""""""""""""""""""""""""""
" All plugins
""""""""""""""""""""""""""""""""

" plugins
call plug#begin()

" language server support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
