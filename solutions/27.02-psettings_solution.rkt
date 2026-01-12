#lang htdp/isl+
(define PNAME 'psettings)
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples✅
4. A function template that processes this data✅

Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect/tests, elaborate the concrete) ✅
  2B. if the function consumes a list, make sure a list of 2 or longer is tested✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

; ===== DATA DEFS =====

#|PROBLEM A:
Write the template for Cmd, Menu, Entry and ListOfEntry
Use these to solve the rest of the other problems
|#

(define-struct cmd [label toggle])
; Command is (make-cmd String Boolean)
; interp.
; label is the name of the action
; toggle is whether its on or off

; cmd-temp : (Cmd -> ???)
(define (cmd-temp com)
  (...
   (cmd-label com) ; String
   (cmd-toggle com))) ; Boolean

(define-struct menu [label entries])
; Menu is (make-menu String ListOfEntry)
; interp.
; label is the name ofthe menu
; entries are the list of menus or cmds(button toggles), aka an Entry

; menu-temp : (Menu -> ???)
(define (menu-temp men)
  (...
   (menu-label men) ; String
   (list-entry-temp (menu-entries men)))) ; ListOfEntry

; A Entry is one of:
; - (make-cmd String Boolean)
; - (make-menu String ListOfEntry)

; entry-temp : (Entry -> ???)
(define (entry-temp en)
  (cond
    [(cmd? en)
     (cmd-temp en)] ; Command
    [(menu? en)
     (menu-temp en)])) ; Menu

; A ListOfEntry is one of:
; - empty
; - (cons Entry ListOfEntry)

; list-entry-temp : (ListOfEntry -> ???)
(define (list-entry-temp entry-lst)
  (cond
    [(empty? entry-lst) ...]
    [else
     (...
      (entry-temp (first entry-lst)) ; Entry
      (list-entry-temp (rest entry-lst)))]))

#|
Directory-Tree Diagram(A):

Settings [Menu]
├── Connection [Menu]
│   ├── Wifi (Cmd)
│   ├── Bluetooth (Cmd)
│   ├── Airplane Mode (Cmd)
│   ├── Mobile Networks [Menu]
│   │   ├── Data Roaming (Cmd)
│   │   └── Allow 5G service (Cmd)
│   └── Data Usage [Menu]
│       └── Data Saver (Cmd)
└── Display [Menu]
    └── Adaptive Brightness (Cmd)

Hierarchy-Tree Diagram(A):
NOTE: SOME NAMES ARE SHORTEND!!!

                   [Settings]
                        |
            +-----------+-----------+
            |                       |
      [Connection]              [Display]
            |                       |
    +-------+-------+-------+  (Adaptive Brightness)
    |       |       |       |
 (Wifi)   (BT)  (Airplane)  |
                            |
                +-----------+-----------+
                |                       |
        [Mobile Networks]          [Data Usage]
                |                       |
        +-------+-------+            (Saver)
        |               |
    (Roaming)        (5G Svc)
|#

#|PROBLEM B:
Smartphones have Settings menus that themselves have submenus and commands.
The above Diagram(A) is from my android phone.
Translate the above diagram into code with combinations of
"make-menu" and "make-cmd"
|#

(define display (make-menu "Display" (list (make-cmd "Adaptive Brightness" #false))))
(define data-usage (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))

(define mobile-net
  (make-menu
   "Mobile Networks"
   (list (make-cmd "Data Roaming" #false)
         (make-cmd "Allow 5G service" #false))))

(define airplane (make-cmd "Airplane Mode" #false))
(define bluetooth-cmd (make-cmd "Bluetooth" #false))
(define wifi-cmd (make-cmd "Wifi" #false))
(define connection (make-menu "Connection" (list wifi-cmd bluetooth-cmd airplane mobile-net data-usage)))
(define settings (make-menu "Settings" (list connection display)))

#|PROBLEM C:
Design a function "count-toggles" that consumes a Menu
and counts how many Commands(cmd) there are in
the given Menu(and in all nested submenus)
For example: 
Given: Connections ,    produce: 6
Given: Mobile Networks, produce 2
|#
; count-toggles : (Menu -> Number)
; produces the amount of Commands in the given Menu(and submenus)
(check-expect (count-toggles display) 1)
(check-expect (count-toggles mobile-net) 2)
(check-expect (count-toggles connection) 6)
(check-expect (count-toggles settings) 7)
(define (count-toggles men)
  (+
   (count-entries (menu-entries men))))

; count-entries : (ListOfEntry -> Number)
; produce the count of the entries in the given list
(check-expect (count-entries empty) 0)
(check-expect (count-entries (list (make-cmd "Adaptive Brightness" #false))) 1)
(check-expect (count-entries (list wifi-cmd bluetooth-cmd display)) 3)
(define (count-entries entry-lst)
  (cond
    [(empty? entry-lst) 0]
    [else
     (+
      (entry-weight (first entry-lst)) ; Entry -> Number
      (count-entries (rest entry-lst)))]))

; count-entry : (Entry -> Number)
(define (entry-weight en)
  (cond
    [(cmd? en)
     1]
    [(menu? en)
     (count-toggles en)]))

#|PROBLEM D:
Design a function "has-setting?" which consumes a "Menu" and a search term(String)
It produces #true if the given Menu(including submenus) has Entry's
with the given search term.
NOTICE that we're searching for BOTH Commands and Menu labels!
NOTE: This should also be case incensitive,
e.g all lowercase search terms should work
For example:
(check-expect (has-setting? settings "sEtTings") #true)
(has-setting? settings "data usage") -> #true
(has-setting? settings "DaTa UsAgE") -> #true
(has-setting? settings "wifi") -> #true
(has-setting? settings "wIfi") -> #true
|#

; String String -> Boolean
; comparing strings disregarding capitalizations
(define (string-case-insen=? s1 s2)
  (string=? (string-downcase s1) (string-downcase s2)))
; has-setting? : (Menu String -> Boolean)
; produces #true if the given Menu has an Entry with the given search term
(check-expect (has-setting? settings "Hack me") #false)
(check-expect (has-setting? settings "settings") #true)
(check-expect (has-setting? settings "sEtTings") #true)
(check-expect (has-setting? settings "data usage") #true)
(check-expect (has-setting? settings "Data usaGe") #true)
(check-expect (has-setting? settings "wifi") #true)
(check-expect (has-setting? settings "Wifi") #true)
(check-expect (has-setting? settings "Hack me") #false)
(define (has-setting? men findname)
  (or (string-case-insen=? (menu-label men) findname) ; String
      (in-entries? (menu-entries men) findname))) ; ListOfEntry String -> Boolean

; in-entries? : (ListOfEntry String -> Boolean)
; produces #true if the given search term is in the given list
(check-expect (in-entries? empty "Wifi") #false)
(check-expect (in-entries? (list wifi-cmd) "Wifi") #true)
(check-expect (in-entries? (list wifi-cmd) "wIfI") #true)
(check-expect (in-entries? (list wifi-cmd bluetooth-cmd) "bluetooth") #true)
(check-expect (in-entries? (list wifi-cmd bluetooth-cmd) "bluetootH") #true)
(check-expect (in-entries? (list wifi-cmd bluetooth-cmd airplane mobile-net) "mobile networks") #true)
(check-expect (in-entries? (list wifi-cmd bluetooth-cmd airplane mobile-net) "data roaming") #true)
(define (in-entries? entry-lst findname)
  (cond
    [(empty? entry-lst) #false]
    [else
     (or (is-entry? (first entry-lst) findname) ; Entry
         (in-entries? (rest entry-lst) findname))]))

; is-entry? : (Entry String -> Boolean)
(define (is-entry? en findname)
  (cond
    [(cmd? en)
     (string-case-insen=? (cmd-label en) findname)]
    [(menu? en)
     (has-setting? en findname)]))

#|PROBLEM E:
You want to create a "High Contrast" version of your menu
which capitalizes every label

Design a function "all-caps-menu" that consumes a Menu and produces a Menu
where every single label (both commands and sub-menus) has been converted to UPPERCASE.
Hint: Use the built-in string-upcase function.

For example:
Given:
(make-menu "Data Usage" (list (make-cmd "Data Saver" #false)))
produce:
(make-menu "DATA USAGE" (list (make-cmd "DATA SAVER" #false)))
|#
(: all-caps-menu (Menu -> Menu))
; produces the given Menu but with all labels capitalized
(check-expect (all-caps-menu (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))
              (make-menu "DATA USAGE" (list (make-cmd "DATA SAVER" #false))))
(check-expect (all-caps-menu (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false)
                                                                (make-cmd "5g" #false))))
              (make-menu "MOBILE NETWORKS" (list (make-cmd "DATA ROAMING" #false)
                                                 (make-cmd "5G" #false))))
(define (all-caps-menu men)
  (make-menu
   (string-upcase (menu-label men)) ; String
   (all-caps-entries-list (menu-entries men)))) ; ListOfEntry -> ListOfEntry

; all-caps-entries-list : (ListOfEntry -> ListOfEntry)
; produce the given list of entries but with labels capitalized
(check-expect (all-caps-entries-list empty) empty)
(check-expect (all-caps-entries-list (list wifi-cmd))
              (list (make-cmd "WIFI" #false)))
(check-expect (all-caps-entries-list (list (make-menu "Data Usage" (list (make-cmd "Data Saver" #false)))))
              (list (make-menu "DATA USAGE" (list (make-cmd "DATA SAVER" #false)))))
(define (all-caps-entries-list entry-lst)
  (cond
    [(empty? entry-lst) empty]
    [else
     (cons
      (capitalize-entry (first entry-lst)) ; Entry -> Entry
      (all-caps-entries-list (rest entry-lst)))]))

; capitalize-entry : (Entry -> Entry)
(define (capitalize-entry en)
  (cond
    [(cmd? en)
     (capitalize-cmd en)]
    [(menu? en)
     (all-caps-menu en)]))

; capitalize-cmd : (Cmd -> Cmd)
; produces the given Cmd but with the label capitalized
(define (capitalize-cmd com)
  (make-cmd
   (string-upcase (cmd-label com))
   (cmd-toggle com)))

#|PROBLEM F(hard):
Smartphone search/help menus show the path to get to a Command/Menu
like so:
"Settings > Connections > Wifi"

Design a function "find-path" that takes a Menu and a String
It should return a list of strings showing the path to get there.
For example:
If you are looking for "Bluetooth" STARTING from "Connections",
it should return (list "Connections" "Bluetooth").

HINT: "has-setting?" from Problem B and "append" may come in useful
This problem originally is case sensitive, but its recomended
you compare strings case insenetively with string-downcase
|#
(: find-path (Menu String -> [ListOf String]))
; produces the path from the given menu to the search entry term
(check-expect (find-path settings "hack me") empty)
(check-expect (find-path connection "Bluetooth")
              (list "Connection" "Bluetooth"))
(check-expect (find-path settings "Mobile Networks")
              (list "Settings" "Connection" "Mobile Networks"))
(check-expect (find-path settings "Data Saver")
              (list "Settings" "Connection" "Data Usage" "Data Saver"))
(define (find-path men findname)
  (if (has-setting? men findname)
      (cons
       (menu-label men) ; String
       (find-path-list-entry (menu-entries men) findname))
      empty)) ; ListOfEntry

; find-path-list-entry : (ListOfEntry String -> ListOfString)
(check-expect (find-path-list-entry empty "whatever") empty)
(check-expect (find-path-list-entry (list wifi-cmd) "Wifi")
              (list "Wifi"))
(check-expect (find-path-list-entry (list wifi-cmd bluetooth-cmd) "Bluetooth")
              (list "Bluetooth"))
(check-expect (find-path-list-entry (list wifi-cmd bluetooth-cmd mobile-net) "Data Roaming")
              (list "Mobile Networks" "Data Roaming"))
(define (find-path-list-entry entry-lst findname)
  (cond
    [(empty? entry-lst) empty]
    [else
     (append
      (find-path-entry (first entry-lst) findname) ; Entry -> ListOfString
      (find-path-list-entry (rest entry-lst) findname))]))

; find-path-entry : (Entry String -> ListOfString)
(check-expect (find-path-entry wifi-cmd "Wifi")
              (list "Wifi"))
(check-expect (find-path-entry wifi-cmd "asdf")
              empty)
(define (find-path-entry en search)
  (cond
    [(cmd? en)
     (local
       [(define check-cmd (is-cmd-name? en search))]
       (if (false? check-cmd)
           empty
           (list check-cmd)))]
    [(menu? en)
     (find-path en search)]))

; is-cmd-name : (Cmd String -> StringOrFalse)
(define (is-cmd-name? com search)
  (if (string=? (cmd-label com) search) ; String
      (cmd-label com)
      #false))