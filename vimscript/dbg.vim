function DbgCpp()
:	echo bufname("%")
: 	let filename=bufname("%")	
: 	let filenameNoExt=expand("%:r")
: 	let args=filename. " -o ".filenameNoExt." -ggdb "
: 	let script="g++ ".args." -std=c++17"
:  	echo script
:	echom(system(script))
" 	let runScript="./".filenameNoExt." < in >out"	
" 	echom(system(runScript))
:endfunction
