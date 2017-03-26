" Steve's .vimrc

" Basic Settings {{{
set nocompatible | filetype indent plugin on | syn on
let g:skip_loading_mswin=1
let mapleader = "," " Set <leader> to ,

syntax on
set fileencoding=utf-8
set encoding=utf-8
set shell=/bin/bash

" }}}
" Advanced Settings {{{
set backspace=indent,eol,start    " Allow backspacing over autoindent, line breaks and start of insert
set backup                        " enable backups
set cpo+=J                        " Use double spacing after periods.
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
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
set title                         " Better xterm titles
set ttyfast                       " Terminal connection is fast
set ttimeoutlen=50                " Faster exit from insert mode
set whichwrap=b,s,h,l,<,>,[,],~   " Wrap to the previous/next line on all keys and ~ command
set wildignore+=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*.orig
set wildmenu                      " Better filename completion etc.
set wildmode=longest:full,full    " Complete only up to the point of ambiguity
                                  " (while still showing you what your options are)

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}
" Backslash Mappings {{{
nmap \d :BD<CR>
nmap \e :NERDTreeToggle<CR>
nmap <silent> \g <Plug>IndentGuidesToggle
nmap \s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nmap \v <C-w><C-v><C-l>:e $MYVIMRC<cr>

nmap <silent><C-w><S-n> :vnew<CR>

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
" }}}
" Leader mappings {{{
nmap <leader>g :GundoToggle<CR>
nmap <leader>n :bnext<CR>
nmap <leader>p :bprevious<CR>
nmap <leader>r :registers<cr>
" }}}
" Other mappings {{{

" Last used buffer
nmap <C-e> :e#<CR>

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

" Disable cursor keys in insert mode
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <Left> <nop>
"inoremap <Right> <nop>

" Disable the help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Disable Ex mode
noremap Q <nop>

" }}}
" VAM (VIM Addon Manager) {{{

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
    call vam#ActivateAddons('Gundo')
    call vam#ActivateAddons('LycosaExplorer')
    call vam#ActivateAddons('Syntastic')
    "call vam#ActivateAddons('The_NERD_tree')
    call vam#ActivateAddons('YouCompleteMe')
    call vam#ActivateAddons('bufkill')
    call vam#ActivateAddons('ctrlp')
    call vam#ActivateAddons('fugitive')
    call vam#ActivateAddons('github:nathanaelkane/vim-indent-guides')
    call vam#ActivateAddons('github:valloric/MatchTagAlways')
    call vam#ActivateAddons('github:vim-airline/vim-airline-themes')
    call vam#ActivateAddons('vim-airline')
    call vam#ActivateAddons('vim-bufferline')

    " VIM movement addons
    call vam#ActivateAddons('AutoFenc')
    call vam#ActivateAddons('The_NERD_Commenter')
    call vam#ActivateAddons('VimOutliner')
    call vam#ActivateAddons('breeze')
    call vam#ActivateAddons('closetag')
    call vam#ActivateAddons('repeat')
    call vam#ActivateAddons('surround')
    call vam#ActivateAddons('unimpaired')
    call vam#ActivateAddons('vim-pi')

    " Language Addons
    call vam#ActivateAddons('html5')
    call vam#ActivateAddons('editorconfig-vim')
    call vam#ActivateAddons('Python-mode-klen')
    call vam#ActivateAddons('github:dag/vim-fish')
    "call vam#ActivateAddons('vim-coffee-script')
    call vam#ActivateAddons('vim-javascript')
    call vam#ActivateAddons('github:tpope/vim-haml')
    call vam#ActivateAddons('github:JulesWang/css.vim')
    call vam#ActivateAddons('vim-css3-syntax')
    call vam#ActivateAddons('github:genoma/vim-less')
    call vam#ActivateAddons('github:chase/vim-ansible-yaml')

    " Tools
    "call vam#ActivateAddons('github:ap/vim-css-color')
    "call vam#ActivateAddons('xterm-color-table')
    "call vam#ActivateAddons('HiLinkTrace@drchip')

    " Themes
    call vam#ActivateAddons('Solarized')
    call vam#ActivateAddons('github:reedes/vim-colors-pencil')
    call vam#ActivateAddons('github:daylerees/colour-schemes')

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

" }}}
" UI {{{

" Theme
if &term =~ '^\(xterm\|screen\|screen-color256-bce\|linux\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
colorscheme solarized
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_italic=1

" Matching brackets
:hi MatchParen cterm=none ctermbg=5 ctermfg=7

" Set some highlights
"hi LineNr       ctermfg=14 ctermbg=7
"hi CursorLineNr term=bold  ctermfg=130 ctermbg=7
:set cursorline

" Status bar
"set statusline=
"set statusline+=%<%y\ %f%=\ [%1*%M%*%n%R%H]\ %-19(L%l,C%c%03V%)

" GVIM ------------------------------------------------------------------
if has("gui_running")
    set background=dark
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

" }}}
" VIM Plugin Settings {{{

" Airline ----------------------------------------------------------------

" Airline Theme
"let g:airline_theme="behelit"
let g:airline_theme="solarized"

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
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'

"let g:airline#extensions#syntastic#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_extensions = ['ctrlp']
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:airline_skip_empty_sections = 1

" Breeze -----------------------------------------------------------------
"let g:breeze_highlight_curr_element = 0
"hi htmlTagHighlightGroup gui=NONE cterm=NONE ctermbg=4 ctermfg=16
"let g:breeze_hl_color_darkbg = "htmlTagHighlightGroup"

" Ctrl-p -----------------------------------------------------------------
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](env)$',
  \ 'file': '\v\.(pyc|orig|exe|so|dll)$',
  \ }
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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

" LycosaExplorer ---------------------------------------------------------
" Link - (http://www.vim.org/scripts/script.php?script_id=3659)
"  <Leader>lf  - Opens the filesystem explorer.
"  <Leader>lr  - Opens the filesystem explorer at the directory of the current file.
"  <Leader>lb  - Opens the buffer explorer.
let g:SuperTabDefaultCompletionType = "context"

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
let g:syntastic_coffee_checkers=['coffeelint']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_args = '-c $HOME/.config/eslintrc'
"let g:syntastic_coffee_coffeelint_args = '--file $HOME/ice/config/coffeelint.json'
let g:syntastic_enable_signs=1 " Mark buffer with 'signs'
let g:syntastic_auto_loc_list=1 " Open location list if there are errors

" YouCompleteMe ----------------------------------------------------------
let g:ycm_autoclose_preview_window_after_completion=1

" vim-indent-guides ------------------------------------------------------
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=15
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

" }}}
" Coding Style Settings {{{

function! s:AddKeyword()
    setlocal iskeyword+=-
endfun

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
    autocmd FileType css,less,scss,javascript,python,sh call <SID>CodingStyleFiletypes(4, 'on')
    autocmd FileType vim,zsh call <SID>CodingStyleFiletypes(4, 'off')
    autocmd FileType html,htmldjango,yml call <SID>CodingStyleFiletypes(2, 'off')
    autocmd FileType xml,coffee call <SID>CodingStyleFiletypes(2, 'on')
    autocmd FileType fish,groovy call <SID>CodingStyleFiletypes(4, 'off')

    " Special django surround tags
    autocmd FileType htmldjango let b:surround_{char2nr("%")} = "{% \r %}"
    autocmd FileType htmldjango let b:surround_{char2nr("{")} = "{{ \r }}"
    autocmd FileType htmldjango let b:surround_{char2nr("b")} = "{% block \r %}{% endblock %}"

    au Filetype html,xml,xsl source ~/.vim/vim-addons/closetag/plugin/closetag.vim

    " Auto-reload .vimrc on changes
    autocmd BufWritePost ~/.vimrc source ~/.vimrc

    " * should match - as well as _ when searching under the cursor
    autocmd FileType css,less,scss,vim,html,htmldjango,,coffee call <SID>AddKeyword()
augroup END

au BufRead,BufNewFile *.zsh-theme          set filetype=zsh
au BufRead,BufNewFile *.less               set filetype=less
au BufRead,BufNewFile *.html               set filetype=htmldjango
au BufRead,BufNewFile *.md                 set filetype=markdown
au BufRead,BufNewFile *.fish               set filetype=fish
au BufRead,BufNewFile Jenkinsfile          set filetype=groovy

" }}}
" Custom Vim Settings {{{

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher --
if executable("ag")
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Line numbering ---------------------------------------------------------
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
" }}}
" Nifty tricks {{{
" [I - list all matches for word found under the cursor

" sudo write
cabbrev w!! w !sudo tee >/dev/null "%"

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" }}}
" vim:foldmethod=marker:foldlevel=0
