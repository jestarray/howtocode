#lang pollen

◊h1{Strings}

◊h2{Creating a string}
To form a string, wrap the characters in double quotes ◊code{""}

here are some examples of strings:
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"\"hello world\"
\"why do ants never get sick? because of their anty bodies\"
\"こんにちは世界\" ; hello world in japanese
")
}

◊h2{What are strings?}
A collection of characters to that can represent words, usernames and general text 

◊h2{What is the difference between the number 123 and the string "123"?}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; as you can see they are highlighted differently
123 ; the number 123
\"123\" ; the string 123
")
}

The number 123 can be divided, sqrt, multipled, all the classical math operations you are familar with. 
The string ◊code{"123"} is for only for show. 

If you try that on the string ◊code{"123"}, it will give you an error.
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(+ \"123\" 1)
; ERROR: + execpts a number and not a string. 
")
}

◊h2{Operations on strings}

There are operations you can do on a string, like:
◊rk{string-append} , ◊rk{string-length} , ◊rk{string->number}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; combining two strings with (string-append)
(string-append \"123\" \"1\") ; gives \"1231\"
(string-append \"Good morning\" \"bob\") ; gives \"Good morningbob\"

; convert a string to a number
(string->number \"12\")
; the other way around is useful when you want to perform
; some calculations on a number, then spit it back out as a string
; 2000mah phone battery
(string-append \"You have \" (number->string (* (/ 163 2000) 100) \" gold\") ; gives \"You have 8.15% battery\"

; get the lengh of a string
(string-length \"jest\") ; gives 4
(string-length \"amazing\") ; gives 7
"
    )
}
◊h2{Zero based indexing}
And you can also ◊rk{substring}, which gets parts of a string out, though be warned that counting starts from 0.
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; [inclusive, exclusive)
;           0123456789
(substring \"hello cat\" 0 4) ; gives \"hello\"
; note that the first character is h is 0
(substring \"hello cat\" 0 1) ; gives \"h\"

(substring \"hello cat\" 4 7) ; gives \"h\"
; string-length however counts normally
(string-length \"hello cat\") ; gives 9
; how do you get the last character t?
(substring \"hello cat\" 8) ; gives t, notice it's not 9
")
}

This takes some getting used to and has been the cause of numerous security holes in other programming languages. Get some practice with them!

What is ◊code{(substring "barnicales" 0 5)}?
◊details{
    ◊summary{answer}
    "barni"
}

◊h2{Practice Problems}

◊a[#:href "https://jestlearn.com/how_to_code/#zero_based_indexing_string_practice"]{Zero based indexing practice}

◊h2{Videos}

◊a[#:href "https://www.youtube.com/watch?v=oddmn_fD_vU&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=5"]{Zero based Indexing Video}