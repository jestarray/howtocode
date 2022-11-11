;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.03-can-walk_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'can-walk?)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description❌
    2. Interpretation❌
    3. Data Examples❌
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect, elaborate the concrete) ❌
    3. Template(from data)?❌
    3. Code body ❌
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
video: https://youtu.be/2m_mZF29urU

A pedestrian walk light has 3 stages:
countdown from 10 to 0
walk
stop

Write the data definition for WalkLight that represents these
three states using at least 2 type.
|#

#|PROBLEM B:
A City has hired you to detect when a WalkLight is walkable
so that it can play a "walk" sound so help the blind.
You are tasked with the detection onl!

Design a function called "can-walk?" that consumes a WalkLight
and produces whether the pedestrian can walk accross or not.
|#
