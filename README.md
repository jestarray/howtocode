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

# adding problems to handin:
Make sure there exists the following files in the 3:
Note that underscores are important! do not use underscores to deliminate spaces, use dash instead
graders/1.0-my-test-problem_grader.rkt 
starter/1.0-my-test-problem_starter.rkt
solutions/1.0-my-test-problem_solution.rkt

run `GEN_HANDIN_FOLDER.rkt` . This will copy the necessary graders and setup the handin folder and also generate a `VALID-ASSIGNMENTS.json` which is to be fed into jestlearn

# handin-grader notes:
- graders should not have their own struct defs and reference local variables. instead you have to copy and paste them out, as they will always evaluate in the submission context
- checking evaluation of structs should be done with `((submission-eval) '(make-mystruct 1))`, e.g:
`(@test "advance-char#1" "err" (advance-char (make-typewriter "hey" 0)) ((submission-eval) '(make-typewriter "hey" 1)) 1)`
- checking evaluation of values should be done without the `(submission-eval)`, e.g:
`(@test "charge-message#1" "err" (charge-message (make-phone "iphone 10" (make-battery 100 5))) "Fully charged" 1)`

## todo:
size all images to use img[#:width "100%"]{} so they don't grow too big in height