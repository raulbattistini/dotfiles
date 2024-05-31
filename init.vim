call plug#begin()
" The default plugin directory will be as follows:
"
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'voldikss/vim-floaterm'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'folke/tokyonight.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" (Optional) Multi-entry selection UI.
Plug 'github/copilot.vim'
" Any valid git URL is allowed
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lsp'
Plug 'mfussenegger/nvim-jdtls'
Plug 'preservim/nerdcommenter'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tanvirtin/monokai.nvim'
Plug 'yassinebridi/vim-purpura'
" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }
Plug 'sbdchd/neoformat'
" Rust-related plugins
Plug 'rust-lang/rust.vim' " Rust syntax highlighting and integration
Plug 'racer-rust/vim-racer' " Code completion, jump-to-definition, etc.
Plug 'rust-lang/rustfmt' " Rust code formatting
" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Vim-Plug:
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/harpoon', { 'as': 'harpoon2', 'branch': 'harpoon2' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'Tsuzat/NeoSolarized.nvim', { 'branch': 'master' }
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'dylanaraps/wal.vim'
Plug 'jaredgorski/spacecamp'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'bignimbus/pop-punk.vim'
Plug 'amadeus/vim-evokai'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'thedenisnikulin/vim-cyberpunk'
Plug 'artanikin/vim-synthwave84'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rose-pine/vim', { 'as': 'rosepine' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Vim-Plug:
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
" Plug 'bpstahlman/txtfmt'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
let g:python_host_prog = 'C:/Python311/python'
let g:python3_host_prog = 'C:/Python311/python'
let g:neoformat_try_node_exe = 1
" Use formatprg when available
let g:neoformat_try_formatprg = 1
" Format the current file with Prettier
autocmd FileType javascript,json,typescript,html,css,scss lua require("prettier").formatFile()
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
nnoremap <leader>pf :lua require("prettier").formatFile()<CR>

" Set Harpoon keybindings
nnoremap <silent> <leader>ha :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <leader>hh :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent> <leader>hj :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent> <leader>hk :lua require("harpoon.term").gotoTerminal(3)<CR>
nnoremap <silent> <leader>hl :lua require("harpoon.term").gotoTerminal(4)<CR>

" Terminal Function
" Rust
" Rust-specific settings
autocmd FileType rust setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType rust nnoremap <buffer> <F5> :w<CR>:!cargo run<CR>
nnoremap <silent> <leader>aa :sp<bar>term<cr><c-w>J:resize10<cr>

" appearance, background
set termguicolors
set relativenumber
set number

function! MyHighlights() abort
    highlight Visual     cterm=NONE ctermbg=76  ctermfg=16  gui=NONE guibg=#5fd700 guifg=#000000
    highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#440080
    " highlight Normal cterm=NONE gui=NONE guibg=#340154
    " highlight NonText cterm=NONE gui=NONE guibg=#340154 or #000110 can also be #222332
    highlight Normal cterm=NONE gui=NONE guibg=#000110
    highlight NonText cterm=NONE gui=NONE guibg=#000110
" Highlight for LineNr (line number column)
    highlight LineNr ctermbg=NONE gui=NONE guibg=#330b85 guifg=#cfcfcf
" Set foreground and background color
endfunction



let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

set guicursor=n-v-c-i:underscore


colorscheme synthwave_gh 
" highlight Visual cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#5fd700 guifg=#000000
" highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" Launch gopls when Go files are in use
" Run gofmt on save
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
" normal/insert

" example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle
" NerdCommenter 
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

nnoremap <silent> <leader>c} V}:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call nerdcommenter#Comment('x', 'toggle')<CR>
xnoremap <silent> <leader>c :<C-u>call nerdcommenter#Comment('x', 'toggle')<CR>
