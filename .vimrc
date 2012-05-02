set nocompatible

set number
set numberwidth=5

"set autochdir

"set fullscreen

set transparency=5
set anti

set nowrap

if has("gui_running")
    set guioptions=egmrt
endif

:colorscheme desert
set guifont=Inconsolata:h14

syntax enable
set autoread

"Enable filetype plugin
filetype plugin on
filetype indent on

"indentation
"set autoindent
"set smartindent
"set cindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Set to auto read when a file is changed from the outside

set hlsearch
set incsearch
set showmatch
set ruler
set showtabline=2

set encoding=utf8

"highlighw LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight LineNr ctermbg=white ctermfg=black
highlight OverLength ctermbg=black guibg=#592929
match OverLength /\%81v.\+/

nnoremap <C-R> :tabfind<Space>
nnoremap <C-h> :Grep --exclude-dir=.svn -rnH <C-R><C-W> .
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>
nnoremap <C-c> :cclose<CR>
nnoremap <C-j> /<C-R><C-W><CR>

nmap ,tt :tabnew .<CR>
nmap ,tp :tabprev<CR>
nmap <C-left> :tabprev<CR>
nmap ,tn :tabnext<CR>
nmap <C-right> :tabnext<CR>
nmap ,tc :tabclose<CR>
nmap ,tl :tablast<CR>
nmap ,tf :tabfirst<CR>  

command! Rhino !java -jar /usr/local/lib/rhino/js.jar %
nmap ,r :Rhino<CR>
command! V8 !v8 %
nmap ,v :V8<CR>

"autocmd BufWriteCmd *.js :call CompileJS()
"function! CompileJS()
    "if &modified
        "write
        "let fn = expand('%:p')
        "let pn = expand('%:p:h')
        "let fnm = expand('%:r.js')
        "let cpa = '/home/ubuntu-lenovo/.vim/clousure-compiler/compiler.jar'
        "execute "! java -jar " . cpa . " --js=" . fn . " --js_output_file=" . pn . "/" . fnm . ".min.js"
    "endif
"endfunction

"ruby autocomplet
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

