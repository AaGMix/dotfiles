source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" reload vimrc
nnoremap <C-l> :source $MYVIMRC<CR>
" ��ʾ�к�  
set number  
" no backup
set noundofile
set nobackup
set noswapfile
" ʵʱ����  
set incsearch  
" �������ļ�����ʱ����������  
set nowrapscan  
" ��ͻ����ʾ��ǰ��  
set nocursorline  
set expandtab  
" �趨 tab ����Ϊ 4  
set tabstop=4  
" �趨 << �� >> �����ƶ�ʱ�Ŀ��Ϊ 4  
set shiftwidth=4  
set smarttab  
colorscheme SolarizedDark

" �Զ��﷨����  
syntax on  
 " ����ļ�����  
filetype on  
" ���趨�ڲ���״̬�޷����˸���� Delete ��ɾ���س���  
set backspace=indent,eol,start  
set whichwrap+=<,>,h,l  

"switch windows
"nnoremap <C-h> <C-w>h  
"nnoremap <C-l> <C-w>l  
"nnoremap <C-j> <C-w>j  
"nnoremap <C-k> <C-w>k 
nmap wh <C-w>h
nmap wl <C-w>l
nmap wj <C-w>j
nmap wk <C-w>k


"detected os:https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript

"if has('win32')
	"echo "this is windowns"
	"set nu	
"elseif has('unix')
	"echo "this is unix"
"elseif has(macunix)
	"echo "this is mac"
"elseif has(win32unix)
	"echo "this is Cywin"
"endif

function IsWin32()
	return has('win32')
endfunction

function IsWin32Unix()
	return has('win32unix')
endfunction

function IsUnix()
	return has('unix')
endfunction

function IsMac()
	return has('macunix')
endfunction


" vundle configurations
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if IsWin32()
	set rtp+=$VIM/vimfiles/bundle/Vundle.vim
	call vundle#begin('$VIM/vimfiles/bundle/')
elseif IsUnix() || IsWin32Unix() || IsMac()
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 " -------------------------------------------------------------------------
" add plugin here
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set local working directory:current file
let g:ctrlp_working_path_mode = 'ra'

" exclusions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plugin 'scrooloose/nerdtree'
nmap wm :NERDTreeToggle<CR>
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
"Refresh both CtrlP and NERDTree
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

Plugin 'easymotion/vim-easymotion'
Plugin 'vim-syntastic/syntastic'
" syntastic default config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

 " -------------------------------------------------------------------------
 " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required 

