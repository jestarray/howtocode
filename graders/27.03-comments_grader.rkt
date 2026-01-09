#lang s-exp handin-server/checker

(require handin-server/grading-utils
         handin-server/sandbox
         racket/runtime-path
         racket/file
         racket/list
         racket/string
         2htdp/image
         (only-in racket/list remove-duplicates)
         )

(define-runtime-path here ".")
(define-values (base final dir?) (split-path (simplify-path here)))

(define ASSIGNMENT-NAME 'comments)
(define markup-prefix ";;> ")

(define-runtime-path override "../overridden-collects/")

(pre:
 (sandbox-path-permissions
  (list*
   (list 'exists "/usr/lib/ssl")
   (list 'exists "/etc/ssl/")
   (list 'exists (current-directory))
   (sandbox-path-permissions)))
 (sandbox-override-collection-paths (list override)))

(check: :language 'lang/htdp-intermediate-lambda

        :requires '(2htdp/image 2htdp/universe)
        :eval? #t
        :output (string-append (symbol->string ASSIGNMENT-NAME) ".rkt")
        :create-text? #t
        :textualize? #f ;;raises exception for submissions that are not all text
        :maxwidth #f
        :coverage? #f


        #| (update-submission-timestamp!)
        (add-header-line! (string-append "Timestamp: "
                                         (get-submission-timestamp)
                                         "\n")) |#
        ;(add-report-line! (get-submission-timestamp))
        (!test PNAME ASSIGNMENT-NAME) ; EVERY FILE MUST HAVE THIS ONTOP OF FILE
        ;(!procedure blue-eyed-linage? 1)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 10)
;(@test "#1" "err"(create-bst #false 9 "hy") (make-node 7 "hy" #false #false) 1)

(@test "count-comments#1" "err" (count-comments (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '())) 1 1)
(@test "count-comments#2" "err" (count-comments (make-comment "@Angry_Anons" "LITERALLY NO ONE ASKED. DELETE YOUR ACCOUNT." (list (make-comment "@BookWorm99" "Reported" '())))) 2 1)
(@test "count-comments#3" "err" (count-comments (make-comment "@Cinephile_Sam" "Tired take. The Godfather movie > The Godfather book. Facts." (list (make-comment "@BookWorm99" "One exception. You lose the internal monologue in film!" (list (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '()))) (make-comment "!! SPAM_BOT_99 !!" "I made $5,000 working from home! Link in BIO! 💸" '())))) 4 1)

(@test "filter-comments#1" "err" (filter-comments (make-comment "@BookWorm99" "The book is ALWAYS better than the movie. Period." (list (make-comment "@User_01" "First! 🥇" '()) (make-comment "@Cinephile_Sam" "Tired take. The Godfather movie > The Godfather book. Facts." (list (make-comment "@BookWorm99" "One exception. You lose the internal monologue in film!" (list (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '()))) (make-comment "!! SPAM_BOT_99 !!" "I made $5,000 working from home! Link in BIO! 💸" '()))) (make-comment "@AdaptationStation" "Counterpoint: Jurassic Park. The book is a math textbook." (list (make-comment "@HardcoverHero" "The movie 'Disney-fied' Hammond's corporate greed though." '()) (make-comment "@Nostalgic_Ned" "Anyone else reading this thread in 2026? Just me? 😂" '()))) (make-comment "@AudiobookAndy" "Where do audiobooks fit in? Am I a reader or a viewer? 🍿" (list (make-comment "@GatekeeperGreg" "You're a listener. It's NOT reading. Don't @ me." (list (make-comment "@KindleQueen" "Oh boy. Another 'wood pulp' purist... 🙄" '()))) (make-comment "@Elon_Musk_Fan_420" "GREAT POST!! Check my pinned tweet for a FREE TESLA!! 🚀" '()))) (make-comment "@FastForward_Frank" "Fight Club movie > Book. Even the author agreed." (list (make-comment "@Cinephile_Sam" "^THIS" '()) (make-comment "@CryptoKing_ETH" "Imagine arguing about books when the market is UP! 📈" '()))) (make-comment "@Angry_Anons" "LITERALLY NO ONE ASKED. DELETE YOUR ACCOUNT." (list (make-comment "@BookWorm99" "Reported" '()))))) "@not-exist") empty 1)
(@test "filter-comments#2" "err" (filter-comments (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '()) "@PlotHolePatrol") (list "[@PlotHolePatrol]: Internal monologue is just lazy writing anyway. 🤷‍♂️") 1)
(@test "filter-comments#3" "err" (filter-comments (make-comment "@BookWorm99" "The book is ALWAYS better than the movie. Period." (list (make-comment "@User_01" "First! 🥇" '()) (make-comment "@Cinephile_Sam" "Tired take. The Godfather movie > The Godfather book. Facts." (list (make-comment "@BookWorm99" "One exception. You lose the internal monologue in film!" (list (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '()))) (make-comment "!! SPAM_BOT_99 !!" "I made $5,000 working from home! Link in BIO! 💸" '()))) (make-comment "@AdaptationStation" "Counterpoint: Jurassic Park. The book is a math textbook." (list (make-comment "@HardcoverHero" "The movie 'Disney-fied' Hammond's corporate greed though." '()) (make-comment "@Nostalgic_Ned" "Anyone else reading this thread in 2026? Just me? 😂" '()))) (make-comment "@AudiobookAndy" "Where do audiobooks fit in? Am I a reader or a viewer? 🍿" (list (make-comment "@GatekeeperGreg" "You're a listener. It's NOT reading. Don't @ me." (list (make-comment "@KindleQueen" "Oh boy. Another 'wood pulp' purist... 🙄" '()))) (make-comment "@Elon_Musk_Fan_420" "GREAT POST!! Check my pinned tweet for a FREE TESLA!! 🚀" '()))) (make-comment "@FastForward_Frank" "Fight Club movie > Book. Even the author agreed." (list (make-comment "@Cinephile_Sam" "^THIS" '()) (make-comment "@CryptoKing_ETH" "Imagine arguing about books when the market is UP! 📈" '()))) (make-comment "@Angry_Anons" "LITERALLY NO ONE ASKED. DELETE YOUR ACCOUNT." (list (make-comment "@BookWorm99" "Reported" '()))))) "@AudiobookAndy") (list "[@AudiobookAndy]: Where do audiobooks fit in? Am I a reader or a viewer? 🍿") 1)
(@test "filter-comments#4" "err" (filter-comments (make-comment "@BookWorm99" "The book is ALWAYS better than the movie. Period." (list (make-comment "@User_01" "First! 🥇" '()) (make-comment "@Cinephile_Sam" "Tired take. The Godfather movie > The Godfather book. Facts." (list (make-comment "@BookWorm99" "One exception. You lose the internal monologue in film!" (list (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '()))) (make-comment "!! SPAM_BOT_99 !!" "I made $5,000 working from home! Link in BIO! 💸" '()))) (make-comment "@AdaptationStation" "Counterpoint: Jurassic Park. The book is a math textbook." (list (make-comment "@HardcoverHero" "The movie 'Disney-fied' Hammond's corporate greed though." '()) (make-comment "@Nostalgic_Ned" "Anyone else reading this thread in 2026? Just me? 😂" '()))) (make-comment "@AudiobookAndy" "Where do audiobooks fit in? Am I a reader or a viewer? 🍿" (list (make-comment "@GatekeeperGreg" "You're a listener. It's NOT reading. Don't @ me." (list (make-comment "@KindleQueen" "Oh boy. Another 'wood pulp' purist... 🙄" '()))) (make-comment "@Elon_Musk_Fan_420" "GREAT POST!! Check my pinned tweet for a FREE TESLA!! 🚀" '()))) (make-comment "@FastForward_Frank" "Fight Club movie > Book. Even the author agreed." (list (make-comment "@Cinephile_Sam" "^THIS" '()) (make-comment "@CryptoKing_ETH" "Imagine arguing about books when the market is UP! 📈" '()))) (make-comment "@Angry_Anons" "LITERALLY NO ONE ASKED. DELETE YOUR ACCOUNT." (list (make-comment "@BookWorm99" "Reported" '()))))) "@Cinephile_Sam") (list "[@Cinephile_Sam]: Tired take. The Godfather movie > The Godfather book. Facts." "[@Cinephile_Sam]: ^THIS") 1)

(@test "potential-spam#1" "err" (potential-spam (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '())) empty 1)
(@test "potential-spam#2" "err" (potential-spam (make-comment "@Cinephile_Sam" "Tired take. The Godfather movie > The Godfather book. Facts." (list (make-comment "@BookWorm99" "One exception. You lose the internal monologue in film!" (list (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '()))) (make-comment "!! SPAM_BOT_99 !!" "I made $5,000 working from home! Link in BIO! 💸" '())))) (list "[!! SPAM_BOT_99 !!]: I made $5,000 working from home! Link in BIO! 💸") 1)
(@test "potential-spam#3" "err" (potential-spam (make-comment "@BookWorm99" "The book is ALWAYS better than the movie. Period." (list (make-comment "@User_01" "First! 🥇" '()) (make-comment "@Cinephile_Sam" "Tired take. The Godfather movie > The Godfather book. Facts." (list (make-comment "@BookWorm99" "One exception. You lose the internal monologue in film!" (list (make-comment "@PlotHolePatrol" "Internal monologue is just lazy writing anyway. 🤷‍♂️" '()))) (make-comment "!! SPAM_BOT_99 !!" "I made $5,000 working from home! Link in BIO! 💸" '()))) (make-comment "@AdaptationStation" "Counterpoint: Jurassic Park. The book is a math textbook." (list (make-comment "@HardcoverHero" "The movie 'Disney-fied' Hammond's corporate greed though." '()) (make-comment "@Nostalgic_Ned" "Anyone else reading this thread in 2026? Just me? 😂" '()))) (make-comment "@AudiobookAndy" "Where do audiobooks fit in? Am I a reader or a viewer? 🍿" (list (make-comment "@GatekeeperGreg" "You're a listener. It's NOT reading. Don't @ me." (list (make-comment "@KindleQueen" "Oh boy. Another 'wood pulp' purist... 🙄" '()))) (make-comment "@Elon_Musk_Fan_420" "GREAT POST!! Check my pinned tweet for a FREE TESLA!! 🚀" '()))) (make-comment "@FastForward_Frank" "Fight Club movie > Book. Even the author agreed." (list (make-comment "@Cinephile_Sam" "^THIS" '()) (make-comment "@CryptoKing_ETH" "Imagine arguing about books when the market is UP! 📈" '()))) (make-comment "@Angry_Anons" "LITERALLY NO ONE ASKED. DELETE YOUR ACCOUNT." (list (make-comment "@BookWorm99" "Reported" '())))))) (list "[!! SPAM_BOT_99 !!]: I made $5,000 working from home! Link in BIO! 💸" "[@Elon_Musk_Fan_420]: GREAT POST!! Check my pinned tweet for a FREE TESLA!! 🚀" "[@CryptoKing_ETH]: Imagine arguing about books when the market is UP! 📈") 1)
        ; (println submission)
        )
(post:
 (add-score-to-report!)
 (write-report)
 (define username (first users))
 (define report-path (string-append "../" username "-report-#f.txt"))
 (define final-score (last (file->lines report-path)))

 (call-with-output-file "../grade" (lambda (out)
                                     ;remove 'Final Score:' and prettifies it to just a fraction
                                     (define prettify
                                       (string-replace
                                        (substring final-score 12 (string-length final-score))
                                        "out of"
                                        "/"))
                                     (define test-score (string-append "test-score: " prettify))
                                     (define htdp-score "\n | htdp-score: 0")
                                     (write-string (string-append test-score htdp-score) out)) #:exists 'replace))
