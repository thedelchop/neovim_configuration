" dein Setup script from: https://github.com/Shougo/dein.vim#unixlinux-or-mac-os-x
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/thedelchop/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/thedelchop/.cache/dein')
  call dein#begin('/Users/thedelchop/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/thedelchop/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tpope/vim-bundler')
  call dein#add('tpope/vim-rails')
  call dein#add('iCyMind/NeoSolarized')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('neomake/neomake')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('tpope/vim-surround')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('airblade/vim-rooter')
  call dein#add('wellle/tmux-complete.vim')
  call dein#add('thedelchop/denite-rails')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('roxma/vim-tmux-clipboard')
  call dein#add('tweekmonster/startuptime.vim')
  call dein#add('eugen0329/vim-esearch')
  call dein#add('yggdroot/indentline')
  call dein#add('myusuf3/numbers.vim')
  call dein#add('metakirby5/codi.vim')

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
let g:neomake_open_list = 2
let g:neomake_list_height = 50
let g:neomake_highlight_lines = 1
let g:airline#extensions#neomake#enabled = 1
call neomake#configure#automake('nw', 500)

" NERDCommenter configuration options (https://github.com/scrooloose/nerdcommenter)

let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" Denite.nvim configuration options (https://github.com/Shougo/denite.nvim)
" Ag command for file rec source
call denite#custom#var('file/rec', 'command',
      \ ['ag', '--vimgrep', '--smart-case', '-g', '']) " Change file_rec command.

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
                \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change mappings.
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

call denite#custom#source(
\ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_hide_hidden_files', 'matcher_ignore_globs'])

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        \ [
        \ '.git/',
        \ 'bin/',
        \ 'tmp/',
        \ 'log/',
        \ 'coverage/',
        \ 'db/',
        \ 'docs/',
        \ 'public/',
        \ 'script/',
        \ 'tags',
        \ 'api/assets/',
        \ 'app/assets/fonts/',
        \ 'app/assets/images/',
        \ 'app/assets/svg_icons/',
        \ 'tmp/cache/',
        \ 'tmp/capybara/',
        \ 'tmp/data/',
        \ 'tmp/jasmine/',
        \ 'tmp/letter_opener/',
        \ 'tmp/notes/',
        \ 'tmp/pids/',
        \ 'tmp/sessions/',
        \ 'tmp/sockets/',
        \ 'tmp/v1/',
        \ 'tmp/*.pdf/',
        \ 'tmp/*.pem',
        \ 'tmp/*.sql',
        \ 'tmp/*.xml',
        \ 'tmp/*.json',
        \ 'tmp/*.xls/',
        \ 'tmp/*.xlsx/'])

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

" GitGutter confgiruation options (https://github.com/airblade/vim-gitgutter)
let g:gitgutter_grep_command = 'ag --nocolor --nogroup'
let g:gitgutter_override_sign_column_highlight = 0

" Airline configuration options (https://github.com/vim-airline/vim-airline)
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" NERDTree configuration options  (https://github.com/scrooloose/nerdtree)
let g:NERDTreeWinSize = 36
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeCascadeSingleChildDir = 1
let g:NERDTreeCascadeOpenSingleChildDir=1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeCreatePrefix = 'silent keepalt'
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$', 'log$', 'vendor$']
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeBookmarksSort = 0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTree Git plugin setup
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Setup eSearch for searching across files
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'qflist',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

" Setup linenumbers.vim to toggle absolute/relative line numbers
let g:numbers_exclude = ['nerdtree', 'denite', 'codi']

" Setup Codi as our interactive on the fly scratchpad/repl
let g:codi#use_buffer_dir = 0
let g:codi#width = 75

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif

colorscheme NeoSolarized
set background=dark
set number             	          " Show line numbers
set ruler              	          " Show line and column number
set shell=/usr/local/bin/zsh      " Default the shell to ZSH
set colorcolumn=110  	          " Colorcolumn at 110 characters
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

" Fugitive.vim mappings (https://github.com/tpope/vim-fugitive)
nmap <silent> <leader> gb :Gblame<CR>
nmap <silent> <leader> gs :Gstatus<CR>
nmap <silent> <leader> gd :Gdiff<CR>
nmap <silent> <leader> gl :Glog<CR>
nmap <silent> <leader> gc :Gcommit<CR>

" Open up FuzzyFinder
nnoremap <Leader>j :DeniteProjectDir -highlight-matched-char=None  file/rec<CR>
nnoremap <Leader>A :DeniteProjectDir grep<CR>
nnoremap <Leader>h :Denite help<CR>
nnoremap <Leader>/ :Denite line<CR>
nnoremap <Leader>r :Denite register<CR>

" Attempt to open NERDTree window in top level directory
map <silent> <leader>n :NERDTreeFocus<CR>
map <silent> <leader>f :NERDTreeFind<CR>

" Open up a gem
nnoremap <leader>bo :Btabedit<Space>

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

" View the latest migration or the schema
nnoremap <leader>m :Emigration<CR>
nnoremap <leader>d :Eschema<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" toggle showing absolute vs relative line numbers
nnoremap <silent> <leader>ln :NumbersToggle<CR>
nnoremap <silent> <leader>nn :NumbersOnOff<CR>

" Shortcut to show QuickFix list
nnoremap <silent> <leader>qf :copen<CR>
nnoremap <silent> <leader>qfc :cclose<CR>
nnoremap <silent> <leader>ll :lopen<CR>
nnoremap <silent> <leader>llc :lclose<CR>

" Move the entire line left or right
vmap < <gv
vmap > >gv

nmap < >>
nmap > <<

" Setup Vim-Rooter to keep PWD to the 'root' of the current file
let g:rooter_patterns = ['Rakefile', '.git/', 'package.json']
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1

" Setup Denite-Rails for custom search commands for the different types of
" Rails components
nnoremap [rails] <Nop>
nmap     <Leader>r [rails]
nnoremap [rails]r :Denite<Space>rails:
nnoremap <silent> [rails]r :<C-u>Denite<Space>rails:dwim<Return>
nnoremap <silent> [rails]m :<C-u>Denite<Space>rails:model<Return>
nnoremap <silent> [rails]C :<C-u>Denite<Space>rails:controller<Return>
nnoremap <silent> [rails]v :<C-u>Denite<Space>rails:view<Return>
nnoremap <silent> [rails]h :<C-u>Denite<Space>rails:helper<Return>
nnoremap <silent> [rails]s :<C-u>Denite<Space>rails:serializer<Return>
nnoremap <silent> [rails]c :<C-u>Denite<Space>rails:command<Return>
nnoremap <silent> [rails]d :<C-u>Denite<Space>rails:decorator<Return>
nnoremap <silent> [rails]p :<C-u>Denite<Space>rails:presenter<Return>
nnoremap <silent> [rails]M :<C-u>Denite<Space>rails:mailer<Return>

" Setup Indentline for managing my indentations
let g:indentLine_char ='|'
let g:indentLine_enabled = 0
let g:indentLine_setColors = 0
nnoremap <leader>ig :IndentLinesToggle<CR>

autocmd BufNewFile,BufRead *js.coffee set filetype=coffee

" Define related files for Javascript assets in Rails.vim
autocmd User Rails/app/assets/javascripts/*.js.coffee let b:rails_related = 'spec/javascripts/' . rails#buffer().name()[23:-11] . '_spec.js.coffee'
autocmd User Rails/spec/javascripts/*_spec.js.coffee let b:rails_related = 'app/assets/javascripts/' . rails#buffer().name()[17:-16] . '.js.coffee'

" Define alternate files for Javascript assets in Rails.vim
autocmd User Rails/app/assets/javascripts/*.js.coffee let b:rails_alternate = 'spec/javascripts/' . rails#buffer().name()[23:-11] . '_spec.js.coffee'
autocmd User Rails/spec/javascripts/*_spec.js.coffee let b:rails_alternate = 'app/assets/javascripts/' . rails#buffer().name()[17:-16] . '.js.coffee'

" Open up NERDTree when we start nvim on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NVIM if the only remaining window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
