(require 2htdp/image)

;PROBLEM: Use (place-image) to put a crosshair, 
; that is the text of a plus +, on the CENTER of this empty-scene
; https://jestlearn.com/images/center_crosshair.png

(place-image
 (text "+" 50 "black")
 (/ 200 2)
 (/ 100 2)
 (empty-scene 200 100))