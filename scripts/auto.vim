
augroup _format
	autocmd!
	" autocmd BufWritePre *.go :silent! !go fmt %
	autocmd BufWritePre *.py :Format
augroup END
