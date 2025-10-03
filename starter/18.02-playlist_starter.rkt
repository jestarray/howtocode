;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 18.02-playlist_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'playlist)
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
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; Genre is one of:
; - "rock"
; - "pop"
; - "r&b"
; - "funk"

(define-struct song [artist name time genres])
; Song is (make-song String String Number ListOfGenre)
; interp.
; artist is the name of the artist
; name is the name of the song
; time is in seconds
; genre is all the Genres of the song

; songs-temp : (Song -> ???)
(define (songs-temp sng)
  (... (song-artist sng)
       (song-name sng)
       (song-time sng)
       (song-genres sng)))

(define snow (make-song "RHCP" "Snow" 315 (list "rock" "funk")))
(define sick (make-song "RHCP" "Sick Love" 224 (list "rock" "pop")))
(define shake (make-song "Taylor Swift" "shake it off" 219 (list "pop")))
(define bill (make-song "Michael Jackson" "Billie Jean" 293 (list "pop" "r&b")))
(define happy (make-song "Pharrell Williams" "Happy" 233 (list "pop" "r&b")))
(define compli (make-song "Avril Lavigne" "Complicated" 244 (list "pop" "rock")))

; ListOfSong is one of:
; - empty
; (cons Song ListOfSong)

(define all-songs (list snow sick shake bill happy compli))

#|PROBLEM A:
Finish the template for ListOfSong
|#

; list-songs-temp : (ListOfSong -> ???)
; TODO: TEMPLATE

#|PROBLEM B:
Design a function "total-playtime" that consumes a ListOfSong and 
produces the total MINUTES of all the songs in a given list.
For example:
(define snow (make-song "RHCP" "Snow" 315 (list "rock" "funk")))
(define sick (make-song "RHCP" "Sick Love" 224 (list "rock" "pop")))
(total-playtime (list snow sick)) -> (315 + 224) / 60
|#

#|PROBLEM C:
Design a function "filter-genre" which consumes a ListOfSong and a Genre and
produces a ListOfSongs only in that genre.
|#
