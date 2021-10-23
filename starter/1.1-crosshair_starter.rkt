;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1.1-crosshair_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;PROBLEM: Use (place-image) to put a crosshair,
; that is the text of a plus +, on the CENTER of this empty-scene
; https://howtocode.pages.dev/images/center_crosshair.png
(text "+" 50 "black")
(empty-scene 200 100)