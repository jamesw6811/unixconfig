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

" Treat long lines as break lines
map j gj
map k gk

" Indentation
set autoindent
set cindent
set smartindent

" Folding
" Enable folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the z key
nmap z za

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab
" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
set clipboard=unnamed

let g:coc_global_extensions = ['coc-eslint', 'coc-solargraph', 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-pyright', 'coc-prettier']

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>c  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Claude AI keybindings
" Trigger suggestion (works in both normal and insert mode)
nnoremap <silent> <C-S-c> :CocCommand claude.suggest<CR>
inoremap <silent> <C-S-c> <Esc>:CocCommand claude.suggest<CR>

" Force CoC completion to work in all filetypes including markdown
autocmd FileType markdown,text let b:coc_suggest_disable = 0
autocmd FileType markdown,text let b:coc_enabled = 1
" Enable word-based completion for markdown and text files
autocmd FileType markdown,text setlocal complete+=k

" Format
command! -nargs=0 Format :call CocActionAsync('format')
nmap <leader>f   :Format <CR>
nmap <leader>rn <Plug>(coc-rename)

" Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
set conceallevel=2
