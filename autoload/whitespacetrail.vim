" Thanks to http://vim.wikia.com/wiki/Highlight_unwanted_spaces for the
" starting point how to do this and mail@kore-nordmann.de for pointing me to it
" :)

function! whitespacetrail#ShowWhitespaceTrail()
    augroup whitespacetrail
        autocmd!
        autocmd InsertEnter <buffer> match WhitespaceTrail /\s\+\%#\@<!$/
        autocmd InsertLeave <buffer> match WhitespaceTrail /\s\+$/
    augroup end
    match WhitespaceTrail /\s\+$/
    let b:whitespacetrail=1
endfunc

function! whitespacetrail#HideWhitespaceTrail()
    augroup whitespacetrail
        autocmd!
    augroup end
    call clearmatches()
    let b:whitespacetrail=0
endfunc

function! whitespacetrail#ToggleWhitespaceTrail()
    if !exists( "b:whitespacetrail" )
        let b:whitespacetrail=0
    endif
    if b:whitespacetrail
        call whitespacetrail#HideWhitespaceTrail()
    else
        call whitespacetrail#ShowWhitespaceTrail()
    endif
endfunc

" Thanks to toby@schlitt.info for this little snippet.
function! whitespacetrail#RemoveTrailingWhitespace( offset )
    let l:lastline = line(".") + a:offset
    call setline(l:lastline, substitute(getline(l:lastline), '\s\+$', '', ''))
endfunc
