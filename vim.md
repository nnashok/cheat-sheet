
# t, f
# t: find char, stops before the char
# f: find char, stops at the char

# set number relativenumber
`:set number relativenumber`

# :co : copy
`:-16,-14co.`

# Plugins
# fuzzy finder: cmdt, ctrlp
# surroundvim: for working with parens, quotes etc, operates on surrounding objects
`ds'` or `dsp`, `asi'`, `ysiw<em>`


# Tips
* Highlight search
:set hlsearch

* Change : to ; to get into Ex mode
nnoremap ; :
nnoremap : ;

* Color column 80 ONLY onlines where the line does extend beyond 80
```vi
highlight ColorColumn ctermbg=red ctermfg=blue
call matchadd('ColorColumn', '\%81v', 100)
```

* Highlight current search match (to resolve difficulty in seeing where in the multiple searches we are)

* Highlight tabs, trailing whitespace in a line

* Operating on visual blocks (move, etc)

* Handle swap file presence. No simulataneous edits, switch to current tab/window.

* Viewing diffs

* Converting text to list and back

* Sum, avg etc over a list of numbers (vmath.vim)

# Links:
* Presentation on vim (automation): https://www.youtube.com/watch?v=aHm36-na4-4 (6:14) , https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/tree/master/plugin
