" ========== Start Pathogen config
execute pathogen#infect()
set nocompatible              " be iMproved, required
filetype off                  " required
"========== End Pathogen config

" ========== Start Vundle config
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" required as well by NerdCommenter.
" See - https://github.com/scrooloose/nerdcommenter#post-install
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ========== End Vundle config

" ========== Start autocmd grouping (better performance)
" augroup vimrc_autocmd
  " clears out the current group before re-adding autocmd's
  " autocmd!
" augroup END
" ========== End autocmd's grouping

" ========== Start Syntastic config
" Disable Syntastic by default
" autocmd VimEnter * SyntasticToggleMode
" or...
let g:syntastic_mode_map = { 'mode': 'passive' }
" Syntastic and ESLint for JS checkers
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'
" Recommended Syntastic Settings
" See - https://github.com/scrooloose/syntastic#3-recommended-settings
" See - http://usevim.com/2016/03/07/linting/
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '💥'
let g:syntastic_style_error_symbol = '💥'
let g:syntastic_warning_symbol = '💩'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" ========== End Syntastic config

" ========== Start Vim config
set expandtab       " Expand TABs to spaces
set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
"tab all
"set cursorline " <--- this makes vim slow if activate at runtime (but nevermind i need this)
set number
set t_Co=256
au! BufRead,BufNewFile *.haml setfiletype haml 
au! FileType haml set noet
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
"set visualbell           " don't beep
"set noerrorbells         " don't beep
set nobackup " i dont care about backups (i use git for that)
set noswapfile " i dont want swap files (i'm tired to gitignore them every single time)
set mouse=a " enable the mouse (useful for scrolling, ONLY!!!)
set wrap
set linebreak
set nolist
" hides buffers instead of closing them (a MUST-HAVE)
set hidden

" mapleaders
let mapleader = ","
let maplocalleader = "\\"

" split windows focusing sizing
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
" ========== End Vim config

" ========== Start Commant-T config
let g:CommandTMaxFiles=99999
let g:CommandTMaxCachedDirectories=99
" ========== End Command-T config

" ========== Start HardMode config
" hardmode enable by default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" ========== End HardMode config

" ========== Start colorschemes config
" Solarized colorscheme
" See - http://ethanschoonover.com/solarized
syntax enable
" let g:solarized_termcolors=256
" set t_Co=256
" colorscheme solarized
colorscheme dracula
" set background=light

"if has("gui_running") 
"  set background=light
"else
"  set background=dark
"endif
" ========== End colorschemes config

" ========== Start mappings config
" cut and paste the current line down while in normal mode
nnoremap <leader>- ddp
" uppercase the current word while on insert mode and get back to work!
inoremap <c-u> <esc>viwUEa
" uppercase the current word while in normal mode
nnoremap <c-u> viwUw<esc>
" open up vimrc file in a vertical split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source this file
nnoremap <leader>sv :source $MYVIMRC<cr>
" toggle the NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
" open up vim.cheatsheet in a vertical split window
" html and css
inoremap <leader>cls class=''<esc>i
" insert quotes in selected word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" insert <b> tags in selected word
nnoremap <leader>b viw<esc>a</b><esc>hbi<b><esc>lel
" short lorem ipsum
inoremap <leader>slo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla.
" long lorem ipsum
inoremap <leader>llo Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh.  
" bourbon mixins convertions
nnoremap <LocalLeader>brb viw<esc>bi@include<space><esc>wwxxi(<esc>$i)<esc>$
" super-useful trick to save files for example, (saves some extra keystrokes)
nnoremap ; :
" disable arrow-keys (want to become a vim master, right?)
" note: enabled on insert mode ;)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" motions in displayed lines (for wrapped line navigation)
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g0
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g0
" ========== End mappings config

" ========= Start abbreviations config
" common typos
iabbrev widht width
iabbrev waht what
iabbrev weigth weight
iabbrev tehn then
" fullname, signature, email, website, copyright
iabbrev ffname Enrique Benitez
iabbrev ssig -- <cr>Enrique Benitez<cr>hello@bntz.io
iabbrev @@ hello@bntz.io
iabbrev wwsite https://bntz.io
iabbrev ccopyhtml &copy; 2016, Enrique Benitez.
iabbrev ccopy Copyright 2016 Enrique Benitez, all rights reserved.
" ========= End abbreviations config

" ========= Start crontab conf
autocmd filetype crontab setlocal nobackup nowritebackup
" ========= End crontab conf

