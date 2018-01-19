"Vundle
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugins
"Bundle manager
Plugin 'VundleVim/Vundle.vim'
"File explorer
Plugin 'vim-scripts/netrw.vim'
"Tag helper
Plugin 'szw/vim-tags'
"Shows tags
Plugin 'majutsushi/tagbar'
"Just an awesome project search
Plugin 'ctrlpvim/ctrlp.vim'
"Beutiful theme i have to fork
Plugin 'duythinht/vim-coffee'
"A way to make gvim themes work in terminal
Plugin 'godlygeek/csapprox'
"Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Fast movement (awesome)
Plugin 'easymotion/vim-easymotion'
"Git related (learn fugitive!)
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Markdown
Plugin 'suan/vim-instant-markdown'
"Go support
Plugin 'fatih/vim-go'
Plugin 'garyburd/go-explorer'
"Tab autocomplete
" Plugin 'ervandew/supertab'
"Asynchronous builds
Plugin 'tpope/vim-dispatch'
"Syntax checker
Plugin 'vim-syntastic/syntastic'
"Colorizes color hexes etc.
Plugin 'chrisbra/Colorizer'
"Latex
Plugin 'lervag/vimtex'
"Python
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
"Interesting theme
Plugin 'kristijanhusak/vim-hybrid-material'
call vundle#end()
syntax on
filetype plugin indent on

"Encoding
set encoding=utf-8

"Dvorak
noremap t j
noremap n k
noremap s l
map <Space> <Leader>

"Tabbing
set ts=2 sw=2 ai
autocmd Filetype php setlocal ts=4 sw=4 expandtab
autocmd FileType conf setlocal ts=2 sts=2 sw=2 ai

"Spelling
autocmd Filetype tex set spelllang=en_gb spell
autocmd Filetype markdown set spelllang=en_gb spell


"""PLUGINS"""
"ctrlp
let g:ctrlp_working_path_mode = 0

"Colorizer
autocmd VimEnter * ColorHighlight

"Tags
" - vim-tags
let g:vim_tags_auto_generate = 1
let g:vim_tags_use_vim_dispatch = 1
let g:vim_tags_use_language_field = 1
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore', '__pycache__', '.cache']
let g:vim_tags_directories = [".tags", ".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
"Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"Python - YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'


"Latex - vimtex
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_warnings = {
    \  'Overfull' : 0,
    \ 'underfull' : 0,
\}

"golang
let g:go_highlight_types = 1
set autowrite
let g:go_fmt_command = "goimports"
map <F8> :GoBuild<CR>
map <F9> :GoRun<CR>
map <F11> :GoTest<CR>
map <F10> :GoTestFunc<CR>
map <F12> :GoAlternate<CR>
"tags - bindings
noremap <c-h> <c-]>
noremap <c-g> :tselect<CR>

"tags - tagbar
nmap <Leader>g :TagbarToggle<CR>
let g:tagbar_left=1
nmap <Plug>s <Plug>l

"airline
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always show the statusline
let g:airline_powerline_fonts = 1
"set laststatus=2
"let g:airline_theme="base16_mocha"

"colorscheme
set t_Co=256
set background=dark
colorscheme hybrid_reverse
let g:airline_theme = "hybrid"
"colorscheme coffee

"vim-gitgutter
nmap <Leader><Leader>hs <Plug>GitGutterStageHunk
nmap <Leader><Leader>hu <Plug>GitGutterUndoHunk
set updatetime=250

"syntastic
map <F1> :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_loc_list_height = 3
let g:syntastic_error_symbol = 'E'
let g:syntastic_style_error_symbol = 'S'
"let g:syntastic_warning_symbol = '∆∆'
"let g:syntastic_style_warning_symbol = '≈≈'

let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1

" syntastic latex
let g:syntastic_tex_checkers = ['lacheck']

" syntastic python
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E231,E226,E251,E501,E301,E128'

"supertab + completion
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt-=preview

"markdown preview
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

"Markdown tables
let g:table_mode_corner="|"

"Easymotion
let g:EasyMotion_do_mapping=1
map <Leader> <Plug>(easymotion-prefix)
map <Leader>t <Plug>(easymotion-j)
map <Leader>n <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-F)

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

"Hiding tilde (~)
highlight EndOfBuffer guifg=bg ctermfg=bg

"""PLUGINS"""


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

map <Leader>f :call VexToggle(".")<CR>
