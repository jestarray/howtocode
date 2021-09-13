#lang pollen

◊h1{Learning Stages}

◊ptime{08/30/21}

◊img[#:src "/images/dreyfus.png" #:style "max-width: 100%; height: auto;"]{}

◊h2{Novice}
◊ul{
    ◊li{Rigid adherence to rules}
    ◊li{They need context-free rules to follow e.g., “Whenever X happens, do Y.”}
    ◊li{They don’t know how to respond to mistakes.}
}

◊h2{Advanced Beginner}
◊ul{
    ◊li{Advanced beginners work on things on their own relying on their recent experiences and without being given step-by-step instructions.}
    ◊li{When problems arise, they have difficulty troubleshooting.}
    ◊li{They want information fast — without the lengthy theory or without being spoon-fed the basics.}
    ◊li{They start formulating some principles.}
    ◊li{They have no holistic understanding and aren’t that eager about it yet.}
}

◊h2{Competent}
◊ul{
    ◊li{Competents develop conceptual models of how things work (or should work).}
    ◊li{They can troubleshoot most problems on their own — including those they haven’t faced before.}
    ◊li{They seek out expert advice and are able to use it effectively.}
    ◊li{They are often described as “having initiative” and being “resourceful”.}
    ◊li{They can take on leadership roles or mentor the novices.}
}

◊h2{Proficient}
◊ul{
    ◊li{Proficient practitioners want to see the big picture.}
    ◊li{They are frustrated by oversimplified information.}
    ◊li{They can correct previous poor task performance, reflect and revise their approach to perform better next time.}
    ◊li{They learn from the experience of others.}
    ◊li{They know when to not follow the plan, and can identify what needs to be done instead.}
    ◊li{They understand and apply maxims, which are proverbial, fundamental truths that have to be applied within a certain context.}
}

◊h2{Expert}
◊ul{
    ◊li{Experts are the primary sources of knowledge and information.}
    ◊li{They continually look for better ways of doing things.}
    ◊li{They can be amazingly intuitive but may also be completely inarticulate as to how they arrived at a conclusion.}
    ◊li{They know which details to focus on and which details can be safely ignored.}
    ◊li{Know when to deviate from rules}
}

From the book ◊b{Pragmatic Thinking and Learning: Refactor Your “Wetware”}, a summary of ◊b{Dreyfus model of skill acuisition.}

◊h2{Example: Learning basic math}
What is 4 + 4 + 4 - 5?

Think back to when you were a kid, a novice, just learning how to count and add two numbers together. It was very step by step, rule based and slow. The rules were to physically hold up your hands and put a finger up each time you moved up a number, and if you ran out of fingers, write down a 10 or hold it in your head that already counted to 10 and then continue on.

◊img[#:src "/images/countingonfingers.png" #:style "max-width: 100%; height: auto;"]{}

With lots of practice, you eventually don't need to physically hold out your hands and count aloud, you can start holding counting in your head!

As you move up and start learning multiplication, it also starts off very slow, deliberate and rule based with little thinking involved, just doing: "count up the number of groups, fill in the blanks". These pictures and pre-filled problems act as a template, a recipe, to kick start your thinking and get you to understanding the concepts and emerging patterns.
◊img[#:src "/images/learn_multiplication.jpg" #:style "max-width: 100%; height: auto;"]{}

We've templatized long multiplication with 2 digits or more, e.g 
42
91
__
multiply in a criss cross pattern, write the numbers below, for each criss cross move 1 point to the left, after all are done we sum up the numbers.

Learning how to dance or do a martial arts move, you chunk it up into smaller pieces and start fumbling to get your body to be only fimilar with one motion at a time, chunking it up before you can then fuse them together into a swift motion.

Programming requires creating formulas rather than just using them, something that is not taught very much in math because all you do is plug in numbers to formulas given to you but rarely do you get enough time to dive into how it was invented and the amount of failures it took to get to the final formula.

With lots of practice, you eventually memorize the multiplcation table and don't even need to think anymore, it all happens automatically. You can answer to 5 * 2 in less than a second where as before you would have to draw it out or slow down.

We're experts at basic arthimetic, we developed a strong ◊strong{intution} for when repeated addition can be rewritten to multiplication and when it can't be.

We can rewrite: 
4 + 4 + 4 - 5
as
4 * 3 - 5

WHERE DID YOU GET THAT 3 FROM? You pulled it out of nowhere! Said the student who daydreamed for a second before looking back at the whiteboard.

Where did you get that from?
How did you come up with that? 
How did you know when to do that? 
What is the * symbol mean?

These are questions that some students would ask if you were teaching them basic math, and it's no different for learning programming or any other subject.

In the field of art for example, take Bob Ross and other famous artists:
How did you draw that curvey shape?
How did you know what color to use and when?
How did you know mixing this color with that color gives you this color?
How did you come up with this shading effect?
How did maintain the face being symmetrical on both ends?

An expert artist would probably struggle to come up with an answer because it's all intution, it's all automatic and hard to verbalize how, when really it was a combination of sketching, tracing, testing, and failing, over and over until it became second nature.

Programming tutorials are often bad at this because they are taught by people who are experts that have 1000s of calculations and pattern recognition ◊strong{going on in their head that they don't verbalize or show their work before hand.} When to use some syntactic shorthand, when to factor things out, etc, just like how you do so with basic math!

How most people learned programming is by watching others and copying them and then running into walls when the copying doesnt work or staring at a blank page

NASA MARS CLIMATE ORBITER ARE THE REASONS WHY WE WRITE TESTS, FIXING A PROBLEM CAN OPEN A BUG