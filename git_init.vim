" dein Setup script from: https://github.com/Shougo/dein.vim#unixlinux-or-mac-os-x
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/thedelchop/.cache/dein_git/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/thedelchop/.cache/dein_git')
  call dein#begin('/Users/thedelchop/.cache/dein_git')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/thedelchop/.cache/dein_git/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('iCyMind/NeoSolarized')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('neomake/neomake')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('sheerun/vim-polyglot')

" Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" End dein Scripts-------------------------

" NeoMake configuration options (https://github.com/neomake/neomake)
let g:neomake_ruby_rubocop_args=['--format', 'fuubar', '-D', '-R']
call neomake#configure#automake('nw', 500)

" NERDCommenter configuration options (https://github.com/scrooloose/nerdcommenter)

let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" Let NeoVim know where my python installations are located
let g:python_host_prog = '/usr/local/opt/pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/usr/local/opt/pyenv/versions/neovim3/bin/python'

" Deoplete.nvim configuration options (https://github.com/Shougo/deoplete.nvim)
let g:deoplete#enable_at_startup = 1

" NeoSolarized configuration (https://github.com/icymind/NeoSolarized)

" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

set termguicolors

colorscheme NeoSolarized
set background=dark
set number             	          " Show line numbers
set ruler              	          " Show line and column number
set shell=/usr/local/bin/zsh      " Default the shell to ZSH
set colorcolumn=72  	            " Colorcolumn at 72 characters
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set backspace=indent,eol,start    " backspace through everything in insert mode
set regexpengine=1                " enable regexp engine

" List chars
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
" Searching

" set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Wild settings

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Backup and swap files

set backupdir^=~/.cache/nvim/backup//    " where to put backup files.
set directory^=~/.cache/nvim/temp//      " where to put swap files.

" Remap the leader key to semi-colon
let mapleader=";"

" Use jk as Escape
imap jk <Esc>

" Toggle Highlight Search
nmap <silent> <leader>hs :set hlsearch! hlsearch?<CR>

" Set viewports to the same size
map <Leader>= <C-w>=

"These are nice shortcuts for opening and closing tabs
noremap <silent> <leader>te :tabedit<Space>
noremap <silent> <leader>nt :tabnew<CR>
noremap <silent> <leader>tc :tabclose<CR>
noremap <silent> <leader>tn :tabnext<CR>
noremap <silent> <leader>tp :tabprev<CR>

" Setup shortcuts to turn paste mode on/off
nnoremap <silent> <leader>sp :set invpaste<CR>:set paste?<CR>

" These bindings will navigate the tag stack up and down the line
nnoremap <silent> <leader>[ <C-]>
nnoremap <silent> <leader>] <C-T>

" Tmux Navigator Hack to fix NeoVim Backspace Issue (https://github.com/christoomey/vim-tmux-navigator
nnoremap <silent> <BS> :TmuxNavigateLeft<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Launch Ag.nvim
" map <Leader>A :Ag<Space>

" Move the entire line left or right
vmap < <gv
vmap > >gv

nmap < >>
nmap > <<

autocmd BufNewFile,BufRead *js.coffee set filetype=coffee

" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>w :ZoomToggle<CR>
