function Pyrun()
:	echo bufname("%")
: 	let filename=bufname("%")	
: 	let runScript="/usr/bin/python3.8 ".filename." <in"
: 	echom(system(runScript))
:endfunction

function PyrunNoinput()
:	echo bufname("%")
: 	let filename=bufname("%")	
: 	let runScript="/usr/bin/python3.8 ".filename
: 	echom(system(runScript))
:endfunction
