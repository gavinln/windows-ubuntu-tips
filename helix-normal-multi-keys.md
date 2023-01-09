# Multi-keys in the Helix editor

## g - Goto

* g line number
* e last line
* f files in selection
* h line start
* l line end
* s first non-blank in line
* d definition
* y type definition
* r references
* i implementation
* t window top
* c window center
* b window bottom
* a last accessed file
* m last modified file
* n next buffer
* p previous buffer
* . last modification

## m - match surround

* m - goto matching bracket
* s - surround add
* r - surround replace
* d - surround delete
* a - select around object (class/function/argument)
* i - select inside object (class/function/argument)


## z - views and scrolling

* z - align view center
* t - align view top
* b - align view bottom
* m - align view middle
* k - scroll view up
* j - scroll view down
* C-b - move page up
* C-f - move page down
* C-u - move half page up
* C-d - move half page down
* / - search for refex pattern
* ? - reverse search for refex pattern
* n - select next search match
* N - select previous search match

## C-w - windows

* w - goto next window
* s - horizontal bottom split
* v - vertical right split
* t - transpose splits
* f - goto files in selection - hsplit
* F - goto files in selection - vsplit
* q - Close window
* o - Close all windows except current
* h - jump to left split
* j - jump to split below
* k - jump to split above
* l - jump to right split
* L - swap with right split
* K - swap with split above
* H - swap with left split
* J - swap with split below

## Limitations

* Cannot resize window splits as of 2023-01-08
