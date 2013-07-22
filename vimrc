set nocompatible
let g:skip_loading_mswin=1

set fileencoding=utf-8
set encoding=utf-8

" Filetype autohandling --------------------------------------------------
filetype plugin indent on

let g:vim_addon_manager={'scms': {'git': {}, 'svn': {}, 'hg': {}}}
let g:vim_addon_manager.scms.git.clone=['MyGitCheckout']
let g:vim_addon_manager.scms.hg.clone =['vcs_checkouts#MercurialCheckout']
let g:vim_addon_manager.scms.svn.clone=['vcs_checkouts#SubversionCheckout']

function! MyGitCheckout(repository, targetDir)
    " overwriting in place should not hurt:
    if a:repository.url =~ 'git://github'
        let a:repository.url = substitute(a:repository.url, '^git:', 'http:', '')
        call vam#utils#RunShell('git clone --depth=1 $.url $p', a:repository, a:targetDir)
    else
        call vcs_checkouts#GitCheckout(repository, targetDir)
    endif
endf

function! EnsureVamIsOnDisk(vam_install_path)
    " -> BUG [4] (git-less installation)
    if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
            \&& 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
        " I'm sorry having to add this reminder. Eventually it'll pay off.
        call confirm("Remind yourself that most plugins ship with ".
                    \"documentation (README*, doc/*.txt). It is your ".
                    \"first source of knowledge. If you can't find ".
                    \"the info you're looking for in reasonable ".
                    \"time ask maintainers to improve documentation")
        call mkdir(a:vam_install_path, 'p')
        execute '!git clone --depth=1 http://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
        " VAM runs helptags automatically when you install or update plugins
        exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
    endif
endf

function! SetupVAM()
    " Set advanced options like this:
    " let g:vim_addon_manager = {}
    " let g:vim_addon_manager['key'] = value

    " Example: drop git sources unless git is in PATH.  Same plugins can
    " be installed from www.vim.org. Lookup MergeSources to get more control
    " let g:vim_addon_manager['drop_git_sources'] = !executable('git')

    " VAM install location:
    let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
    call EnsureVamIsOnDisk(vam_install_path)
    exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

    " Tell VAM which plugins to fetch & load:
    call vam#ActivateAddons(['repeat', 'sparkup', 'syntaxconkyrc', 'EasyMotion', 'YouCompleteMe', 'powerline', 'python_pydoc', 'AutoFenc', 'LycosaExplorer', 'surround', 'Syntastic', 'The_NERD_Commenter', 'VimOutliner', 'indentpython%3461', 'unimpaired', 'Solarized', 'python_match', 'Tagbar', 'twilight', 'vim-less'], {'auto_install' : 0})
    " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})

    " Addons are put into vam_install_path/plugin-name directory
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
endf

call SetupVAM()

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

" LycosaExplorer (http://www.vim.org/scripts/script.php?script_id=3659) --
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

" Sparkup settings -------------------------------------------------------
" <c-e>: expand sparkup string
" <c-n>: jump to next empty tag
" Typing div.content>h1.post-title+p{Sample Content} will expand to
"     <div class="content">
"         <h1 class="post-title"></h1>
"         <p>Sample Content</p>
"     </div>
" See https://github.com/rstacruz/sparkup#examples for more.

" Syntastic settings -----------------------------------------------------
let g:syntastic_enable_signs=1 " Mark buffer with 'signs'
let g:syntastic_auto_loc_list=1 " Open location list if there are errors

" YouCompleteMe ----------------------------------------------------------
let g:ycm_autoclose_preview_window_after_completion=1

" Syntax highlighting ----------------------------------------------------
syntax on

" Auto-reload .vimrc on changes ------------------------------------------
function! s:CodingStyleFiletypes(tabstop_length)
    " Let filetype indentation do its own thing
    setlocal nocindent
    setlocal nosmartindent

    " mark the 80th col to avoid overstepping programming style
    setlocal colorcolumn=80
    setlocal textwidth=80

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
    autocmd FileType javascript,python,sh,css,less call <SID>CodingStyleFiletypes(4)
    autocmd FileType htmldjango,html,xml call <SID>CodingStyleFiletypes(2)
    autocmd BufWritePost ~/.vimrc source ~/.vimrc
    autocmd BufNewFile,BufRead *.tpml,*.vsml,*.vcml setfiletype xml
augroup END

au BufRead,BufNewFile *.md set filetype=markdown

" Restrict mutt email width
au BufRead /tmp/mutt-* set tw=72

" Colourscheme -----------------------------------------------------------
if &term =~ '^\(xterm\|screen\|screen-color256-bce\|linux\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
set background=dark
colorscheme solarized
"let g:molokai_original=1 " only affects gvim
"colorscheme molokai
" --- set transparency
"highlight Normal ctermfg=252 ctermbg=NONE

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
let mapleader = ","
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

" Select previously pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Open vimrc on the fly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Bubble lines of text (Uses Tim Pope's "unimpaired" script)
" Bubble single lines
nmap <silent><C-k> [e
nmap <silent><C-j> ]e
" Bubble visual lines
vmap <silent><C-k> [egv
vmap <silent><C-j> ]egv

nmap <F6> :TagbarToggle<cr>
"nmap <S-F3> :setf less<cr>
"nnoremap <F8> :call SynStack()<CR>
