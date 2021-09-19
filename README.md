# howtocode
source code for my blog made with racket/pollen!

## instructions 
Reset cache(required every racket update):

```raco pollen reset```

Distribute:

while in src

```raco pollen render```

```raco pollen publish``` (skip this step and just distribute the html.pm and html files all in 1 folder to prevent folder duplication of images and everything else)

## editing:
if using vscode, type in `lz` for the lozenge character which will popup a snippet dropdown

## slide_mode:
some pages have a slide mode, just hit f12, run slide_mode() and use "w" and "d" to move right and left


## todo:
size all images to use img[#:width "100%"]{} so they don't grow too big in height