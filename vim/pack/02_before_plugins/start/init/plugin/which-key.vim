" define prefix dictionary
let g:which_key_map={}

" git menu
let g:which_key_map.g={
    \'name' : 'Git',
    \'s' : ['Gstatus', 'Status'],
    \'p' : ['Gpull', 'Pull'],
    \'u' : ['Gpush', 'Push'],
    \'c' : ['Gcommit', 'Commit'],
    \'w' : ['Gwrite', 'Write'],
    \'d' : ['Gdiff', 'Diff'],
    \'l' : ['Glog', 'Log'],
    \'f' : ['Gfetch', 'Fetch'],
    \'b' : ['Gblame', 'Blame'],
    \'k' : ['Gitv', 'Gitk']
    \}

" gitgutter hunks menu
let g:which_key_map.g.h={
    \'name' : 'Hunks',
    \'p' : ['<Plug>GitGutterPreviewHunk', 'Preview'],
    \'u' : ['<Plug>GitGutterUndoHunk', 'Undo'],
    \'s' : ['<Plug>GitGutterStageHunk', 'Stage']
    \}

" nerdcommenter menu
let g:which_key_map.c={
    \'name' : 'Comments',
    \' ' : ['<Plug>NERDCommenterToggle', 'Toggle'],
    \'$' : ['<Plug>NERDCommenterToEOL', 'From cursor to EOL'],
    \'a' : ['<Plug>NERDCommenterAltDelims', 'Switch to alternate delimiters'],
    \'A' : ['<Plug>NERDCommenterAppend', 'Add comment at EOL'],
    \'b' : ['<Plug>NERDCommenterAlignBoth', 'Aligned both sides'],
    \'c' : ['<Plug>NERDCommenterComment', 'Comment'],
    \'i' : ['<Plug>NERDCommenterInvert', 'Toggle selected line(s)'],
    \'l' : ['<Plug>NERDCommenterAlignLeft', 'Aligned left side'],
    \'m' : ['<Plug>NERDCommenterMinimal', 'Minimal'],
    \'n' : ['<Plug>NERDCommenterNested', 'Nested'],
    \'s' : ['<Plug>NERDCommenterSexy', 'Sexy'],
    \'u' : ['<Plug>NERDCommenterUncomment', 'Uncomment'],
    \'y' : ['<Plug>NERDCommenterYank', 'Yank & comment']
    \}

" test menu
let g:which_key_map.e={
    \'name' : 'Test',
    \'t' : ['TestNearest', 'Nearest'],
    \'T' : ['TestFile', 'This file'],
    \'a' : ['TestSuite', 'All'],
    \'l' : ['TestLast', 'Last'],
    \'g' : ['TestVisit', 'Open test file']
    \}

" toggles
let g:which_key_map.t={
    \'name' : 'Toggles',
    \'l' : ['LToggle', 'Location list'],
    \'q' : ['asyncrun#quickfix_toggle(8)', 'Quickfix window'],
    \'N' : ['ToggleNERDTreeTabsFind()', 'NERDTree'],
    \'t' : ['TagbarToggle', 'Tagbar'],
    \'n' : ['NumbersToggle', 'Numbers'],
    \'u' : ['UndotreeToggle', 'Undotree']
    \}

" searches
let g:which_key_map.a=['Ag', 'ag search']
if has('mac')
    let g:which_key_map.d=['Dash', 'Dash search']
endif

" fzf
let g:which_key_map.f={
    \'name' : 'Fuzzy search',
    \'f' : ['Files', 'Files'],
    \'g' : ['GFiles', 'Git files'],
    \'b' : ['Buffers', 'Open buffers'],
    \'l' : ['Lines', 'Lines in loaded buffers'],
    \'c' : ['Commits', 'Git commits'],
    \'t' : ['Tags', 'Tags in project'],
    \'h' : ['History', 'History'],
    \'o' : ['Commands', 'Commands'],
    \'m' : ['Maps', 'Normal mode mappings'],
    \'e' : ['Helptags', 'Help tags'],
    \'y' : ['Filetypes', 'File types']
    \}

" easymotions
let g:which_key_map['\']={
    \'name' : 'Easymotion',
    \'f'  : ['<Plug>(easymotion-f)', 'Find char to the right'],
    \'F'  : ['<Plug>(easymotion-F)', 'Find char to the left'],
    \'t'  : ['<Plug>(easymotion-t)', 'Till before the char to the right'],
    \'T'  : ['<Plug>(easymotion-T)', 'Till after the char to the left'],
    \'w'  : ['<Plug>(easymotion-w)', 'Beginning of word forward'],
    \'W'  : ['<Plug>(easymotion-W)', 'Beginning of WORD forward'],
    \'b'  : ['<Plug>(easymotion-b)', 'Beginning of word backward'],
    \'B'  : ['<Plug>(easymotion-B)', 'Beginning of WORD backward'],
    \'e'  : ['<Plug>(easymotion-e)', 'End of word forward'],
    \'E'  : ['<Plug>(easymotion-E)', 'End of WORD forward'],
    \'g' : {
        \ 'name' : 'End of word/WORD backward',
        \'e' : ['<Plug>(easymotion-ge)', 'End of word backward'],
        \'E' : ['<Plug>(easymotion-gE)', 'End of WORD backward'],
        \},
    \'j'  : ['<Plug>(easymotion-j)', 'Line downward'],
    \'k'  : ['<Plug>(easymotion-k)', 'Line upward'],
    \'n'  : ['<Plug>(easymotion-n)', 'Jump to latest "/" or "?" forward'],
    \'N'  : ['<Plug>(easymotion-N)', 'Jump to latest "/" or "?" backward'],
    \'s'  : ['<Plug>(easymotion-s)', 'Find char forward and backward'],
    \}

call which_key#register('\', 'g:which_key_map')
nnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '\'<CR>
