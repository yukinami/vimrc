" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab
  set stal=2
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_set_highlights = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_enter = 1
" let g:ale_completion_enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
\ '_': ['ale', 'ultisnips'],
\})

inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript let b:ale_linters = ['tsserver', 'standard']
au FileType javascript let b:ale_fixers = ['standard']

""""""""""""""""""""""""""""""
" => Python section
"""""""""""""""""""""""""""""""
au FileType python let b:ale_linters = ['pyls', 'flake8']
