call plug#begin('C:/.vim/plugged')
"=====================================================
" Plugins
"=====================================================
Plug 'preservim/nerdtree'                        " file navigation
Plug 'preservim/nerdcommenter'                   " auto commenting
Plug 'nathanaelkane/vim-indent-guides'           " show indents
Plug 'jiangmiao/auto-pairs'                      " auto pairs for '('
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " intelligence
"Plug 'tmhedberg/SimpylFold'                      " folding
" Themes
Plug 'justinmk/molokai'
Plug 'morhetz/gruvbox'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()            " required
filetype plugin indent on    " required

"=====================================================
" General settings
"=====================================================
" turn off visual effects 
set visualbell t_vd=
set belloff=all

" split settings
set splitright
set splitbelow

" scheme settings
colorscheme gruvbox
let g:airline_theme='gruvbox'

" encoding settings
set encoding=utf-8

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

" cwd the same as current file directory
set autochdir
" vim-run settings
let g:run_cmd_python = ['python']
" enable indent guides by default
let g:indent_guides_enable_on_vim_startup = 1
" close vim if only nerd tree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

"=====================================================
" coc.nvim settings.
"=====================================================
let g:python3_host_prog = 'C:\Python\python.exe'
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

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

