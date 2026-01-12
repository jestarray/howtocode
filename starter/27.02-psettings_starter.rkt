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

(define-struct menu [label entries])
; Menu is (make-menu String ListOfEntry)
; interp.
; label is the name ofthe menu
; entries are the list of menus or cmds(button toggles), aka an Entry

; menu-temp : (Menu -> ???)
; TODO

; A ListOfEntry is one of:
; - empty
; - (cons Entry ListOfEntry)

; list-entry-temp : (ListOfEntry -> ???)
; TODO

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

(define display (make-menu ...))
(define data-usage ...)

(define mobile-net ...)

(define airplane (make-cmd ...))
(define bluetooth-cmd ...)
(define wifi-cmd ...)
(define connection ...)
(define settings ...)

#|PROBLEM C:
Design a function "count-toggles" that consumes a Menu
and counts how many Commands(cmd) there are in
the given Menu(and in all nested submenus)
For example: 
Given: Connections ,    produce: 6
Given: Mobile Networks, produce 2
|#

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