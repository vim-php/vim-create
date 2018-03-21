" ------------------------------------------------------------------------------
" Vim Composer                                                               {{{
" Author: Simone Gentili <sensorario@gmail.com>
" Description:
" PHP Project creator for vim
" Requires: Vim
" License: MIT
" }}}
" ------------------------------------------------------------------------------

command! CreateNewPHPProject :call g:CreateNewPHPPRojectFunction()<CR>
command! CreateNewSymfonyProject :call StartNewSymfonyLtsProjectFunction()<CR>
command! CreateNewPennyProject :call StartNewPennyProjectFunction()<CR>

function! g:CreateNewPHPPRojectFunction()
    exec "!curl -Ss https://getcomposer.org/installer | php"
    let l:project_name = input('Enter project name: ')
    exec '!php composer.phar create-project sensorario/starter ' . l:project_name . ' v1.0.4'
    exec '!mv composer.phar ' . l:project_name . '/'
    exec 'qa'
endfunction

function! StartNewSymfonyLtsProjectFunction()
    exec "!curl -Ss https://getcomposer.org/installer | php"
    let l:project_name = input('Enter project name: ')
    exec '!php composer.phar create-project symfony/skeleton ' . l:project_name
    exec '!mv composer.phar ' . l:project_name . '/'
    exec 'qa'
endfunction

function! StartNewPennyProjectFunction()
    exec '!clear'
    exec '!composer create-project penny/classic-app -s dev ' . input('Project name: ')
endfunction

