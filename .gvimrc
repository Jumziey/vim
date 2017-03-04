"gvim
set guioptions=-m
set guioptions=-t

if has ("win32")
	set guifont=Droid_Sans_Mono_Slashed_for_Pow:h10
else
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif
"Use the system clipboard
set clipboard=unnamed
"Get a menu for copying etc when rigt-clicking
set mousemodel=popup
