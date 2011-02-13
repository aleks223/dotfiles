set t_Co=256
set nowrap
set textwidth=0    
set lbr
syntax on
colorscheme neverland-darker
set number
set ruler
set lazyredraw
set nobackup
set autowriteall
set noswapfile
set showmode
set ts=2
set bs=2
set sw=2
set ch=1
set hlsearch
set paste
"set backupdir=~/.vim,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim,~/.tmp,~/tmp,/var/tmp,/tmp
set pastetoggle=<f5>
set tabstop=8     " tabs are at proper location
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=4  " indenting is 4 spaces
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set nocindent
set spelllang=fr,en

" status bar info and appearance
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\ 
set laststatus=2
set cmdheight=1
