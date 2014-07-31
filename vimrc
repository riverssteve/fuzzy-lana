set nocompatible | filetype indent plugin on | syn on
let g:skip_loading_mswin=1

set fileencoding=utf-8
set encoding=utf-8
set shell=/bin/zsh

" Syntax highlighting
syntax on

" ==============================================================================
" VAM

fun! EnsureVamIsOnDisk(plugin_root_dir)
    " windows users may want to use http://mawercer.de/~marc/vam/index.php
    " to fetch VAM, VAM-known-repositories and the listed plugins
    " without having to install curl, 7-zip and git tools first
    " -> BUG [4] (git-less installation)
    let vam_autoload_dir = a:plugin_root_dir.'/vim-addon-manager/autoload'
    if isdirectory(vam_autoload_dir)
        return 1
    else
        if 1 == confirm("Clone VAM into ".a:plugin_root_dir."?","&Y\n&N")
            " I'm sorry having to add this reminder. Eventually it'll pay off.
            call confirm("Remind yourself that most plugins ship with ".
                        \"documentation (README*, doc/*.txt). It is your ".
                        \"first source of knowledge. If you can't find ".
                        \"the info you're looking for in reasonable ".
                        \"time ask maintainers to improve documentation")
            call mkdir(a:plugin_root_dir, 'p')
            execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.
                        \ shellescape(a:plugin_root_dir, 1).'/vim-addon-manager'
            " VAM runs helptags automatically when you install or update
            " plugins
            exec 'helptags '.fnameescape(a:plugin_root_dir.'/vim-addon-manager/doc')
        endif
        return isdirectory(vam_autoload_dir)
    endif
endfun

fun! SetupVAM()
    " Set advanced options like this:
    " let g:vim_addon_manager = {}
    " let g:vim_addon_manager.key = value
    " Pipe all output into a buffer which gets written to disk
    " let g:vim_addon_manager.log_to_buf =1

    " Example: drop git sources unless git is in PATH. Same plugins can
    " be installed from www.vim.org. Lookup MergeSources to get more control
    " let g:vim_addon_manager.drop_git_sources = !executable('git')
    " let g:vim_addon_manager.debug_activation = 1

    " VAM install location:
    let c = get(g:, 'vim_addon_manager', {})
    let g:vim_addon_manager = c
    let c.plugin_root_dir = expand('$HOME/.vim/vim-addons', 1)
    if !EnsureVamIsOnDisk(c.plugin_root_dir)
        echohl ErrorMsg | echomsg "No VAM found!" | echohl NONE
        return
    endif
    let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'

    " Tell VAM which plugins to fetch & load:
    call vam#ActivateAddons([])
    " UI
    "ActivateAddons github:scrooloose/nerdtree
    "ActivateAddons powerline
    "ActivateAddons neocomplete
    ActivateAddons Gundo
    ActivateAddons LycosaExplorer
    ActivateAddons Syntastic
    ActivateAddons Tagbar
    ActivateAddons vim-airline
    ActivateAddons YouCompleteMe

    " VIM movement addons
    ActivateAddons AutoFenc
    ActivateAddons Emmet
    ActivateAddons The_NERD_Commenter
    ActivateAddons VimOutliner
    ActivateAddons breeze
    ActivateAddons repeat
    ActivateAddons surround
    ActivateAddons unimpaired
    ActivateAddons github:nathanaelkane/vim-indent-guides
    ActivateAddons vim-pi

    " Language Addons
    ActivateAddons Python-mode-klen
    ActivateAddons vim-css3-syntax
    ActivateAddons vim-less
    ActivateAddons vim-javascript
    ActivateAddons vim-coffee-script

    " Themes
    "ActivateAddons vilight
    "ActivateAddons jellybeans
    "ActivateAddons github:marcelbeumer/twilight.vim
    "ActivateAddons xoria256
    "ActivateAddons github:jonathanfilip/vim-lucius
    "ActivateAddons github:sickill/vim-monokai
    "ActivateAddons molokai
    ActivateAddons Solarized

    " Addons are put into plugin_root_dir/plugin-name directory
    " unless those directories exist. Then they are activated.
    " Activating means adding addon dirs to rtp and do some additional
    " magic

    " How to find addon names?
    " - look up source from pool
    " - (<c-x><c-p> complete plugin names):
    " You can use name rewritings to point to sources:
    " ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
    " ..ActivateAddons(["github:user/repo", .. => github://user/repo
    " Also see section "2.2. names of addons and addon sources" in VAM's documentation
endfun
call SetupVAM()

" ===========================================================================
" THEME

if &term =~ '^\(xterm\|screen\|screen-color256-bce\|linux\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
colorscheme solarized
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_italic=1

" ===========================================================================
" GVIM SETTINGS
if has("gui_running")
    set background=light
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set mouse=         "Disable mouse
    if has("gui_gtk2")
        set guifont=Fantasque\ Sans\ Mono\ 12
    elseif has("gui_macvim")
    elseif has("gui_win32")
    endif

    set lines=55 columns=190
endif

" ===========================================================================
" PLUGIN SETTINGS

" Airline ----------------------------------------------------------------

" Airline Theme
let g:airline_theme='solarized'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" None

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'

let g:airline#extensions#syntastic#enabled = 1

" Breeze -----------------------------------------------------------------
"let g:breeze_highlight_curr_element = 0
"hi htmlTagHighlightGroup gui=NONE cterm=NONE ctermbg=4 ctermfg=16
"let g:breeze_hl_color_darkbg = "htmlTagHighlightGroup"

" EasyMotion -------------------------------------------------------------
" Type <Leader><Leader>w to trigger the word motion w.  When the motion is
" triggered, the text is updated (no braces are actually added, the text
" is highlighted in red by default):
"
"    <cursor>Lorem {a}psum {b}olor {c}it {d}met.
"
" Press "c" to jump to the beginning of the word "sit":
"
"    Lorem ipsum dolor <cursor>sit amet.

" Emmet ------------------------------------------------------------------
" Only run on HTML, CSS and LESS files
let g:user_emmet_install_global = 0

" LycosaExplorer ---------------------------------------------------------
" Link - (http://www.vim.org/scripts/script.php?script_id=3659)
"  <Leader>lf  - Opens the filesystem explorer.
"  <Leader>lr  - Opens the filesystem explorer at the directory of the current file.
"  <Leader>lb  - Opens the buffer explorer.
let g:SuperTabDefaultCompletionType = "context"

" neocomplcache ----------------------------------------------------------
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" NERD Commenter ---------------------------------------------------------
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

" NERDtree ---------------------------------------------------------------
let NERDTreeIgnore=['\.swp$', '\.pyc$', '\.orig$']

" Open NERDtree with
silent! nmap <leader>lt :NERDTreeToggle<CR>
silent! map <leader>lf :NERDTreeFind<CR>

" Python-mode-klen -------------------------------------------------------
let g:pymode_doc = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope = 0 
let g:pymode_rope_completion = 0
let g:pymode_run = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6

" Syntastic settings -----------------------------------------------------
let g:syntastic_python_checkers=['flake8']
let g:syntastic_enable_signs=1 " Mark buffer with 'signs'
let g:syntastic_auto_loc_list=1 " Open location list if there are errors

" YouCompleteMe ----------------------------------------------------------
"let g:ycm_autoclose_preview_window_after_completion=1

" VIM-inden-guide --------------------------------------------------------
"let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=0

" ------------------------------------------------------------------------
"                                                             CODING STYLE
" ------------------------------------------------------------------------
function! s:CodingStyleFiletypes(tabstop_length, show_col)
    " Let filetype indentation do its own thing
    setlocal nocindent
    setlocal nosmartindent

    " mark the 80th col to avoid overstepping programming style
    if a:show_col == 'on'
        setlocal colorcolumn=80
        setlocal textwidth=80
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
    autocmd FileType javascript,python,sh call <SID>CodingStyleFiletypes(4, 'on')
    autocmd FileType css,less,vim call <SID>CodingStyleFiletypes(4, 'off')
    autocmd FileType html,htmldjango,coffee call <SID>CodingStyleFiletypes(2, 'off')
    autocmd FileType xml call <SID>CodingStyleFiletypes(2, 'on')
    autocmd FileType fish call <SID>CodingStyleFiletypes(4, 'off')
    autocmd FileType htmldjango let b:surround_{char2nr("%")} = "{% \r %}"
    autocmd FileType htmldjango let b:surround_{char2nr("b")} = "{% block \r %}{% endblock %}"
    " Auto-reload .vimrc on changes
    autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup END

au BufRead,BufNewFile *.tpml,*.vsml,*.vcml set filetype=xml
au BufRead,BufNewFile *.zsh-theme          set filetype=zsh
au BufRead,BufNewFile *.less               set filetype=less
au BufRead,BufNewFile *.html               set filetype=htmldjango
au BufRead,BufNewFile *.md                 set filetype=markdown
au BufRead,BufNewFile *.fish               set filetype=fish

" Line numbering ---------------------------------------------------------
set relativenumber " have line numbers show as relative to current line
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

" Toggling paste ---------------------------------------------------------
"nnoremap <F5> :set invpaste paste?<Enter>
"imap <F5> <C-O><F5>
"set pastetoggle=<F5>

" Buffer non-specific ----------------------------------------------------
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert
set cpo+=J " Use double spacing after periods.
set display=lastline,uhex " Show the last line instead of '@'; show non-printable chars as <hex>
set esckeys " allow sane use of cursor keys in various modes, not a necessary change since it probably does the right thing in nocompatible mode anyway
set hidden " unsaved buffers allowed in the buffer list without saving
set hlsearch " highlight the current search
set ignorecase " Usually I don't care about case when searching
set incsearch " Show matches as you type
set laststatus=2 " Always show a status line.
set lazyredraw " Don't redraw during macros etc.
set list " display leading tabs as >· and trailing spaces as ·
set listchars=tab:»·,trail:·
"set listchars=tab:\|\ ,trail:·
let mapleader = "," " Set <leader> to ,
set modeline " Look for embedded modelines at the top of the file.
set modelines=10 " Don't look any further than this number of lines
set mousehide " Hide the mouse pointer while typing
set noerrorbells " enough with the beeping already!
set noshowmode " Hide mode text under powerbar
set nostartofline " keep cursor's column
set notextmode " Don't append bloody carriage returns.
set ruler " Enable ruler on status line.
set shiftround " Round indent to shiftwidth multiple, applies to < and >
set shortmess=atI " Shorter status messages.
set showcmd " Show (partial) command in status line.
set showmatch " Show matching ()'s []'s {}'s
set smartcase " only search case sensitively when not doing al all-lowercase search
set splitbelow " Split horizontally below.
set splitright " Split vertically to the right.
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
set title " better xterm titles
set ttyfast " terminal connection is fast
set ttimeoutlen=50 " faster exit from insert mode"
set whichwrap=b,s,h,l,<,>,[,],~ " Wrap to the previous/next line on all keys and ~ command
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo
set wildmenu " Better filename completion etc.
set wildmode=longest:full,full " complete only up to the point of ambiguity (while still showing you what your options are)

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Status bar --------------------------------------------------------------
"set statusline=
"set statusline+=%<%y\ %f%=\ [%1*%M%*%n%R%H]\ %-19(L%l,C%c%03V%)

" VimInfo management -----------------------------------------------------
" '50              Marks will be remembered for the last 50 files you edited.
" <1000            Contents of registers (up to 1000 lines each) will be
"                  remembered.
" s100             Registers with more than 100 Kbyte text are skipped.
" "100             Cursor positions will be remembered for last 100 files
" :50              Last 50 entries in command-line history will be saved.
" no /             Since '/' is not specified, the default will be used,
"                  that is, save all of the search history, and also the
"                  previous search and substitute patterns.
" no %             The buffer list will not be saved nor read back.
" no h             'hlsearch' highlighting will be restored.
set viminfo='50,<1000,s100,:50,"100

" Jumping to last edited position in files on open -----------------------
" n~/.vim/viminfo  The name of the file to use is "~/.vim/viminfo".
",n~/.vim/viminfo
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" DF - Also do not do this if the file resides in the $TEMP directory,
"      chances are it is a different file with the same name..
augroup JumpCursorOnEdit
  autocmd!
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |
    \   endif |
    \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END

" tab management ---------------------------------------------------------
"map <silent><M-Up> :tabnew<CR>
"map <silent><M-Down> :tabclose<CR>
"map <silent><M-Right> :tabnext<CR>
"map <silent><M-Left> :tabprevious<CR>

" Nifty tricks -----------------------------------------------------------
" [I - list all matches for word found under the cursor

" sudo write
cabbrev w!! w !sudo tee >/dev/null "%"

" Show the stack of syntax highlighting classes affecting whatever is under the
" cursor.
function! SynStack()
    echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc


" Mappings ---------------------------------------------------------------

" Disable cursor keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Disable the help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" To close syntastic window, :lcl

" Select previously pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Open vimrc on the fly <leader>ev
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Open registers
nnoremap <leader>r :registers<cr>

" NERDtree toggle ,lt
" NERDtree find current file ,lf

" F5 to open Gundo window
" http://sjl.bitbucket.org/gundo.vim/
nnoremap <F5> :GundoToggle<CR>

" Bubble lines of text (Uses Tim Pope's "unimpaired" script)
" Bubble single lines
nmap <silent><C-k> [e
nmap <silent><C-j> ]e
" Bubble visual lines
vmap <silent><C-k> [egv
vmap <silent><C-j> ]egv

nmap <F6> :TagbarToggle<cr>
"nmap <S-F3> :setf less<cr>
nnoremap <F8> :call SynStack()<CR>

map <leader><leader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
