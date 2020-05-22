call plug#begin('C:/.vim/plugged')
"=====================================================
" Plugins
"=====================================================
" File navigation
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
" Git integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
" Themes
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
" Status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
" Other
    Plug 'preservim/nerdcommenter'                   " auto commenting
    Plug 'jiangmiao/auto-pairs'                      " auto pairs for '('
    Plug 'neoclide/coc.nvim', {'branch': 'release'}  " intelligence
    Plug 'tmhedberg/SimpylFold'                      " folding
    Plug 'justinmk/vim-sneak'                        " minimal motion plugin
    Plug 'unblevable/quick-scope'                    " fast searching in a line

call plug#end()            " required
filetype plugin indent on  " required

"=====================================================
" General settings
"=====================================================
" turn off visual effects
set visualbell t_vd=
set belloff=all

" fast scrolling
set scrolljump=5

" split settings
set splitright
set splitbelow

" scheme and airline settings
colorscheme onedark
let g:airline_theme='onedark'
let g:airline_detect_spell=0
set noshowmode

" encoding settings
set encoding=utf-8
set incsearch

" spelling settings
set spelllang=en_us
set spell

" hide panels
set guioptions-=T   " toolbar
set guioptions-=r   " right scrollbar
set guioptions-=L   " left scrollbar
set guioptions-=m   " menu
let g:onedark_hide_endofbuffer = 1

" left column settings
set nu
set ruler
set relativenumber

" change font of AutoComplete menu
au VimEnter * GuiPopupmenu 0

" cwd the same as current file directory
set autochdir
cd $HOME/Desktop

" vim-run settings
let g:run_cmd_python = ['python']
" close vim if only nerd tree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" delete all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"=====================================================
" Python settings
"=====================================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set smartindent
set autoindent
let python_highlight_all=1
syntax on

"=====================================================
" User hot keys
"=====================================================
inoremap jk <esc>
inoremap kj <esc>

" map nohlsearch
nnoremap <leader><leader> :nohlsearch<CR>

" map adding blank line.
nnoremap <CR> m`o<Esc>``
nnoremap <S-CR> m`O<Esc>``

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" resize windows
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-l> :vertical resize -2<CR>
nnoremap <silent> <M-h> :vertical resize +2<CR>

" moving lines
xnoremap <silent> K :move '<-2<CR>gv-gv
xnoremap <silent> J :move '<+1<CR>gv-gv

" tab navigations
nnoremap <silent> <C-TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" TODO operations
nnoremap <silent> \t /# TODO:<CR>
nnoremap <silent> \T ?# TODO:<CR>
nnoremap <silent> d\t :s/# TODO:/#<CR>

" copy and paste to/from clipboard
noremap <leader>y "*y
noremap <leader>p "*p
nnoremap <silent> P A <esc>p

" delete text from line
nnoremap <silent> <space>d ^d$
" rename the current word
nmap <F2> <Plug>(coc-rename)

" auto commenting setting
nnoremap <silent> <C-/> :call NERDComment(0,"toggle")<CR>
vnoremap <silent> <C-/> :call NERDComment(0,"toggle")<CR>

" run python code using <C-R>
nnoremap <F9> :w <CR> :sp <CR> :term python % <CR>

" open nerd tree using <F5>
map <silent> <F5> :NERDTreeToggle<CR>

map :W <Nop>

"=====================================================
" git settings.
"=====================================================
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

"=====================================================
" quick-scope settings.
"=====================================================
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#83a598' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#8ec07c' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

"=====================================================
" fzf settings.
"=====================================================
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

map <silent> <C-f> :FZF<CR>
map <silent> <leader>s :Lines<CR>

" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp', 'options': '--no-preview'} }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"=====================================================
" coc.nvim settings.
"=====================================================
let g:python3_host_prog = 'C:\Python\python.exe'
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

