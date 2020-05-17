" ##############################################################################
"
"                            My .vimrc <carvalhojldc>
"
" ##############################################################################

" ##############################################################################
" General configs

" Show line numbers
"set number

" Coding     style:
"    No tabs in the source file.
"    All tab characters are 4 space characters. 
set tabstop=4
set shiftwidth=4
set expandtab

scriptencoding utf-8
set encoding=utf-8


" Show/Render tab
set listchars=tab:>·
set list

"-----------------
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
"-----------------
"highlight ColorColumn ctermbg=gray
"set colorcolumn=80

syntax enable

" ##############################################################################
" Config Plugin

" ==============================================================================
" Config nerdtree

" open with Ctrl N
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open a NERDTree automatically when vim starts up
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open file in new tab
let NERDTreeMapOpenInTab='\r'

" ==============================================================================
" Config fzf 

" See: https://bluz71.github.io/2018/12/04/fuzzy-finding-in-vim-with-fzf.html

"if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
"    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
"endif

let mapleader = " "
nnoremap <silent> <Leader><Space> :Files<CR>

nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>

"nnoremap <silent> <Leader>g :GFiles?

"nnoremap <silent> <Leader>b :Buffers<CR> 

" ==============================================================================
" Config tagbar

nmap <C-o> :TagbarToggle<CR>

" ==============================================================================
" Config airline 

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"let g:airline_theme='simple'
let g:airline_theme='badwolf'

map <C-m> :bnext<CR>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

map <C-x> :bwipe<CR>
" ==============================================================================
" Config cpp Highlighting

"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_posix_standard = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1
"let g:cpp_concepts_highlight = 1

let g:easytags_async=1
let g:easytags_auto_highlight=0

" ==============================================================================
" Config color-theme 

"---------------------------------------
" Molokai
colorscheme molokai
let g:molokai_original = 1


" ==============================================================================
" Config easytags

nmap <F5> :UpdateTags **//*.[hc]<CR>

" ==============================================================================
" Config Grepper

nmap <C-f> :Grepper -jump -side<CR>

" ##############################################################################
" Config nerd comment

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ##############################################################################
" Config clanf formater

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" ##############################################################################
" Control Pluginzz

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdcommenter'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
call plug#end()

