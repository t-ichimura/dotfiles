【Vim新規インストール時の設定メモ】

0)事前準備
　・gitをインストールする（手順は省略）
　・gitのコマンドのパス<C:\Program Files\Git\cmd>を環境変数PATHに追加

1)githubからcloneする

　git clone https://github.com/t-ichimura/dotfiles.git <Vimインストール先ディレクトリ名>

2)Vim本体をVimインストール先ディレクトリに展開
　Vim UTF-8 日本語版(https://sites.google.com/site/fudist/Home/vim-nihongo-ban)からインストールする場合、
　事前にvimfiles/doc,syntaxの日本語ヘルプを削除すること(NeoBundleで管理しているため、githubで管理する際、邪魔になる)

3)NeoBundleのインストール
　以下のコマンドで、インストールする

　cd <Vimインストール先ディレクトリ>
　git clone git://github.com/Shougo/neobundle.vim ./vimfiles/bundle/neobundle.vim

4)Vimを起動する
