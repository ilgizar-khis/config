colorscheme my

nnoremap <BS> :cd ..<CR>

" nnoremap <C-c> :!echo -n %c:p | xclip -selection clipboard<CR>
nnoremap <C-c> :!echo "file://%c:p" | xclip -selection clipboard -t text/uri-list<CR>
nnoremap s :shell<CR>

" command! nvim !nvim %d

" nnoremap <C-v> :!xclip -o -selection clipboard -t text/uri-list | sed 's/^file:\/\///' | xargs -I {} cp {} .<CR>

set suggestoptions=normal,keys,otherpanel
set timeoutlen=2000

filextype *.png,*.jpg,*.jpeg,*.bmp,*.gif,*.webp feh

filextype *.mp4,*.mkv mpv

filextype *.html,*.pdf firefox

filextype *.zip,*.7z,*.tar*,*.tar.gz,*.tar.bz2,*.tar.xz,*.tar.zsz,*.tgz,*.rar xarchiver

filextype *.torrent deluge

set vicmd=nvim
set wildmenu
" ------------------------------------------------------------------------------
" Icons

" Filetypes
set classify=' :dir:/, :exe:, :reg:, :link:,? :?:, ::../::'

" Dirs
set classify+='  ::.git/::/,
             \  ::.github/::/,
             \ ⚙ ::.config/::/,
             \ ☕ ::java/::/,
             \  ::Desktop/::/,
             \  ::Documents/::/,
             \  ::Kod/::/,
             \  ::Downloads/::/,
             \  ::Music/::/,
             \  ::Pictures/::/,
             \  ::Public/::/,
             \  ::Templates/::/,
             \  ::Videos/::/,
             \  ::node_modules/::/'


" Подколючаем иконки 
" Files
set classify+='  ::.Xauthority,,.Xdefaults,,.Xresources,,.dmrc,,.DS_Store,,.fasd,,.inputrc,,.jack-settings,,.mime.types,,.nvidia-settings-rc,,.pam_environment,,.profile,,.recently-used,,.selected_editor,,.xinitrc,,.xinputrc,,config,,bspwmrc,,sxhkdrc,,Makefile,,Makefile.in,,Makefile.ac,,mimeapps.list,,.zshenv,,.zprofile,,.zshrc,,.zlogin,,.zlogout,,yabairc,,skhdrc,,ini,,user-dirs.dirs::,
             \  ::.vim,,.vimrc,,.viminfo,,init.vim,,.tmux.conf,,vifmrc::,
             \  ::.*.sw?::,
             \  ::.gitignore,,.gitattributes,,.gitconfig::,
             \  ::*.java,,*.jar,,*.jsh,,*.jsp,,*.jbang::,
             \  ::*.fish,,*.sh,,*.bash,,.bash_aliases,,.bashprofile,,.bash_profile,,.bash_logout,,.bash_history,,.bashrc,,::,
"\ ﯑ ::pom.xml::, piórko nie działa, poszukaj czego innego
             \  ::*.py,,*.pyc,,*.pyd,,*.pyo::,
             \  ::Dockerfile,,docker-compose.yml::,
             \  ::.fehbg::,
             \  ::favicon.ico::,
             \  ::gruntfile.coffee,,gruntfile.js,,gruntfile.ls::,
             \  ::gulpfile.coffee,,gulpfile.js,,gulpfile.ls::,
             \  ::ledger::,
             \  ::package.json,,package-lock.json,,webpack.config.js::,
             \  ::*.json,,*.bson::,
             \  ::.ncmpcpp,,playlists::,
             \  ::known_hosts,,authorized_keys,,*.pub,,*.rsa,,*.ecdsa,,license,,LICENSE.md,,LICENSE,,LICENSE.txt::,
             \  ::procfile::,
             \  ::README.*::,
             \  ::*.markdown,,*.md::,
             \  ::*.adoc,,*.asciidoctor::,
             \  ::*.ejs,,*.htm,,*.html,,*.slim,,*.xml::,
             \  ::*.pdf::,
             \  ::*.log::,
             \  ::*.css,,*.less,,*.scss,,*.bat,,*.conf,,*.ini,,*.rc,,*.yml,,*.cfg,,*.properties::,
             \  ::*.rss::,
             \  ::*.mustasche::,
             \  ::*.xul::,
             \  ::*.pl,,*.pm,,*.t::,
             \  ::*.php::,
             \  ::*.rb::,
             \  ::*.jsx::,
             \  ::*.erl,,*.hrl::,
             \  ::*.coffee::,
             \  ::*.twig::,
             \  ::*.c++,,*.cpp,,*.cxx,,*.h::,
             \  ::*.cc,,*.c::,
             \  ::*.hs,,*.lhs::,
             \  ::*.lua::,
             \  ::*.jl::,
             \  ::*.go::,
             \  ::*.ts::,
             \  ::*.db,,*.dump,,*.sql,,*.sqldump,,*.sqlite::,
             \  ::*.sln,,*.suo::,
             \  ::*.exe::,
             \  ::*.diff,,*.sum,,*.md5,,*.sha512::,
             \  ::*.scala::,
             \  ::*.bmp,,*.gif,,*.ico,,*.jpeg,,*.jpg,,*.png,,*.svg,,*.svgz,,*.tga,,*.tiff,,*.xmb,,*.xcf,,*.xpm,,*.xspf,,*.xwd,,*.cr2,,*.dng,,*.3fr,,*.ari,,*.arw,,*.bay,,*.crw,,*.cr3,,*.cap,,*.data,,*.dcs,,*.dcr,,*.drf,,*.eip,,*.erf,,*.fff,,*.gpr,,*.iiq,,*.k25,,*.kdc,,*.mdc,,*.mef,,*.mos,,*.mrw,,*.obm,,*.orf,,*.pef,,*.ptx,,*.pxn,,*.r3d,,*.raf,,*.raw,,*.rwl,,*.rw2,,*.rwz,,*.sr2,,*.srf,,*.srw,,*.tif,,*.x3f,,*.webp,,*.avif,,*.jxl::,
             \  ::*.aac,,*.anx,,*.asf,,*.au,,*.axa,,*.flac,,*.m2a,,*.m4a,,*.mid,,*.midi,,*.mp3,,*.mpc,,*.oga,,*.ogg,,*.ogx,,*.ra,,*.ram,,*.rm,,*.spx,,*.wav,,*.wma,,*.ac3::,
             \  ::*.ai::,
             \  ::*.psb,,*.psd::,
             \  ::*.cbr,,*.cbz::,
             \  ::*.doc,,*.docx,,*.odt::,
             \  ::*.xls,,*.xlsmx,,*.ods::,
             \  ::*.pptx,,*.ppt,,*.odp::,
             \  ::*.avi,,*.flv,,*.mkv,,*.mov,,*.mp4,,*.mpeg,,*.mpg,,*.webm,,*.av1::,
             \  ::*.epub,,*.pdf,,*.fb2,,*.djvu::,
             \  ::*.7z,,*.apk,,*.bz2,,*.cab,,*.cpio,,*.deb,,*.gem,,*.gz,,*.gzip,,*.lh,,*.lzh,,*.lzma,,*.rar,,*.rpm,,*.tar,,*.tgz,,*.xz,,*.zip,,*.zst::'

