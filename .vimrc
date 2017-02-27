"Vundle
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/netrw.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/goyo.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'duythinht/vim-coffee'
Plugin 'suan/vim-instant-markdown'
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'
Plugin 'garyburd/go-explorer'
call vundle#end()
syntax on
filetype plugin indent on

"Dvorak
noremap t j
noremap n k
noremap s l
map <Space> <Leader>

"airline
let g:airline_powerline_fonts=1
set laststatus=2
let g:airline_theme="base16_mocha"

"colorscheme
set t_Co=256
colorscheme coffee

"vim-gitgutter
set updatetime=250

"supertab + completion
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt-=preview

"markdown preview
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

"Easymotion
let g:EasyMotion_do_mapping=1
map <Leader> <Plug>(easymotion-prefix)
map <Leader>t <Plug>(easymotion-j)
map <Leader>n <Plug>(easymotion-k)
map <Leader>j <Plug>(easymotion-t)
map <Leader>J <Plug>(easymation-T)


"php-cs-fixer
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_fixers_list = ""
let g:php_cs_fixer_enable_default_mapping = 1

"netrw, fix for dvorak
augroup netrw_dvorak_fix
	autocmd!
	autocmd filetype netrw call Fix_netrw_maps_for_dvorak()
augroup END
function! Fix_netrw_maps_for_dvorak()
	noremap <buffer> t j
	noremap <buffer> n k
	noremap <buffer> s l
endfunction
"netrw, settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"netrw, toggle sidebar functions
fun! VexToggle(dir)
	if exists("t:vex_buf_nr")
		call VexClose()
	else
		call VexOpen(a:dir)
	endif
endf

fun! VexOpen(dir)

	execute "Vexplore " . a:dir
	let t:vex_buf_nr = bufnr("%")
	wincmd H "Ensures the filetree is to the left
	call VexSize(25)
endf

"Maybe one could close by bufnr instead?
fun! VexClose()
	let cur_win_nr = winnr()
	let target_nr = (cur_win_nr == 1? winnr("#"):cur_win_nr)
	wincmd w
	close
	unlet t:vex_buf_nr
	execute (target_nr -1) . "wincmd w"
	call NormalizeWidths()
endf

fun! VexSize(vex_width)
	execute "vertical resize" . a:vex_width
	set winfixwidth
	call NormalizeWidths()
endf

fun! NormalizeWidths()
	let eadir_pref = &eadirection
	set eadirection=hor
	set equalalways! equalalways!
	let &eadirection = eadir_pref
endf

augroup NetrwGroup
  autocmd! BufEnter * call NormalizeWidths()
augroup END

map <Leader>f :call VexToggle(".")<CR>

"Tabbing
set ts=2 sw=2 ai
autocmd Filetype php setlocal ts=4 sw=4 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType conf setlocal ts=2 sts=2 sw=2 ai

"Spelling
autocmd Filetype tex set spelllang=en_gb spell
autocmd Filetype markdown set spelllang=en_gb spell
"php syntax
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END



"
"Auto reload vim on changed vimrc
augroup myvimrc
	au!
	    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

