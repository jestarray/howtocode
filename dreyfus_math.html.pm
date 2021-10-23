#lang pollen

◊h1{The Design Recipe Rational}

◊h2{Example: Learning Basic Math}

Pause and try and solve these 4 basic arithmetic problems on screen ◊strong{without using a calculator}:

3 * 4 = ?
6 * 3 = ?
13 * 5 = ?
97 * 48 = ?

Notice how the first 2 come instantly because you were drilled to memorize the 12x12 times table at a young age. The last two didn't come as instantly. I can do 13 * 5 in my head, but once it gets to higer and higher numbers, I slow down, ◊strong{the problem reaches such a degree of complexity that I need to write things down to help myself think}.

Let's take a look at the journey it took you to get to the mastery level of doing basic arithmetic fast:

◊h2{Novice}
Think back to when you were a kid, a novice, just learning how to count and add two numbers together. It was very step by step, rule based and slow. The rules were to ◊strong{physically} hold up your hands and put a finger up each time you moved up a number, and if you ran out of fingers, write down counts of 10 or hold it in your head that already counted to 10 and then continue on.

◊img[#:src "/images/countingonfingers_maxpixel_net.jpg" #:style "max-width: 100%; height: auto;"]{}

With lots of practice, you eventually don't need to physically hold out your hands and count aloud, you can start adding and subtracting in your head. It eventually becomes automatic and  no longer deliberate. Once you learn multiplication you learn even more shortcuts and can hop around even faster.

◊h2{Learning Multiplication}

◊img[#:src "/images/learn_multiplication.jpg" #:style "max-width: 100%; height: auto;"]{}

As you move up and start learning multiplication, again it also starts off very slow, deliberate and rules based with little thinking involved. You'd fill out worksheets just doing: "count up the number of groups, fill in the blanks". These pictures and pre-filled problems act as a template/outlines, a recipe of sorts to kick start your thinking and get you understanding the concepts and emerging patterns.

With lots of practice, you eventually memorize the 12x12 multiplcation table and don't even need to think anymore, it all happens automatically. 

◊h2{Experts}

Quick! What's 5 * 2?

In just a few seconds you can pull the asnwer up where as before you would have to draw it out or slow down. It's probably hard to remember a time you ever forgot the 12x12 table now.

We're experts at basic arthimetic, we developed a strong ◊strong{intution} for when repeated addition can be rewritten to multiplication and when it can't be.

We can rewrite:
4 + 4 + 4 - 2
as
4 * 3 - 2

Woah! WHERE DID YOU GET THAT 3 FROM?
You pulled it out of nowhere! Said the student who daydreamed for a second before looking back at the whiteboard. 
Have you ever had this situation happen to you in math class where you understand it up to a certain point, randomly brain goes into daydream mode and when you look back a magic number appears? 

Where did you get that from?
How did you come up with that? 
How did you know when to do that? 

How do you "come up" with this stuff?

These are questions that pop up in every field when you're a ◊strong{novice} at anything.

In the field of art for example:
How did you draw smooth curvey shapes?
How did you know what color to use and when?
How did you know mixing this color with that color gives you this color?
How did you come up with this shading effect?
How did maintain the face being symmetrical on both ends?

An expert artist would probably struggle to come up with an answer because experts work on intution. It became automatic to them which makes it hard to verbalize how to, when really it was a combination of sketching, tracing, testing, and failing, over and over until it became second nature.

We're going to do the steps of the design recipe dogmatically, even on simple problems, which may piss off some experienced programmers because we're writing all these extra steps to write a function that you could do in your head in a minute. It's like filling out and drawing pictures for the 12x12 times table that you can pull out instantly, but we're going to be making quite the amount of complex programs, games like pong, space invaders, etc, and it will serve you well to write things down as a tool to hook your reasoning onto.

Sure you can do anything under 12x12 in an instant but what about  57 * 34? 92 * 12 * 40?

We've templatized long multiplication with 2 digits or more, e.g

  42
x 91
______

Multiply in a criss cross pattern, write the numbers below, for each criss cross move 1 point to the left, after all are done we sum up the numbers.

Your thinking will reach such a degree of complexity that you need WRITE TO HELP YOURSELF THINK. - Larry from Chicago Writing Lab.

◊; https://youtu.be/rM_E2IwlprY?t=1706 , writing tests/examples helps you go from the concrete to the abstract, if you dont understand the tests, you probably wont understand how to even write the function which abstracts over the concrete

◊; need for closure

Students often skip right past the signature and purpose definition and just get stuck for hours wondering what to do, just completely lost, completely overwhelmed. The desgin recipe is a tool that will help you make small ◊strong{actionable} steps to compose the greater solution.

Programming requires creating formulas rather than just using them, something that is not taught very much in math because all you do is plug in numbers to formulas given to you but rarely do you get enough time to dive into how it was invented and the amount of failures it took to get to the final formula.

Programming tutorials are often bad at this because they are taught by people who are experts(hopefully) that have 1000s of calculations and pattern recognition ◊strong{going on in their head that they don't verbalize or show their work before hand.} When to use some syntactic shorthand, when to factor things out, etc, just like how you do so with basic math!

How most people learned programming is by watching others and copying them and then ramming their head into walls when the copying doesnt work or staring at a blank page, we're going to jott things down and work through them systematically in a disciplined fashion. Credits to "How to Design Programs" as my material is losely based on it, and the entire team behind it. All of their educational research points out that this works so that's what we'll do.

When you're done with this course you'll be able to do some things in your head for sure and you won't need to write out the steps and think explictly.

NASA MARS CLIMATE ORBITER ARE THE REASONS WHY WE WRITE TESTS, FIXING A PROBLEM CAN OPEN A BUG