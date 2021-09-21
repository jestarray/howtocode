#lang pollen
◊(require racket/file)
◊slide{
◊h1{Introduction}
}
◊(h2 "Why not other languages?")
◊slide{
    ◊ul{
        ◊li{Variables}
        ◊li{loops}
        ◊li{functions}
        ◊li{conditions}
        ◊li{etc..}
    } , all these universal programming concepts can be explained in under an hour} but that's not where the difficulty of programming lies. It lies in how to combine and link these operations in useful ways to accomplish a goal. In analogy to writting an essay, spelling is never the hardest part, especially with tools like auto correct, it's making sure your writing links together well to accomplish a goal.

◊slide{

◊h3{I'm not here to to waste your time on the nuances of language syntax rules.}

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
}
and this is all to just get your code to execute! Sure these 10-20+ or so rules are not hard as you eventually get used to slogging through the error messages to learn them, but what's more important is that they are distracting you from actual programming, logical thinking, and the pure essence of problem solving.

◊slide{
◊(h2 "The Racket Language")

Instead we're going to use a language called Racket, which really only has about ONE main syntax rule:

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket" 
"(<operator> <argument-1> <argument-2> ...)
(+ 1 2)   
")
}
}

and that's mostly it! The orgins of Racket come from LISP, a very old language that is one of the most ◊a[#:href "https://en.wikipedia.org/wiki/Lisp_(programming_language)"]{highly influential} programming languages of all time. A lot of ideas originated from LISP, and that is why it is said that learning a LISP will make you a better programmer in general, and I'll go into why when we get there.

By the end of this course you will not only have learned how to program but how to program well, so whether you're an absolute beginner who has never programmed before, or you've had some programming experience needing to get out of tutorial hell and want to get to the next level, this course is for you.

If you're further interested in

◊blockquote{
"where is this language even used?" 
"why parenthesis everywhere?"
...
}

◊slide{
◊h2{Racket used in the industry}
here is Naughty Dog studios, creator of games like The Last Of Us and Uncharted using racket for scripting animation and gameplay:

◊(yt "Y7-OoXqNYgY" #:headline "Racket used for game dialgoue scripting" #:open #true)
◊(yt "fQnUTmOu3lc?t=1777" #:headline "Racket used for animation scripting" #:open #true)

John Carmack pushing Racket to be the language for VR:
◊(yt "ydyztGZnbNs" #:headline "Racket used for VR scripting" #:open #true)

There isn't anything stopping Racket from being used in the industry so why isn't Racket used much more? Mainly because programmers keep crying over parentheses. John Carmack for those who don't know is one of the most renowned programmers in the game industry who pushed the limits of 3D computer graphics, and he tried to push Racket as a VR scripting language in 2015, but it seems that Oculus decided to pursue Javascript instead. He also mentioned if he could go back in time he would use it for the scripting language of his game Quake, which was one of the best selling video games in the 1996.

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
}
