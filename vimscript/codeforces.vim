function Codeforces()
:	echo bufname("%")
: 	let filename=bufname("%")	
: 	let filenameNoExt=expand("%:r")
: 	let args=filename. " -o  ".filenameNoExt
: 	let script="g++ ".args." -std=c++17"
:  	echo script
:	echom(system(script))
: 	let runScript="./".filenameNoExt." < in >out"	
: 	echo runScript
: 	echom(system(runScript))
:endfunction


function Cfinit()
:	:vsp in
: 	wincmd x
: 	wincmd l
: 	:sp out
: 	wincmd x
	
:endfunction

function CfDone()
:	echo bufname("%")
: 	let filename=bufname("%")	
: 	let filenameNoExt=expand("%:r")
: 	let mvscript="cp ".filename.' ./done/'.filenameNoExt.'_done.cpp'
: 	let rmscript="rm ".filenameNoExt.' '.filename
: 	let pyscript='python3 ~/.config/nvim/pyscript/api.py'
	echom(system(mvscript))
	echom(system(rmscript))
	echom(system(pyscript))

endfunction
