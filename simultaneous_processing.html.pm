#lang pollen

◊h1{Simultaneous Processing}
If we visualize processing a list like a conveyor belt of values moving from right to left, there are 3 main scenarios.
◊slide{
◊h2{Process Only 1}
◊img[#:src "./images/only_one_rate.svg"]{}
Notice only one of the lists is processed, while the other sort of holds still
◊racket-code-block{
(recursive-fn (rest lst1) lst2)
}
}

◊slide{
◊h2{Lockstep both at the same time}
◊img[#:src "./images/same_rate.svg"]{}
Both lists being processed at the same time
◊racket-code-block{
(recursive-fn (rest lst1) (rest lst2))
}
}

◊slide{
◊h2{Both at different rates}
◊img[#:src "./images/diff_rate.svg"]{}
Lists are processed at different rates depending on some condition
◊racket-code-block{
(if something?
    (recursive-fn lst1 (rest lst2))
    (recursive-fn (rest lst1) lst2))
}
}

◊slide{
◊h2{Deducing the cases}
◊h3{Tables}
Do the table method over both inputs to see what cases you have to cover and think about, and then simplify from there. This results in an NxN cond that is a good first pass, but can be further simplified.

◊table{
  ◊thead{
    ◊tr{
      ◊th{} ◊; Empty corner cell
      ◊th[#:scope "col"]{(empty? lst1)}
      ◊th[#:scope "col"]{(cons? lst1)}
    }
  }
  ◊tbody{
    ◊tr{
      ◊th[#:scope "row"]{(empty? lst2)}
      ◊td{both lists are empty}
      ◊td{lst1 has items, lst2 is empty}
    }
    ◊tr{
      ◊th[#:scope "row"]{(cons? lst2)}
      ◊td{lst2 has items, lst1 is empty}
      ◊td{both lists have items}
    }
  }
}
You can use ◊a[#:href "https://truben.no/table/#t=XQAAQACqBwAAAAAAAAA9iIhmlCK88bNBnMeko9jCKiwvfJt7hC80L1hchidRiHu4kC7gpDdGA8M6AQpzNlSgB21sXdygIbb7enYxls8znTnkruQYBjmFU-r6PZkuRnalF6cL-MhZWZ4tzVjc2lpLEQpCJDB10UpZHur6Y9y_yrImq5wOTIe6jsPwlZsaX9XaFGHs8Cj4h_HKZoQpLYhRs5v9GOu2d4z0xqhvRpPd9AyeGZHVBau_Oj_y2jLB26q7UyOVlEeEAuV-RzHrTVcAKLBg2lXwsVCiy5L2rhhYsAIcxpt55_IZUO8p8gQ1R5p6nHXDaqYoKzjZadfB96hYPuft_2h3rAAA"]{Truben.no} to fill in the table cases.
}

◊slide{
◊h3{Simultaneous Recursion Template}
It helps writing out all the 4 cases in both the tests and templates to elaborate what the function should do
◊racket-code-block{
; sim-recur-temp : (ListOfX ListOfX -> ???)
(define (sim-recur-temp lst1 lst2)
  (cond
    [(and (empty? lst1) (empty? lst2))
     ...]
    [(and (cons? lst1) (empty? lst2))
     (... (first lst1) (rest lst1))]
    [(and (empty? lst1) (cons? lst2))
     (... (first lst2) (rest lst2))]
    [(and (cons? lst1) (cons? lst2))
     (... (first lst1) (first lst2) (rest lst1) (rest lst2))]))
}
}


◊h3{Lists and Numbers}
Reminder that Natural Numbers can be viewed as a recursive type just like a List. You will encounter problems where you'll consume a Number and a List and process them both. Typically the base case for the Number is zero, with recursive calls being ◊code{sub1} or ◊code{(- n 1)}
◊racket-code-block{
; A Natural is one of:
; - 0
; (add1 Natural)

; natural-temp : (Natural -> ???)
(define (natural-temp n)
  (cond
    [(= 0 n) ...]
    [else
     (natural-temp (- n 1))]))
}

◊table{
  ◊thead{
    ◊tr{
      ◊th{} ◊; Empty corner cell
      ◊th[#:scope "col"]{(empty? lst1)}
      ◊th[#:scope "col"]{(cons? lst1)}
    }
  }
  ◊tbody{
    ◊tr{
      ◊th[#:scope "row"]{(= num 0)}
      ◊td{lists are empty and num is zero}
      ◊td{lst1 has items, num is zero}
    }
    ◊tr{
      ◊th[#:scope "row"]{(> num 0)}
      ◊td{num is non-zero, lst1 is empty}
      ◊td{num is non-zero, and lst1 is non-empty}
    }
  }
}
