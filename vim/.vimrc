set nocompatible " be iMproved, required
filetype off     " required
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/home/jamesw/git/coc-vim-claude-complete', {'do': 'npm install && npm run build'}
Plug 'NoahTheDuke/vim-just'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vim-which-key'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
set regexpengine=0
filetype plugin indent on    " required

set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300
set hidden " Open other files if current one is not saved

" Enable Mouse mode in all modes
set mouse=a

" Numbers
set number
set numberwidth=4
set ruler

" paste mode
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

" Indentation
set autoindent
set cindent
set smartindent

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab
" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
set clipboard=unnamed

let g:coc_global_extensions = ['coc-eslint', 'coc-solargraph', 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-pyright', 'coc-prettier', 'coc-metals', 'coc-rust-analyzer']

" Ensure CoC works for all file types - disable the default disabled filetypes
let g:coc_filetypes_enable = ['*']
" Override any filetype restrictions
autocmd FileType * let b:coc_enabled = 1

" Common filetype mappings to ensure language servers work properly
let g:coc_filetype_map = {
  \ 'yaml.docker-compose': 'yaml',
  \ 'yaml.ansible': 'yaml',
  \ 'javascript.jsx': 'javascriptreact',
  \ 'typescript.jsx': 'typescriptreact',
  \ 'markdown.mdx': 'markdown',
  \ 'html.handlebars': 'html',
  \ 'html.mustache': 'html',
  \ 'css.scss': 'scss',
  \ 'css.sass': 'sass',
  \ 'css.less': 'less'
  \ }

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader> :WhichKey '\'<CR>

" Remap keys for applying codeAction to the current buffer.
nmap <leader>c  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Claude AI keybindings
" Trigger suggestion (works in both normal and insert mode)
nnoremap <silent> <C-S-c> :CocCommand claude.suggest<CR>
inoremap <silent> <C-S-c> <Esc>:CocCommand claude.suggest<CR>

" Trigger custom prompt suggestion
nnoremap <silent> <leader>p :CocCommand claude.prompt<CR>

" Force CoC completion to work in all filetypes including markdown
autocmd FileType markdown,text let b:coc_suggest_disable = 0
autocmd FileType markdown,text let b:coc_enabled = 1
" Enable word-based completion for markdown and text files
autocmd FileType markdown,text setlocal complete+=k

" Format
command! -nargs=0 Format :call CocActionAsync('format')
nmap <leader>f   :Format <CR>
nmap <leader>rn <Plug>(coc-rename)

" Git configuration
set signcolumn=yes

" GitGutter settings - shows git diff in sign column
let g:gitgutter_enabled = 1
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_preview_win_floating = 1

" GitGutter key mappings
nmap <leader>hp <Plug>(gitgutter-preview-hunk)
nmap <leader>hs <Plug>(gitgutter-stage-hunk)
nmap <leader>hu <Plug>(gitgutter-undo-hunk)
nmap ]c <Plug>(gitgutter-next-hunk)
nmap [c <Plug>(gitgutter-prev-hunk)

" Fugitive key mappings - comprehensive git integration
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Git log --oneline<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gP :Git pull<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gB :GBrowse<CR>

" FZF key mappings - file search
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :GFiles<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sr :Rg<CR>
nnoremap <leader>sl :Lines<CR>
nnoremap <leader>sL :BLines<CR>
nnoremap <leader>sh :History<CR>
nnoremap <leader>sc :Commands<CR>
nnoremap <leader>sm :Marks<CR>
nnoremap <leader>sw :Windows<CR>

" CoC completion colors - muted and italic
highlight! CocFloating ctermfg=245 guifg=#8a8a8a cterm=italic gui=italic
highlight! CocMenuSel ctermfg=245 ctermbg=238 guifg=#8a8a8a guibg=#444444 cterm=italic gui=italic
highlight! CocSearch ctermfg=245 guifg=#8a8a8a cterm=italic gui=italic
highlight! CocInlayHint ctermfg=242 guifg=#6c6c6c cterm=italic gui=italic
highlight! CocSemHighlightDefault ctermfg=245 guifg=#8a8a8a cterm=italic gui=italic

" Fold settings - start with all folds open
set foldlevelstart=99
set foldlevel=99
