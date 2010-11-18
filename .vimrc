set t_Co=256
set nowrap
set textwidth=0    
set lbr
syntax on
colorscheme miromiro
set number
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
set cindent       " stricter rules for C programs
set spelllang=fr,en

" status bar info and appearance
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\ 
set laststatus=2
set cmdheight=1
