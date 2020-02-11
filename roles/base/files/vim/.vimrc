" dein.vim
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Molokai（カラースキーム）
  call dein#add('tomasr/molokai')

  " スニペット管理
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Vim上でシェルが実行できる
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/vimshell', { 'rev' : '3787e5' })

  " ファイルツリー
  call dein#add('preservim/nerdtree')

  " 汎用シンタックスチェッカー
  call dein#add('vim-syntastic/syntastic')

  " ファイル検索
  call dein#add('ctrlpvim/ctrlp.vim')

  " Git操作
  call dein#add('tpope/vim-fugitive')

  " 複数行コメントアウト
  call dein#add('tpope/vim-commentary')

  " ステータスバー
  call dein#add('vim-airline/vim-airline')

  " 対となる括弧を追加/削除してくれるプラグイン
  call dein#add('jiangmiao/auto-pairs')

  " go plugins
  call dein#add('fatih/vim-go')

  " コード補完
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('Shougo/deoplete.nvim')

  call dein#end()
  call dein#save_state()
endif

let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"

" Required:
filetype plugin indent on
syntax enable
colorscheme molokai

if dein#check_install()
  call dein#install()
endif

" setting
" 文字コードをUFT-8に設定
set fenc=utf-8
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" ペーストでインデントがずれないよう設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

noremap <S-h> ^
noremap <S-l> $

if has("mouse") " Enable the use of the mouse in all modes
  set mouse=a
endif

noremap <Space>v :VimShellPop<CR>
noremap <Space>f :NERDTreeToggle<CR>

" ###################################################
" Vim Go
" ###################################################

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
