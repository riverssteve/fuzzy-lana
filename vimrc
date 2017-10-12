
" vimrc 2.1.0
" Steve Rivers steve@futrli.com

" Setup Plug {{{
set nocompatible              " be iMproved, required
filetype off                  " required

fun! EnsureVundleIsOnDisk(plugin_root_dir)
    let vam_autoload_dir = a:plugin_root_dir.'/autoload/plug.vim'
    if isdirectory(vam_autoload_dir)
        return 1
    else
        echo "vim-plug not installed, see https://github.com/junegunn/vim-plug#unix"
    endif
endfun

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'sjl/Gundo.vim'
Plug '~/repos/lycosaexplorer'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'liuchengxu/space-vim-dark'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'valloric/MatchTagAlways'
Plug 'w0rp/ale'
"Plug 'keith/swift'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'liuchengxu/eleline.vim'

" Initialize plugin system
call plug#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" Basic Settings {{{
filetype plugin indent on    " required
syntax on                    " we want syntax highlighting!

let g:skip_loading_mswin=1
let mapleader = "," " Set <leader> to ,

set fileencoding=utf-8
set encoding=utf-8

colorscheme space-vim-dark
"hi Comment term=italic cterm=italic
" }}}
" Advanced Settings {{{

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"

set backspace=indent,eol,start    " Allow backspacing over autoindent, line breaks and start of insert
set display=lastline,uhex         " Show the last line instead of '@'; show non-printable chars as <hex>
set esckeys                       " Allow sane use of cursor keys in various modes
set foldenable                    " Enable code folding
set foldlevelstart=10             " Open most folds by default
set foldnestmax=6                 " Set maximum number of nested folds
set foldmethod=indent             " Set fold based on indent level
set hidden                        " unsaved buffers allowed in the buffer list without saving
set hlsearch                      " Highlight the current search
set ignorecase                    " Usually I don't care about case when searching
set incsearch                     " Show matches as you type
set laststatus=2                  " Always show a status line.
set lazyredraw                    " Don't redraw during macros etc.
set list                          " display leading tabs as >· and trailing spaces as ·
set listchars=tab:»·,trail:·
set modeline                      " Look for embedded modelines at the top of the file.
set modelines=10                  " Don't look any further than this number of lines
set mousehide                     " Hide the mouse pointer while typing
set noerrorbells                  " enough with the beeping already!
set noshowmode                    " Hide mode text under powerbar
set nostartofline                 " keep cursor's column
set noswapfile                    " it's 2013, Vim.
set notextmode                    " Don't append bloody carriage returns.
set ruler                         " Enable ruler on status line.
set shiftround                    " Round indent to shiftwidth multiple, applies to < and >
set shortmess=atI                 " Shorter status messages.
set showcmd                       " Show (partial) command in status line.
set showmatch                     " Show matching ()'s []'s {}'s
set smartcase                     " only search case sensitively when not doing al all-lowercase search
set splitbelow                    " Split horizontally below.
set splitright                    " Split vertically to the right.
set title                         " Better xterm titles
set ttyfast                       " Terminal connection is fast
set ttimeoutlen=50                " Faster exit from insert mode
set whichwrap=b,s,h,l,<,>,[,],~   " Wrap to the previous/next line on all keys and ~ command
set wildignore+=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*.orig
set wildmenu                      " Better filename completion etc.
set wildmode=longest:full,full    " Complete only up to the point of ambiguity
                                  " (while still showing you what your options are)

" Special Area for Tab Settings
set expandtab                     " tabs are spaces
set tabstop=4                     " number of visual spaces per TAB
set softtabstop=4                 " number of spaces in tab when editing
" }}}
" Plugin Settings {{{

" Ack.vim {{{

" If ag exists then use it 
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Search under cursor
" https://github.com/mileszs/ack.vim/issues/33
noremap <leader>a :Ack <cword><cr>
" }}}
" ALE {{{
let g:ale_statusline_format = ['ERROR:%d', 'WARNING:%d', 'OK']

" For a more fancy ale statusline
function! ALEGetError()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
            return ' ERROR ' . matchstr(l:e_w[0], '\d\+') .' '
        endif
    endif
endfunction

function! ALEGetWarning()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2
            return ' WARNING ' . matchstr(l:e_w[1], '\d\+')
        elseif match(l:e_w, 'W') > -1
            return ' WARNING ' . matchstr(l:e_w[0], '\d\+')
        endif
    endif
endfunction

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'

let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 0

let g:ale_linters = {
\   'html': ['htmlhint'],
\   'js': ['eslint']
\}

nmap <Leader>en <Plug>(ale_next)
nmap <Leader>ep <Plug>(ale_previous)


" }}}
" CTRL-P {{{

"set wildignore+=*/.git/*
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/](env|.git)$',
  "\ 'file': '\v\.(pyc|orig|exe|so|dll)$',
  "\ }
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}
" FZF {{{

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" }}}
" LycosaExplorer {{{
" Link - (http://www.vim.org/scripts/script.php?script_id=3659)
"  <Leader>lf  - Opens the filesystem explorer.
"  <Leader>lr  - Opens the filesystem explorer at the directory of the current file.
"  <Leader>lb  - Opens the buffer explorer.
let g:SuperTabDefaultCompletionType = "context"
" }}}
" NERD Commenter {{{
" ,cc |NERDComComment| Comments out the current line or text selected in
"    visual mode.
" ,cn |NERDComNestedComment| Same as |NERDComComment| but forces nesting.
" ,c<space> |NERDComToggleComment| Toggles the comment state of the
"    selected line(s).  If the topmost selected line is commented, all
"    selected lines are uncommented and vice versa.
" ,cm |NERDComMinimalComment| Comments the given lines using only one set
"    of multipart delimiters if possible.
" ,ci |NERDComInvertComment| Toggles the comment state of the selected
"    line(s) individually.  Each selected line that is commented is
"    uncommented and vice versa.
" ,cs |NERDComSexyComment| Comments out the selected lines 'sexily'
" ,cy |NERDComYankComment| Same as |NERDComComment| except that the
"    commented line(s) are yanked before commenting.
" ,c$ |NERDComEOLComment| Comments the current line from the cursor to
"    the end of line.
" ,cA |NERDComAppendComment| Adds comment delimiters to the end of line
"    and goes into insert mode between them.
" ,cI |NERDComPrependComment| Adds comment delimiters to the start of line
"    and goes into insert mode between them.
" |NERDComInsertComment| Adds comment delimiters at the current cursor
"    position and inserts between. Disabled by default.
" ,ca |NERDComAltDelim| Switches to the alternative set of delimiters.
" ,cl OR ,cr OR ,cb |NERDComAlignedComment| Same as |NERDComComment|
"    except that the delimiters are aligned down the left side (,cl), the
"    right side (,cr) or both side (,cb).
" ,cu |NERDComUncommentLine| Uncomments the selected line(s)
"}}}
" NERDTree {{{

let NERDTreeWinSize=40

" Toggle NERDTree with \e
nmap \n :NERDTreeToggle<CR>

" Load NERDtree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" }}}
" Python-mode-klen {{{
let g:pymode_doc = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_run = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
" }}}
" YouCompleteMe {{{
let g:ycm_autoclose_preview_window_after_completion=1
" }}}
" vim-indent-guides {{{
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=15
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
" }}}

" }}}
" Commands {{{

" Close current buffer
nmap \d :BD<CR>

" sudo write
cabbrev w!! w !sudo tee >/dev/null "%"

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Ctrl-w Shift-n to open new vertical split
nmap <silent><C-w><S-n> :vnew<CR>

" Last used buffer
nmap <C-e> :e#<CR>

" Open FZF 
nmap <C-p> :FZF<CR>

" Highlight last inserted text
nnoremap gV `[V`]

" Bubble lines of text (Uses Tim Pope's "unimpaired" script)
" Bubble single lines
nmap <silent><C-k> [e
nmap <silent><C-j> ]e
" Bubble visual lines
vmap <silent><C-j> ]egv
vmap <silent><C-k> [egv

" Select previously pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" To close syntastic window, :lcl

" Disable cursor keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Disable the help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Disable Ex mode
noremap Q <nop>


" LEADER SETTINGS

" Toggle Cursor line
 map <silent> <Leader>tl      :set                  cursorline! <CR>
imap <silent> <Leader>tl <Esc>:set                  cursorline! <CR>a

" Toggle Cursor column
 map <silent> <Leader>tc      :set   cursorcolumn!              <CR>
imap <silent> <Leader>tc <Esc>:set   cursorcolumn!              <CR>a

" Toggle Cursor column and cursor line
 map <silent> <Leader>ta      :set   cursorcolumn!  cursorline! <CR>
imap <silent> <Leader>ta <Esc>:set   cursorcolumn!  cursorline! <CR>a

" Set Cursor column and cursor line
 map <silent> <Leader>sa      :set   cursorcolumn   cursorline  <CR>
imap <silent> <Leader>sa <Esc>:set   cursorcolumn   cursorline  <CR>a

" Unset Cursor column and cursor line
 map <silent> <Leader>ua      :set nocursorcolumn nocursorline  <CR>
imap <silent> <Leader>ua <Esc>:set nocursorcolumn nocursorline  <CR>a

nmap <leader>g :GundoToggle<CR>
nmap <leader>n :bnext<CR>
nmap <leader>p :bprevious<CR>
nmap <leader>r :registers<cr>

" }}}
" Functions {{{

" LINE NUMBERS
set relativenumber " have line numbers show as relative to current line
set number         " also show current line number
let s:color_column_old = 0
function! s:ToggleColorColumn()
    set invrelativenumber relativenumber?
    set invlist
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction
nmap <c-n><c-n> :call <SID>ToggleColorColumn()<CR>

function! s:AddKeyword()
    setlocal iskeyword+=-
endfun

" Set up coding styles - ruler and indent size
function! s:CodingStyleFiletypes(tabstop_length, show_col)
    " Let filetype indentation do its own thing
    setlocal nocindent
    setlocal nosmartindent

    " mark the 80th col to avoid overstepping programming style
    if a:show_col == 'on'
        setlocal colorcolumn=120
        setlocal textwidth=120
    endif

    " Set 'formatoptions' to break comment lines but not other lines,
    " and insert the comment leader when hitting <CR> or using 'o'.
    setlocal formatoptions-=t formatoptions+=croql

    setlocal expandtab
    setlocal smarttab " unsure about this for now?
    let &l:shiftwidth = a:tabstop_length
    let &l:softtabstop = a:tabstop_length
    setlocal tabstop=8
endfun

augroup myStartup
    autocmd!
    autocmd FileType python setlocal commentstring=#\ %s

    " Set tab stops and whether to show ruler
    autocmd FileType css,less,scss,python,sh call <SID>CodingStyleFiletypes(4, 'on')
    autocmd FileType fish,groovy,vim,zsh call <SID>CodingStyleFiletypes(4, 'off')
    autocmd FileType javascript,xml,html,htmldjango,yml,yaml call <SID>CodingStyleFiletypes(2, 'off')

    "au Filetype html,xml,xsl source ~/.vim/vim-addons/closetag/plugin/closetag.vim

    " Auto-reload .vimrc on changes
    autocmd BufWritePost ~/.vimrc source ~/.vimrc

    " * should match - as well as _ when searching under the cursor
    autocmd FileType css,less,scss,vim,html,htmldjango call <SID>AddKeyword()
augroup END

au BufRead,BufNewFile *.less               set filetype=less
au BufRead,BufNewFile *.md                 set filetype=markdown
au BufRead,BufNewFile Dockerfile.*         set filetype=dockerfile
au BufRead,BufNewFile Jenkinsfile          set filetype=groovy

" }}}

" vim:foldmethod=marker:foldlevel=0
