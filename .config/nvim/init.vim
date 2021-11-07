set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" Plugins
Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'raimondi/delimitmate'
Plug 'ap/vim-css-color'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'palantir/tslint'
Plug 'quramy/tsuquyomi'
Plug 'frazrepo/vim-rainbow'
Plug '/usr/local/opt/fzf'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" Themes
Plug 'nlknguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
set nocompatible
set hidden
set encoding=utf-8
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
let g:indent_guides_enable_on_vim_startup = 1
" UI stuff
syntax on
set number
set background=dark
set noshowmode
set backspace=indent,eol,start
set conceallevel=0
" colorscheme PaperColor

" Omnifunction
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" vim options that make plugins better
set updatetime=100
set laststatus=2

" indentation stuff
set autoindent
set smartindent
set pastetoggle=<F2>

" enable folding and stuff
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab

" mouse support
set mouse=a

" shortcuts for tabs and splits
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vs <C-R>=expand("%:p:h") . "/" <CR>
" shortcuts for ctrl-a and ctrl-e in insert mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" invoke FZF when <C-p> is pressed
nnoremap <C-p> :FZF <CR>

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Typescript stuff
let g:tsuquyomi_completion_detail = 1

" Linting
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" NERDTree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Lightline theme
 let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }

" Emmet only enabled for HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" enable rainbow parens for everything
let g:rainbow_active = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline_powerline_fonts = 1
