#lang pollen
◊h1{Variables}

◊h2{What are variables?}

Variables give names to values which can then be used to better understand the program better and make it easier to change a program.

Here's a value:

5

What the heck does it mean? what units? dollars? feet? inches? meter? gas prices? it can mean anything. If we give it a name by creating a variable:
◊h2{The rules for creating a variable are:}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
    "(define <SOMENAME> <VALUE>)")}

Let's create a few
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; its much clear what it 5 means.
(define potion-price 5)
; here's another
(define amount-buying 10)

; we can then use these variables:
(* potion-price amount-buying)

; the rules for evaluating is each variable is that 
; they are substitued for the value they hold:
(* potion-price amount-buying)
(* 5 amount-buying) ; step 1
(* 5 10) ; step 2
50 ; finally becomes 50
")
}

◊h2{Practice}
◊a[#:href "https://jestlearn.com/how_to_code/#variable_arith_evaluation"]{Practice}

◊h2{Easier to change programs}
Here's an example of variables making it easy to change a program:

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; say you are creating a voice assistant AI
; like Alexia, Siri, or Cortana

; if you wanted to change the name Amy to something else
; you would have to edit 4 lines:
\"Welcome, Amy\"
\"Good morning Amy\"
\"Good afternoon Amy\"
\"Good night Amy\"

; we can instead identify the constant information and put it in a variable
; this is sometimes called \"(re)factoring\"
(define name \"James\") ; all we have to do is change this line
(string-append \"Welcome, \" name)
(string-append \"Good morning, \" name)
(string-append \"Good afternoon, \" name)
(string-append \"Good night, \" name)
")
}

Use the "Check Syntax" button to visualize where variables are being used and where they come from!

◊img[#:src "/images/check-syntax.png"]{}

We can also stick images into variables by copying and pasting an image in a define block

◊h2{Pratice Problems}

◊a[#:href "https://jestlearn.com/how_to_code/#variable_arith_evaluation"]{Math expressions with variables}

◊a[#:href "https://jestlearn.com/how_to_code/#build_a_string"]{Build anagram strings}