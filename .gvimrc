"gvim
set guioptions=-m
set guioptions=-t

if has ("win32")
	set guifont=Droid_Sans_Mono_Slashed_for_Pow:h10
else
	"set guifont=mononoki\ Regular\ 12
	"set guifont=Inconsolata\ for\ Powerline\ Medium\ 13
	set guifont=Fira\ Code\ Regular\ 11
	"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
endif

"Use the system clipboard
if has ("win32")
	set clipboard=unnamed
else 
	set clipboard=unnamedplus
endif

"Get a menu for copying etc when rigt-clicking
set mousemodel=popup
