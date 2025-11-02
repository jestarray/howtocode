#lang htdp/isl+
(define PNAME 'fav-photos)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

(define-struct photo [path album favorite])
(define PhotoSig (signature (PhotoOf String String Boolean)))
; a photo having a location path, belonging to an album
; favorite is whether it is marked favorite(when #true)
(define cat (make-photo "C:/photos/cat.png" "pets" #true))
(define dog (make-photo "C:/photos/dog.png" "pets" #false))
(define wall (make-photo "C:/photos/greatwall.png" "vacay" #true))
(define selfie (make-photo "C:/photos/self.png" "me" #true))

#|PROBLEM A:
Design a function called "to-frame" that consumes an album name and a list of photos 
and that produces a list of only those photos that are favourites and that belong to 
the given album. You MUST USE built-in abstract functions wherever possible. 
|#
