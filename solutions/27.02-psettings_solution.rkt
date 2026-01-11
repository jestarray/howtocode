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
(define (cmd-temp c)
  (...
   (cmd-label c) ; String
   (cmd-toggle c))) ; Boolean

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

; A Entry is one of:
; - (make-cmd String Boolean)
; - (make-menu String ListOfEntry)

; entry-temp : (Entry -> ???)
(define (entry-temp en)
  (cond
    [(cmd? en)
     (cmd-temp en)]
    [(menu? en)
     (menu-temp en)]))

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
   (count-submenus (menu-entries men))))

; count-submenus : (ListOfEntry -> Number)
(define (count-submenus entry-lst)
  (cond
    [(empty? entry-lst) 0]
    [else
     (+
      (count-entry (first entry-lst)) ; Entry
      (count-submenus (rest entry-lst)))]))

; count-entry : (Entry -> Number)
(define (count-entry en)
  (cond
    [(cmd? en)
     1]
    [(menu? en)
     (count-toggles en)]))

#|PROBLEM D:
Design a function "has-setting?" which consumes a "Menu" and a search term(String)
It produces #true if the given Menu(including submenus) has Entry's
with the given search term.
NOTE: This should also be case incensitive,
e.g all lowercase search terms should work
For example:
(has-setting? settings "data usage") -> #true
(has-setting? settings "DaTa UsAgE") -> #true
(has-setting? settings "wifi") -> #true
(has-setting? settings "wIfi") -> #true
|#

; has-setting? : (Menu String -> Boolean)
; produces #true if the given Menu has an Entry with the given search term
(check-expect (has-setting? settings "data usage") #true)
(check-expect (has-setting? settings "Data usage") #true)
(check-expect (has-setting? settings "wifi") #true)
(check-expect (has-setting? settings "Wifi") #true)
(check-expect (has-setting? settings "ultra fast charging") #false)
(define (has-setting? men search)
  (or (string=? (string-downcase (menu-label men)) (string-downcase search))
      (in-entries? (menu-entries men) search)))

; in-entries? : (ListOfEntry String -> Boolean)
(define (in-entries? entry-lst search)
  (cond
    [(empty? entry-lst) #false]
    [else
     (or (is-entry? (first entry-lst) search) ; Entry
         (in-entries? (rest entry-lst) search))]))

; is-entry? : (Entry String -> Boolean)
(define (is-entry? en search)
  (cond
    [(cmd? en)
     (label-eq-cmd? en search)]
    [(menu? en)
     (has-setting? en search)]))

; has-label-cmd? : (Cmd String -> Cmd)
(define (label-eq-cmd? c search)
  (string=? (string-downcase (cmd-label c)) (string-downcase search)))

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

; all-caps-menu : (Menu -> Menu)
; produces the given Menu but with all labels capitalized
(define (all-caps-menu men)
  (make-menu
   (string-upcase (menu-label men)) ; String
   (all-caps-entries-list (menu-entries men))))

; all-caps-entry : (ListOfEntry -> ListOfEntry)
(define (all-caps-entries-list entry-lst)
  (cond
    [(empty? entry-lst) empty]
    [else
     (cons
      (capitalize-entry (first entry-lst)) ; Entry
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
(define (capitalize-cmd c)
  (make-cmd
   (string-upcase (cmd-label c))
   (cmd-toggle c)))

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
|#

; find-path : (Menu String -> ListOfString)
(check-expect (find-path connection "hidden") empty)
(check-expect (find-path connection "Connection") (list "Connection"))
(check-expect (find-path settings "Connection") (list "Settings" "Connection"))

(define (find-path men search)
  (if (has-setting? men search)
      (cons
       (menu-label men) ; String
       (find-path-list-entry (menu-entries men) search))
      empty)) ; ListOfEntry

; find-path-list-entry : (ListOfEntry String -> ListOfString)
(define (find-path-list-entry entry-lst search)
  (cond
    [(empty? entry-lst) empty]
    [else
     (append
      (find-path-entry (first entry-lst) search) ; Entry
      (find-path-list-entry (rest entry-lst) search))]))

; find-path-entry : (Entry String -> ListOfString)
(define (find-path-entry en search)
  (cond
    [(cmd? en)
     (local
       [(define check-cmd (is-cmd-name en search))]
       (if (false? check-cmd)
           empty
           (list check-cmd)))]
    [(menu? en)
     (find-path en search)]))

; is-cmd-name : (Cmd String -> StringOrFalse)
(define (is-cmd-name c search)
  (if (string=? (cmd-label c) search) ; String
      (cmd-label c)
      #false))