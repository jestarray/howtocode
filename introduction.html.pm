#lang pollen
◊(require racket/file)
◊h1{Introduction}

◊(h2 "Why not other languages?")
Variables, loops, conditionals, functions, etc, all these universal programming concepts can be explained in under an hour but that's not where the difficulty of programming lies. It lies in how to combine and link these operations in useful ways to accomplish a goal. In analogy to writting an essay, spelling is never the hardest part, especially with tools like auto correct, it's making sure your writing links together well to accomplish a goal.

I'm not here to to waste your time on the nuances of language syntax rules. 
Python, Java, C#, Javascript, C, etc all these languages give you a bunch of syntax rules

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-java"
"//java
class HelloWorld
{
    public static void main(String args[])
    {
        System.out.println(\"Hello, World\");
    }
}
")
}

You have to start memorizing:
◊ul{
    ◊li{where and where-not to put semicolons ◊code{;}}
    ◊li{where and where-not to put parenthesis ◊code{()}}
    ◊li{where and where-not to put curly braces ◊code{{}}}
    ◊li{classes and access modifiers(in the case of C# and Java)}
    ◊li{where to hit tabs and space out your code (in the case of python, this effects scoping)}
    ◊li{where to type certain keywords in certain spots(static typing)}
    ◊li{the list goes on ...}
}

and this is all to just get your code to execute! Sure these 10-20+ or so rules are not hard as you eventually get used to slogging through the error messages to learn them, but what's more important is that they are distracting you from actual programming, logical thinking, and the pure essence of problem solving.

◊(h2 "The Racket Language")

Instead we're going to use a language called Racket, which really only has about ONE main syntax rule:

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket" 
"(<operator> <argument-1> <argument-2> ...)

(+ 1 2)   
")
}


and that's mostly it! It's incredibly easy to get started with compared to other languages, and it's severely underrated because it can do more things that other languages can't do! In fact, the origins of Racket, e.g LISP invented a lot of ideas that python, javascript, and many other languages steal from! (clip wikipedia article of influenced languages, compare python and js vs lisp influences), and learning LISP/Racket will make you a better programmer in other languages if not in general, and I'll go into why when we get there.

By the end of this course you will not only have learned how to program but how to program well, so whether you're an absolute beginner who has never programmed before, or you've had some programming experience and want to get to the next level, this course is for you.

If you're further interested in

◊blockquote{
"where is this language even used?" 
"why parenthesis everywhere?"
...
}

◊h2{Racket used in the industry}
here is Naughty Dog studios, creator of games like The Last Of Us and Uncharted using racket for scripting animation and gameplay:

◊(yt "Y7-OoXqNYgY" #:headline "Racket used for game dialgoue scripting" #:open #true)
◊(yt "fQnUTmOu3lc?t=1777" #:headline "Racket used for animation scripting" #:open #true)

John Carmack pushing Racket to be the language for VR:
◊(yt "ydyztGZnbNs" #:headline "Racket used for VR scripting" #:open #true)


◊h2{Why all the parenthesis?}

HTML, CSS, Javascript, JSON, could have been 1 unified language:
◊(yt "0bqPYIuFvpo" #:headline "What the web would be like if it used LISP")

◊a[#:href "https://www.coursera.org/lecture/programming-languages-part-b/syntax-and-parentheses-QrOSF"]{ Dan Grossmans Programming Lang Part B on Coursera}

and a dozen of other further reading articles:

◊a[#:href "https://stopa.io/post/265?repost=true"]{An Intuition for Lisp Syntax - https://stopa.io/post/265?repost=true}
◊a[#:href "https://rakhim.org/images/honestly-undefined/lisp_is_ugly.jpg"]{
Lisp is stupid with all the parens comic - https://rakhim.org/images/honestly-undefined/lisp_is_ugly.jpg
}
◊a[#:href "https://en.wikipedia.org/wiki/WebAssembly"]{
Web Assembly using LISP s-expressions - https://en.wikipedia.org/wiki/WebAssembly
}

