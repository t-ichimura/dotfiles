"=============================================================================
"    Description: .vimrc設定
"         Author: Takashi Ichimura
"  Last Modified: 2011-01-07
"        Version: 1.01
"=============================================================================
set nocompatible
scriptencoding cp932
"scriptencodingと、このファイルのエンコーディングが一致するよう注意！
"scriptencodingは、vimの内部エンコーディングと同じものを推奨します。
"改行コードは set fileformat=unix に設定するとunixでも使えます。

"----------------------------------------
" ユーザーランタイムパス設定
"----------------------------------------
"Windows, unixでのruntimepathの違いを吸収するためのもの。
"$MY_VIMRUNTIMEはユーザーランタイムディレクトリを示す。
":echo $MY_VIMRUNTIMEで実際のパスを確認できます。
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"ランタイムパスを通す必要のあるプラグインを使用する場合、
"$MY_VIMRUNTIMEを使用すると Windows/Linuxで切り分ける必要が無くなります。
"例) vimfiles/qfixapp (Linuxでは~/.vim/qfixapp)にランタイムパスを通す場合
"set runtimepath+=$MY_VIMRUNTIME/qfixapp

"----------------------------------------
" 内部エンコーディング指定
"----------------------------------------
"内部エンコーディングのUTF-8化と文字コードの自動認識設定をencode.vimで行う。
"オールインワンパッケージの場合 vimrcで設定されているので何もしない。
"エンコーディング指定や文字コードの自動認識設定が適切に設定されている場合、
"次行の encode.vim読込部分はコメントアウトして下さい。
silent! source $MY_VIMRUNTIME/pluginjp/encode.vim
"scriptencodingと異なる内部エンコーディングに変更する場合、
"変更後にもscriptencodingを指定しておくと問題が起きにくくなります。
scriptencoding cp932

"----------------------------------------
" システム設定
"----------------------------------------
"mswin.vimを読み込む
"source $VIMRUNTIME/mswin.vim
"behave mswin

"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup
"バックアップを作成しない
set nobackup
"バックアップ先を設定
" set backupdir=$TEMP
if version >= 703
  "再読込、vim終了後も継続するアンドゥ(7.3)
  "set undofile
  "アンドゥの保存場所(7.3)
  "set undodir=.
endif
"スワップファイルを作成しない
set noswapfile
"viminfoを作成しない
"set viminfo=
"クリップボードを共有
set clipboard-=unnamed
" 加算・減算処理時にアルファベットを対象にする
set nrformats+=alpha
"8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500
"編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
"ヒストリの保存数
set history=50
"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block
"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"コマンドライン補完は、候補一覧、次候補、次候補……最初となる
set nowildmenu
set wildmode=list:longest,full
"マウスを有効にする
if has('mouse')
  set mouse=a
endif
"pluginを使用可能にする
filetype plugin indent on
"挿入及び改行時にコメントを自動入力しない
autocmd FileType * set formatoptions-=ro

"----------------------------------------
" 検索
"----------------------------------------
"検索の時に大文字小文字を区別しない
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
"検索時にファイルの最後まで行ったら最初に戻らない
set nowrapscan
"インクリメンタルサーチ
set incsearch
"検索文字の強調表示
set hlsearch
"w,bの移動で認識する文字
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"vimgrep をデフォルトのgrepとする場合internal
"set grepprg=internal

"----------------------------------------
" 表示設定
"----------------------------------------
"スプラッシュ(起動時のメッセージ)を表示しない
"set shortmess+=I
"エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
"マクロ実行中などの画面再描画を行わない
"set lazyredraw
"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash
"行番号表示
set number
if version >= 703
  "相対行番号表示(7.3)
  "set relativenumber
endif
"ルーラー表示する
set ruler
"括弧の対応表示時間
set showmatch matchtime=1
"<TAB>の表示幅とインデント及び<TAB>,<BS>での移動幅を設定
"set ts=4 sw=4 sts=4
"自動的にインデントする
set autoindent
"Cインデントの設定
set cinoptions+=:0
"タイトルを表示
set title
"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2
set laststatus=2
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~
"カーソル行を強調表示
set cursorline

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

"色テーマ設定
"gvimの色テーマは.gvimrcで指定する
"colorscheme mycolor

""""""""""""""""""""""""""""""
"ステータスラインに文字コード等表示
"iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%{PrintValueDebug()}[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=\ (%v,%l)/%L%8P\ 
endif

"FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

let g:debugmode = 0
function! StartDebugMode()
  let g:debugmode = 1
endfunction
function! EndDebugMode()
  let g:debugmode = 0
endfunction

"PrintValueDebug() : ステータスラインに値を表示
function! PrintValueDebug()
  let x = ""
  if g:debugmode == 1
    let x = x . "IME=" . &iminsert
    let x = x . "," . "MODE=" . mode()

    let x = "[" . x . "]"
  endif
  return x
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"----------------------------------------
" diff/patch
"----------------------------------------
"diffの設定
if has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction
endif

"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
"パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

"----------------------------------------
" ノーマルモード
"----------------------------------------
"ヘルプ検索
nnoremap <F1> K
"現在開いているvimスクリプトファイルを実行
nnoremap <F8> :source %<CR>
"強制全保存終了を無効化
nnoremap ZZ <Nop>
"カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
"キーボードマクロには物理行移動を推奨
"h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
"バッファ移動
nnoremap <C-Tab>   :bnext<CR>
nnoremap <C-S-Tab> :bprevious<CR>
" タブページ移動
nnoremap <C-PageUp>   :tabprevious<CR>
nnoremap <C-PageDown> :tabnext<CR>
" 検索後のハイライトを消す
nnoremap <silent> <Esc> <Esc>:nohlsearch<CR>
" 検索語を画面の真ん中へ表示
nnoremap n nzz
nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# gnzz
"ウィンドウ分割(方向・サイズ指定可能)
nmap <Space>sj <SID>(split-to-j)
nmap <Space>sk <SID>(split-to-k)
nmap <Space>sh <SID>(split-to-h)
nmap <Space>sl <SID>(split-to-l)
nnoremap <SID>(split-to-j) :<C-u>execute 'belowright' (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-k) :<C-u>execute 'aboveleft'  (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-h) :<C-u>execute 'topleft'    (v:count == 0 ? '' : v:count) 'vsplit'<CR>
nnoremap <SID>(split-to-l) :<C-u>execute 'botright'   (v:count == 0 ? '' : v:count) 'vsplit'<CR>
" 検索後のヒットワードをquickfixへ表示
nmap <unique> g/ :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>
" 移動でカーソルを中央に表示(EOF移動時は最下行表示)
nnoremap <silent> G :<C-u>call CursorPositioningWhenMoving()<CR>
function! CursorPositioningWhenMoving()
  if v:count > 0
    call feedkeys(v:count . "\<C-End>zz")
  else
    call feedkeys("\<C-End>z-")
  endif
endfunction

"l を <Right>に置き換えても、折りたたみを l で開くことができるようにする
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

"カーソル位置の単語を単語単位の検索文字列に設定
nnoremap <silent> *  :<C-u>call MySetSearch('""yiw', 'word')<CR>:let &hlsearch=&hlsearch<CR>
"カーソル位置の単語を非単語単位の検索文字列に設定
nnoremap <silent> g* :<C-u>call MySetSearch('""yiw')<CR>:let &hlsearch=&hlsearch<CR>
"カーソル位置から単語の末尾までを検索文字列に設定
nnoremap <silent> #  :<C-u>call MySetSearch('""ye')<CR>:let &hlsearch=&hlsearch<CR>

"----------------------------------------
" 挿入モード
"----------------------------------------
"方向キーの割り当て
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

"----------------------------------------
" ビジュアルモード
"----------------------------------------
"文字列選択中なら選択文字列を検索レジスタに設定。
vnoremap <silent> * :<C-u>call MySetSearch('""vgvy')<CR>:let &hlsearch=&hlsearch<CR>
vnoremap <silent> # :<C-u>call MySetSearch('""vgvy')<CR>:let &hlsearch=&hlsearch<CR>
" Visualモード時の行末移動で改行コードを含まない
vnoremap $ g_

"----------------------------------------
" コマンドモード
"----------------------------------------
"検索パターンで / or ? の入力時に\を付与する 
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

"----------------------------------------
" オートコマンド
"----------------------------------------
" 挿入モード時にオートインデントを設定
augroup AutoIndentOff
  autocmd!
  autocmd InsertEnter  *     execute 'set autoindent'
augroup END
" 挿入モード終了時にオートインデントを解除
augroup AutoIndentOff
  autocmd!
  autocmd InsertLeave  *     execute 'set noautoindent'
augroup END

"----------------------------------------
" Vimスクリプト
"----------------------------------------
""""""""""""""""""""""""""""""
"検索ワードをセットする。
"何か追加パラメータが設定されていたら、単語単位検索に。
""""""""""""""""""""""""""""""
function! MySetSearch(cmd, ...)
  let saved_reg = @"
  if a:cmd != ''
    silent exec 'normal! '.a:cmd
  endif
  let pattern = escape(@", '\\/.*$^~[]')
  let pattern = substitute(pattern, '\n$', '', '')
  if a:0 > 0
    let pattern = '\<'.pattern.'\>'
  endif
  let @/ = pattern
  let @" = saved_reg
endfunction 

""""""""""""""""""""""""""""""
"<Esc>押したときの処理
""""""""""""""""""""""""""""""
function! PushEscapeKey()
  exec ":nohlsearch<CR><ESC>"
endfunction

""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
"$VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインのカラー変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので、scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
"scriptencoding cp932
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  "全角スペースを明示的に表示する
  silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

""""""""""""""""""""""""""""""
"grep,tagsのためカレントディレクトリをファイルと同じディレクトリに移動する
""""""""""""""""""""""""""""""
if exists('+autochdir')
  "autochdirがある場合カレントディレクトリを移動
  set autochdir
else
  "autochdirが存在しないが、カレントディレクトリを移動したい場合
  au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
endif

"----------------------------------------
" 各種プラグイン設定
"----------------------------------------
" pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" netrw
let g:netrw_home = $HOME

"----------------------------------------
" 一時設定
"----------------------------------------
