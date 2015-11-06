" ------------------------------------------------------------------------------
" Vim Composer                                                               {{{
"
" Author: Simone Gentili <sensorario@gmail.com>
"
" Description:
" Project creator for vim
"
" Requires: Vim
"
" License: MIT
"
" }}}
" ------------------------------------------------------------------------------

command! CreateNewPHPProject :call g:CreateNewPHPPRojectFunction()<CR>
command! CreateNewSymfonyProject :call StartNewSymfonyLtsProjectFunction()<CR>

function! g:CreateNewPHPPRojectFunction()
    exec "!curl -Ss https://getcomposer.org/installer | php"
    let l:project_name = input('Enter project name: ')
    exec '!php composer.phar create-project sensorario/starter ' . l:project_name . ' @dev'
    exec '!mv composer.phar ' . l:project_name . '/'
    exec 'qa'
endfunction

function! StartNewSymfonyLtsProjectFunction()
    exec '!clear'
    if 1 != filereadable("/usr/local/bin/symfony")
        exec '!sudo curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony'
        exec '!sudo chmod a+x /usr/local/bin/symfony'
    endif
    exec '!symfony new ' . input('Project name: ')
endfunction

