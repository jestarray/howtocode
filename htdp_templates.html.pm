#lang pollen

◊h1{Templates and Outlines}

◊img[#:src "./images/template_tool.png"]{}
Templates, or as I'd like to call them, "outlines", is the bare minimum baseline to kickstart writing a function. It's akin to laying out all your tools neatly before picking which one to use, or like an artist drawing a rough outline/sketch as a baseline. If you've tried visual block based languages like ◊a[#:href "https://scratch.mit.edu/"]{Scratch}, it lays out all the blocks for you that you can use, and this is what tempaltes accomplish, to gather all the available puzzle pieces(e.g parameters and basic structure) we can use, as the alternative is staring at a blank page stunned. As you program more and more, you'll be able to template problems in your head.

◊h2{Design Recipe Cheatsheet}
◊racket-code-block{
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description❌
        1B. if using define-struct, write all accessor signatures❌
    2. Interpretation❌
    3. Data Examples❌
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
      2B. if the function consumes a list, make sure a list of 2 or longer is tested 
    3. Template(from data)?❌
    3. Code body ❌
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#
}

◊; TypeOf , instead of "atomic non-distinct" ,general, broad

◊;  InstanceOf , instead of "atomic distinct", specific, narrow

◊h2{Simple Base Data(concrete)}
◊racket-code-block{
(define (<FUN-BASE-TEMPLATE> arg1)
  (... arg1))

; double: (Number -> Number)
; produces double the given number

(check-expect (double 2) 4)
(check-expect (double 3.5) 10)
; stub (define (double n) 0)

(define (double n)
  (... n))
}

◊h2{Enum}

Enums list all finite possibilities of a given catatgorey of data you want to represent

◊racket-code-block{
; A TrafficLight is one of the following Strings:
; - "red"
; - "green"
; - "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; TEMPLATE should match amount of cases in the type above, in this case 3 branches:
(define (<FUN-ENUM-TEMPLATE> st)
  (cond
    [string=? st ...]
    [string=? st ...]
    [string=? st ...]))

; traffic-light-next: (TrafficLight -> TrafficLight)
; yields the next state given current state st
(check-expect (traffic-light-next "red") "green")

(define (traffic-light-next st)
  (cond
    [(string=? "red" st) ...]
    [(string=? "green" st) ...]
    [(string=? "yellow" st) ...]))
}


◊h2{Intervals}

Use an interval when the information to be represented is numbers within a certain range. Integer[0, 10] is all the integers from 0 to 10 inclusive; Number[0, 10) is all the numbers

◊racket-code-block{
; Countdown is Integer[0, 10]
; interp. the number of seconds remaining to liftoff

(define C1 10)  ; start
(define C2 5)   ; middle
(define C3 0)   ; end
 
; countdown-temp: (Number -> ???)

(define (countdown-temp cd)
  (... cd))
}

◊h2{Interval cheatsheet}
The boolean expression to test whether a number falls ◊strong{within} a given interval:
◊table{
  ◊thead{
    ◊th{Interval}
    ◊th{Expression}
    ◊th{Meaning}
  }
  ◊tbody{
    ◊tr{
      ◊td{[0, 100]}
      ◊td{◊code{(and (>= n 0) (<= n 100))}}
      ◊td{◊strong{Include} both 0 and 100}
    }
    ◊tr{
      ◊td{[0, 100)}
      ◊td{◊code{(and (>= n 0) (< n 100))}}
      ◊td{Include 0 but ◊strong{exclude} 100}
    }
    ◊tr{
      ◊td{(0, 100]}
      ◊td{◊code{(and (> n 0) (<= n 100))}}
      ◊td{◊strong{Exclude} 0 but ◊strong{Include} 100}
    }
    ◊tr{
      ◊td{(0, 100)}
      ◊td{◊code{(and (> n 0) (< n 100))}}
      ◊td{◊strong{Exclude} both 0 and 100}
    }
  }
  ◊caption{
Notice you will see an ◊code{=} (equal sign) where there are ◊code{[]} (square braces)
  }
}

◊h2{Sets of Intervals}

◊racket-code-block{
; NumberGrade is a Natural number that falls into one of:
;- (80, 100]
;- (60, 80]
;- (40, 60]
;- (20, 40]
;- [0, 20]
; interp.
;- (80, 100] means A
;- (60, 80] means B
;- (40, 60] means C
;- (20, 40] means D
;- [0, 20] means F

(define ng1 80)

; numgrade-temp: (NumberGrade -> ???)
(define (numgrade-temp num)
  (cond
    [(and (> num 80) (<= num 100)) ...]
    [(and (> num 60) (<= num 80)) ...]
    [(and (> num 40) (<= num 60)) ...]
    [(and (> num 20) (<= num 40)) ...]
    [(and (>= num 0) (<= num 20)) ...]))
}

◊; aka Itemization
◊h2{Union}
Union(aka itemization) describes the case when there are two or more different ◊strong{types} of data.

◊racket-code-block{
; ValidID is one of:
; #false
; Number
; interp. #false means there is no ID while Number is the ID

; TEMPLATE should match the number of cases above and check with typeof: "<type>?" 
(define (<id-fun> x)
  (cond [(boolean? x) ...]
        [(number? x) ...]))

; pull-over-id-check?: (ValidId -> Boolean)
; returns true if the person has a valid id, otherwise false
(define (pull-over-id-check? x)
  (cond [(boolean? x) #false]
        [(number? x) #true]))
}

◊h2{big-bang World Apps}
World apps are interactive applications that can respond to keyboard presses, mouse events, and draw images quickly for things like games, animations, etc.

◊i{Note that you can paste in your own images into DrRacket, but for the most part we will be using emoji because when opening the racket file with a text editor(e.g notepad) other than DrRacket, it will display weirdly.}

◊i{big-bang programs are somewhat hard to autograde so please do not be discouraged by scores and self grade yourself comparing it to my solution}

◊ol{
  ◊li{
    ◊ol{
      ◊li{◊h3{Domain analysis (use a piece of paper or ◊a[#:href "https://tldraw.com"]{tldraw.com})}}
      ◊li{Sketch program scenarios}
      ◊li{Identify constant information}
      ◊li{Identify changing information}
      ◊li{Identify big-bang options}
    }
  }

  ◊li{
    ◊ol{
      ◊li{◊h3{Build the actual program}}
      ◊li{Constants (based on 1.2 above)}
      ◊li{Data definitions using HtDD (based on 1.3 above)}
      ◊li{Functions using HtDF
        ◊ol{
         ◊li{main first (based on 1.3, 1.4 and 2.2 above)}
         ◊li{todo list entries for big-bang handlers}
        }}
      ◊li{Work through todo list until done}
    }
  }
}

◊h3{big-bang options}
◊table{
  ◊thead{
    ◊th{If your app needs to:}
    ◊th{Then it needs this clause:}
  }
  ◊tbody{
    ◊tr{
      ◊td{Update automatically as time passes}
      ◊td{◊a[#:href "https://docs.racket-lang.org/teachpack/2htdpuniverse.html#%28form._world._%28%28lib._2htdp%2Funiverse..rkt%29._on-tick%29%29"]{on-tick}}
    }
    ◊tr{
      ◊td{Display something ◊strong{(absolutely required)}}
      ◊td{◊a[#:href "https://docs.racket-lang.org/teachpack/2htdpuniverse.html#%28form._world._%28%28lib._2htdp%2Funiverse..rkt%29._to-draw%29%29"]{to-draw}}
    }
    ◊tr{
      ◊td{Change in response to a keyboard press}
      ◊td{◊a[#:href "https://docs.racket-lang.org/teachpack/2htdpuniverse.html#%28form._world._%28%28lib._2htdp%2Funiverse..rkt%29._on-key%29%29"]{on-key}}
    }
    ◊tr{
      ◊td{Change in response to mouse events}
      ◊td{◊a[#:href "https://docs.racket-lang.org/teachpack/2htdpuniverse.html#%28form._world._%28%28lib._2htdp%2Funiverse..rkt%29._on-mouse%29%29"]{on-mouse}}
    }
    ◊tr{
      ◊td{Stop automatically}
      ◊td{◊a[#:href "https://docs.racket-lang.org/teachpack/2htdpuniverse.html#%28form._world._%28%28lib._2htdp%2Funiverse..rkt%29._stop-when%29%29"]{stop-when}}
    }
  }
}

◊h3{HTDW Template}
◊racket-code-block{
(require 2htdp/image)
(require 2htdp/universe)

; My world program does ... (make this more specific)

; =================
; CONSTANTS:


; =================
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description❌
2. Interpretation❌
3. Data Examples❌
4. A function template that processes this data❌
|#
; WorldState is ... (give WorldState a better name)



; =================
#| Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect, elaborate the concrete) ❌
3. Template(from data)?❌
3. Code body ❌
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; main: (WorldState -> WorldState)
; start the world with ...
; 
(define (main ws)
  (big-bang ws                   ; WorldState
    [on-mouse  ...]      ; WorldState Integer Integer MouseEvent -> WorldState
    [on-key    ...]      ; WorldState KeyEvent -> WorldState
    [on-tick   tock]     ; WorldState -> WorldState
    [to-draw   render]   ; WorldState -> Image
    [stop-when ...]      ; WorldState -> Boolean
    ))

; tock: (WorldState -> WorldState)
; produce the next ...
; TODO!
(define (tock ws) ...)


; render: (WorldState -> Image)
; render ... 
; TODO!
(define (render ws) ...)
}

◊details{
  ◊summary{Mushroom Walk Example}
◊racket-code-block{
(require 2htdp/image)
(require 2htdp/universe)

; A mushroom that walks off the screen like the Goomba in Mario

; =================
; CONSTANTS:
(define MUSH-IMG (text "🍄" 50 "brown"))
(define WIDTH 500)
(define HEIGHT 400)
(define CENTER-Y (/ HEIGHT 2))
(define BG (empty-scene WIDTH HEIGHT "light blue"))
(define SPEED 4)

; =================
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
2. Interpretation✅
3. Data Examples✅
4. A function template that processes this data✅
|#
; Mushroom is a Number
; interp. represents x position of the mushroom in screen coordinates
(define (mush-temp m)
  (... m))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete) ✅
3. Template(from data)?✅
3. Code body ✅
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; main: (Mushroom -> Mushroom)
; start the world with 0
(define (main m)
  (big-bang m                        ; Mushroom
            [on-key handle-key]      ; Mushroom KeyEvent -> Mushroom 
            [on-mouse handle-mouse]  ; Mushroom Number Number MouseEvent -> Mushroom
            [on-tick   advance-mush] ; Mushroom -> Mushroom
            [to-draw   render]))     ; Mushroom -> Image

; handle-key: (Mushroom KeyEvent -> Mushroom)
; upon pressing space or "a" key, reset the mushroom position to 0
(check-expect (handle-key 123 " ") 0) ; reset when space is hit 
(check-expect (handle-key 456 "a") 0) ; reset when a is hit

(define (handle-key m ke)
  (cond [(key=? ke " ") 0]
        [(key=? ke "a") 0]
        [else 
         m]))

; handle-mouse: (Mushroom Number Number MouseEvent -> Mushroom)
; set the mushroom x pos to that of the mouse x pos
(check-expect (handle-mouse 123 250 375 "button-down") 250)
(check-expect (handle-mouse 123 250 375 "button-up") 123)
(check-expect (handle-key 456 "x") 456) ; don't do anything to mushroom x
 
(define (handle-mouse m mousex mousey me)
  (cond [(mouse=? me "button-down") mousex]
        [else
         m]))

; advance-mush: (Mushroom -> Mushroom)
; move the mushroom forward by SPEED
(check-expect (advance-mush 0) (+ 0 SPEED))
(check-expect (advance-mush 2) (+ 2 SPEED))

(define (advance-mush m)
  (+ m SPEED))

; render: (Mushroom -> Image)
; draws the mushroom moving forward
(check-expect (render WIDTH) (place-image MUSH-IMG WIDTH CENTER-Y BG))

(define (render m)
  (place-image MUSH-IMG m CENTER-Y BG))
}
}

◊h3{Key and Mouse Handlers}
The ◊code{on-key} and ◊code{on-mouse} handler function templates are handled specially. The ◊code{on-key} function is templated according to its second argument, a KeyEvent, using the large enumeration rule. The ◊code{on-mouse} function is templated according to its MouseEvent argument, also using the large enumeration rule. So, for example, for a key handler function that has a special behaviour when the space key is pressed but does nothing for any other key event the following would be the template:

◊racket-code-block{
; handle-key: (WorldState KeyEvent -> WorldState)
; todo: do something when a key is pressed
(define (handle-key ws ke)
  (cond [(key=? ke "x") (... ws)]
        [else 
         (... ws)]))
}

Similarly the template for a mouse handler function that has special behavior for mouse clicks but ignores all other mouse events would be:

◊racket-code-block{
; handle-mouse: (WorldState Number Number MouseEvent -> WorldState)
; todo: do something when the mouse moves or clicks
(define (handle-mouse ws mousex mousey me)
  (cond [(mouse=? me "button-down") (... ws mousex mousey)]
        [else
         (... ws mousex mousey)]))
}

For more information on the ◊a[#:href "https://docs.racket-lang.org/teachpack/2htdpuniverse.html#%28tech._world._keyevent%29"]{KeyEvent} and ◊a[#:href "https://docs.racket-lang.org/teachpack/2htdpuniverse.html#%28tech._world._mouseevent%29"]{MouseEvent} large enumerations see the DrRacket help desk.

◊h2{Compound Data aka Structs}

◊racket-code-block{
(define-struct person (name age))
; Person is (make-ball String Number)
; interp. a person comrpises of a name and age

(define P1 (make-person "bob" 10))

; (: person-name ((PersonOf String Number) -> String))
; (: person-age ((PersonOf String Number) -> Number))
; (: person? (Any-> Boolean))

; TEMPLATE should list all the field accessors
(define (person-temp p)
  (... (person-name p)
       (person-age p)))
}

◊h2{Recursive Functions}

◊racket-code-block{
; ListOfString is one of:
;  - empty
;  - (cons String ListOfString)
; interp. a list of strings

(define ls0 empty)
(define ls1 (cons "a" empty))
(define ls2 (cons "b" (cons "c" empty)))

#;
(define (strings-temp str-ls)
  (cond [(empty? str-ls) (...)]                   ;BASE CASE
        [else (... (first str-ls)                 ;String
                   (strings-temp (rest str-ls)))])) ;NATURAL RECURSION
;             /
;            /
;       COMBINATION
}

◊h2{Data Driven Templates}
◊table{
  ◊thead{
    ◊th{Type of Data}
    ◊th{cond question (if applicable)}
    ◊th{Body or cond answer(if applicable)}
  }
  ◊tbody{
    ◊tr{
      ◊td{◊strong{Base Generic}
            ◊ul{
            ◊li{Number}
            ◊li{String}
            ◊li{Boolean}
            ◊li{Image}
            }
         }
      ◊td{Appropriate Predicate
      ◊ul{
        ◊li{◊code{(number? x)}}
        ◊li{◊code{(string? x)}}
        ◊li{◊code{(boolean? x)}}
        ◊li{◊code{(image? x)}}
        ◊li{◊code{(and (<= 0 x) (< x 10))}}
      }
      }
      ◊td{Expression that operates on the parameter.
          (... x)}
    }
    ◊tr{
      ◊td{◊strong{Base Concrete}
            ◊ul{
            ◊li{◊code{"red"}}
            ◊li{◊code{#f}}
            ◊li{◊code{empty}}
            ◊li{◊code{5}}
            ◊li{◊code{etc}}
            }
         }
      ◊td{Appropriate Predicate
      ◊ul{
        ◊li{◊code{(string=? x "red")}}
        ◊li{◊code{(false? x)}}
        ◊li{◊code{(empty? x)}}
        ◊li{◊code{(= x 5)}}
      }
      }
      ◊td{Expression that operates on the parameter.
          (... x)}
    }
    ◊tr{
      ◊td{◊strong{One of}
            ◊ul{
            ◊li{◊code{enum}}
            ◊li{◊code{union(aka itemization)}}
            }
         }
      ◊td{}
      ◊td{
        Cond with one clause per subclass of one of.
◊pre{◊code{
(cond [<question1> <answer1>]
      [<question2> <answer2>])}}

Where each question and answer expression is formed by following the rule in the question or answer column of this table for the corresponding case. A detailed derivation of a template for a one-of type appears below.

Always use else for the last question for itemizations and large enumerations. Normal enumerations should not use else.

Note that in a mixed data itemization, such as

◊pre{◊code{
;; Measurement is one of:
;; - "high"
;; - "low"
;; - Number
}}
the cond questions must be guarded with an appropriate type predicate. In particular, the first cond question for Measurement must be

◊pre{◊code{
(and (string? m)
     (string=? m "high"))
}}
where the call to string? guards the call to string=?. This will protect string=? from ever receiving a number as an argument.
      }
    }
    ◊tr{
      ◊td{◊strong{Compound}
            ◊ul{
            ◊li{◊code{Position}}
            ◊li{◊code{Firework}}
            ◊li{◊code{Ball}}
            ◊li{◊code{cons}}
            ◊li{◊code{etc}}
            }
         }
      ◊td{
            ◊ul{
            ◊li{◊code{(posn? x)}}
            ◊li{◊code{(firework? x)}}
            ◊li{◊code{(ball? x)}}
            ◊li{◊code{(cons? x)}}
            ◊li{◊code{etc}}
            }
      }
      ◊td{
All selectors.
◊pre{◊code{
(... (posn-x x) (posn-y x))
(... (firework-y x) (firework-color x))
(... (ball-x x) (ball-dx x))
(... (first x) (rest x))
etc.
}}
Then consider the result type of each selector call and wrap the accessor expression appropriately using the table with that type. So for example, if after adding all the selectors you have:
◊pre{◊code{
(... (game-ball g) ;produces Ball
     (game-paddle g)) ;produces Paddle
}}
Then, because both Ball and Paddle are non-primitive types (types that you yourself defined in a data definition) the reference rule (immediately below) says that you should add calls to those types' template functions as follows:
◊pre{◊code{
(... (fn-for-ball (game-ball g))
     (fn-for-paddle (game-paddle g)))}}
      }
    }
    ◊tr{
      ◊td{◊strong{Other Non-Base Type Reference}}
      ◊td{Predicates come from: define-struct
      ◊ul{
        ◊li{◊code{(firework? x)}}
        ◊li{◊code{(person? x)}}
      }
      }
      ◊td{Call to other types template function
        ◊ul{
         ◊li{◊code{(fn-for-firework x)}} 
         ◊li{◊code{(fn-for-person x)}}}}
    }
    ◊tr{
      ◊td{◊strong{Self Reference}}
      ◊td{}
      ◊td{From natural recursion with call to this type's template function
        ◊code{(fn-for-ls (rest ls))}}
    }
    ◊tr{
      ◊td{◊strong{Mutal Reference}
      Note: form and group all templates in mutual reference cycle together}
      ◊td{}
      ◊td{Call to other type's template function:
      ◊code{(fn-for-lod (dir-subdirs d)}
      ◊code{(fn-for-dir (first lod))}}
    }
  }
}