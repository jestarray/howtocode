#lang htdp/isl+
(define PNAME 'comments)
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples❌
4. A function template that processes this data❌

Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
4. Code body ❌
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
Comments can be found under youtube, reddit, etc.
Comments have replies which themselves are Comments,
which themselves can have other replies

Write the template for "Comment" and "ListOfComment"
and use them to solve the rest of the problems
|#

(define-struct comment [author text replies])
; A Comment is a (make-comment String String ListOfComment)
; interp.
; author is the writers username
; text is the content of the post
; replies is a chain of other peoples comments along with their replies

; comment-temp : (Comment -> ???)
; TODO

; A ListOfComment is one of:
; - empty
; - (cons Comment ListOfComment)

; list-com-temp : (ListOfComment -> ???)
; TODO

#|PROBLEM B:
Here is a diagram of comment thread on some website.
Translate the following into code with "make-comment"

[@BookWorm99]: "The book is ALWAYS better than the movie. Period."
├── [@User_01]: "First! 🥇"
├── [@Cinephile_Sam]: "Tired take. The Godfather movie > The Godfather book. Facts."
│   ├── [@BookWorm99]: "One exception. You lose the internal monologue in film!"
│   │   └── [@PlotHolePatrol]: "Internal monologue is just lazy writing anyway. 🤷‍♂️"
│   └── [!! SPAM_BOT_99 !!]: "I made $5,000 working from home! Link in BIO! 💸"
├── [@AdaptationStation]: "Counterpoint: Jurassic Park. The book is a math textbook."
│   ├── [@HardcoverHero]: "The movie 'Disney-fied' Hammond's corporate greed though."
│   └── [@Nostalgic_Ned]: "Anyone else reading this thread in 2026? Just me? 😂"
├── [@AudiobookAndy]: "Where do audiobooks fit in? Am I a reader or a viewer? 🍿"
│   ├── [@GatekeeperGreg]: "You're a listener. It's NOT reading. Don't @ me."
│   │   └── [@KindleQueen]: "Oh boy. Another 'wood pulp' purist... 🙄"
│   └── [@Elon_Musk_Fan_420]: "GREAT POST!! Check my pinned tweet for a FREE TESLA!! 🚀"
├── [@FastForward_Frank]: "Fight Club movie > Book. Even the author agreed."
│   ├── [@Cinephile_Sam]: "^ THIS"
│   └── [@CryptoKing_ETH]: "Imagine arguing about books when the market is UP! 📈"
├── [@Angry_Anons]: "LITERALLY NO ONE ASKED. DELETE YOUR ACCOUNT."
│   └── [@BookWorm99]: "Reported"
|#

(define plot-hole-reply
  (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" empty))

(define cinephile-branch
  (make-comment "@Cinephile_Sam" "Tired take. The Godfather movie > The Godfather book. Facts."
                (list (make-comment "@BookWorm99" "One exception. You lose the internal monologue in film!"
                                    (list plot-hole-reply))
                      (make-comment "!! SPAM_BOT_99 !!" "I made $5,000 working from home! Link in BIO! 💸" empty))))

(define adaptation-branch ...)

(define audiobook-branch ...)

(define fight-club-branch ...)

(define no-one-asked ...)
;; --- The main thread starting with the OP ---

(define main-thread ...)

#|PROBLEM C:
Design the function "count-replies" that consumes a Comment and
produces the total comments(including subreplies)
For example:
IMAGINE this is the entire comment chain:
├── [@User_01]: "First! 🥇"
├── [@Cinephile_Sam]: "Tired take. The Godfather movie > The Godfather book. Facts."
│   ├── [@BookWorm99]: "One exception. You lose the internal monologue in film!"
│   │   └── [@PlotHolePatrol]: "Internal monologue is just lazy writing anyway. 🤷‍♂️"
│   └── [!! SPAM_BOT_99 !!]: "I made $5,000 working from home! Link in BIO! 💸"
produce:
5
|#

#|PROBLEM D:
Design the function "filter-comments" that consumes a Comment and a name
and produces all Comments made by the user in a nice readable format
[<comment-author>]: <comment-text>
For example:
Given:
(filter-comments main-thread "@Cinephile_Sam")
produce:
(list
"[@Cinephile_Sam]: Tired take. The Godfather movie > The Godfather book. Facts."
"[@Cinephile_Sam]: ^THIS")
|#
; (: filter-comments (Comment String -> [ListOf String]))
; TODO

#|PROBLEM E:
You notice that spam comments often use these emojis:
📈🚀💸
Design a function "potential-spam" that produces the list of all comments
that use the above set of emojis in a nice readable format like PROBLEM D
For example:
Given:
(potential-spam main-thread)
produce:
(list
"[!! SPAM_BOT_99 !!]: I made $5,000 working from home! Link in BIO! 💸"
"[@Elon_Musk_Fan_420]: GREAT POST!! Check my pinned tweet for a FREE TESLA!! 🚀"
"[@CryptoKing_ETH]: Imagine arguing about books when the market is UP! 📈")

HINT: Emojis are just strings, you will need to copy&paste them
It is very similar to PROBLEM D
|#

; (: potential-spam (Comment -> [ListOf String]))
; TODO