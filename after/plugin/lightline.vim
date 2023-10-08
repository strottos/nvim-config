" Lightline
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'percent' ],
    \              [ 'lineinfo', 'totalcharnum' ],
    \              [ 'charvaluehex' ] ],
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \ },
    \ 'component': {
    \   'charvaluehex': '0x%B',
    \   'totalcharnum': '%1*%6o%*'
    \ },
    \ }
function! LightlineFilename()
    let l:max_size = max([winwidth('%') - 50, 10])
    let l:filename = expand('%:p')
    let l:ret = l:filename !=# '' ? (len(l:filename) >= l:max_size ? ".." . l:filename[len(l:filename) - l:max_size + 3:len(l:filename)] : l:filename) : '[No Name]'
    return l:ret
endfunction
