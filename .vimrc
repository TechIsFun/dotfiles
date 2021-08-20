set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'udalov/kotlin-vim'

"""""""""""""""
" Dart Support
"""""""""""""""
Plugin 'dart-lang/dart-vim-plugin'
" Enable DartFmt execution on buffer save
let g:dart_format_on_save = 1
" Enable Dart style guide syntax
let g:dart_style_guide = 2

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""
" Templates
""""""""""""
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/dotfiles/vim/templates/bash_script_template.sh
  augroup END
endif

set history=1000
syntax on
set backspace=indent,eol,start

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Enabled incremental search
set incsearch
" Autoreplacements
autocmd FileType dart inoremap ?: ??
autocmd FileType kotlin inoremap ?? ?:


"""""""""""""""""""""""""""""""""""""""""""""
" On the initial save, make the file 
" executable if it has a shebang line,
" e.g. #!/usr/bin/env
" This uses the user's umask for 
" determining the executable bits to be set.
"""""""""""""""""""""""""""""""""""""""""""""
function! s:GetShebang()
    return matchstr(getline(1), '^#!\S\+')
endfunction
function! s:MakeExecutable()
    if exists('b:executable') | return | endif
    let l:shebang = s:GetShebang()
    if empty(l:shebang) ||
    \   executable(expand('%:p')) ||
    \   ! executable('chmod')
        return
    endif

    call system('chmod +x ' . shellescape(expand('%')))
    if v:shell_error
        echohl ErrorMsg
        echomsg 'Cannot make file executable: ' . v:shell_error
        echohl None
        let b:executable = 0
    else
        echomsg 'Detected shebang' l:shebang . '; made file executable as' getfperm(expand('%'))
        let b:executable = 1
    endif
endfunction
augroup ExecutableFileDetect
    autocmd!
    autocmd BufWritePost * call <SID>MakeExecutable()
augroup END


" com! -complete=file -nargs=* Edit silent! exec "!vim --servername " . v:servername . " --remote-silent <args> tests/<args>_test"

""""""""""""
" The command :Tabe *.py *.txt opens a new tab page for each *.py and each *.txt file. When finished, the current tab page shows the first file added
""""""""""""
command! -complete=file -nargs=* Tabe call Tabe(<f-args>)
function! Tabe(...)
  let t = tabpagenr()
  let i = 0
  for f in a:000
    for g in glob(f, 0, 1)
      exe "tabe " . fnameescape(g)
      let i = i + 1
    endfor
  endfor
  if i
    exe "tabn " . (t + 1)
  endif
endfunction

