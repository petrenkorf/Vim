set nocompatible
set nowrap
set autoread

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'majutsushi/tagbar'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'craigemery/vim-autotag'
Plugin 'gmarik/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wavded/vim-stylus'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'vim-vdebug/vdebug'
Plugin 'neomake/neomake'
Plugin 'thoughtbot/vim-rspec'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-fireplace'
Plugin 'jiangmiao/auto-pairs'

" Optional:
Plugin 'honza/vim-snippets'
Plugin 'dracula/vim'

call vundle#end()

call neomake#configure#automake('nrwi', 500)

filetype plugin indent on

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

" --- general settings ---
set ruler
set number
set showcmd
set incsearch
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set swapfile
set dir=~/tmp

autocmd vimenter * NERDTree

let g:rainbow_active=1
let g:autotagTagsFile="tags"

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|node_modules$\|vendor$\|storage$\|public\/vendor$\|public_html\/node_modules|public_html\/js\/vendor|coverage$|public_html\/var$',
    \ 'file': '\v\.(exe|so|dll|swp|json|ttf|svg|woff|eot|png|jpeg|jpg|gif)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" let g:snipMate.snippet_dirs = [ '~/.vim/bundle/vim-snippets/snippets' ]

" ----------- tags
set tags+=tags,vendortags


syntax on
color space-vim-dark

" ------------ maps
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

nmap <C-f> :tag<space>
nmap <F8> :TagbarToggle<CR>
nmap <F2> :Breakpoint<CR>
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

au BufNewFile,BufRead *.phn set filetype=clojure
