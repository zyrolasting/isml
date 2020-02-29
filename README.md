_Read the latest copy of this article [here](https://sagegerard.com/isml.html)_

I think I learned about perhaps four new markup languages this week.
I'm going to skip to the finish line they seem to be approaching.

Here I present to you the [stupidest markup language in the
world](https://github.com/zyrolasting/isml), made with
<s>love</s> nihilism. I'll start with a 10-second tutorial,
wander into a rant, and then recite "what if" questions I now
anticipate after arguing with invisible critics in the shower.

## The Required Specification
You have ten seconds to learn the language. Ready? Go.

* UTF-8 only.
* The first character is the control character.
* Whatever follows a control character is for a program to read.
  Doesn't matter how, except the program should know when the
  expression ends.
* The result of a parse is a list of strings with expressions.

So reading `⊙ hi ⊙(b "all")` in Racket yields `'("hi " (b "all"))`.
So does `^ hi ^(b "all")`, because it's the same document. The parser
is [30 lines of
code](https://raw.githubusercontent.com/zyrolasting/isml/906da23f4ef786f5e643de0825c94e32749ff087/main.rkt),
including blank lines. And that's allowing user-defined validation.

## The Optional Rant
I know what you are going to say. "Trash. There's no standard that
means anything, so you have to have the right program for any given
document."  You're right. If ISML were well-adopted, then everyone
would have their own format, parser and validator. And even then, 10%
of those would work well and about eight formats would be crazy popular.

That would be damning criticism, if it weren't for the fact that the
world is _already like that._ Pollen markup also uses a control
character and depends on you for meaning, so it's not like this is a
new idea. But even with standards and strong validation features I've
seen people paste base64 blobs into well-adopted formats like YAML,
forcing their team to write more code to accomodate the bloat and
validate data. Even the ubiquitous Markdown has been extended in
enough ways to make the name "Markdown" meaningless. I say this as an
author of [one such
extension](https://docs.racket-lang.org/polyglot-guide/Racket_in_Markdown.html). If
you think I'm exaggerating, then tell me that using
[HTML6](http://www.html6.network/H%D0%A2ML/). It's almost like human
expression can't be contained by a stiff grammar!

I don't expect you to use ISML, I do expect you to question what you
really want when you get ready to add new languages and tooling to
support YAML, TOML, PML, Markdown, Pollen Markup, Polymath or (and?!)
the [other ISMLs out
there](https://duckduckgo.com/?t=ffab&q=isml+markup&ia=web).  My ISML is
_tooling free_ because it's just annotated text. That's it! No
overengineering, no need to install anything, and you can whip up a
parser over lunch.

All you need is text, and a signal that some content is
structured. Everything else is added configuration and training, so
why not control that?

## The Supplemental Dialogue
### What if I want to escape the control character?
You can't. Pick a different character.

### What if I start an ISML document with a space?
Then your control character is a space.

### What if I think that's too sensitive?
Some languages need a semicolon after _every statement_. If you can't trust
yourself to not put a space at the front of a _document_, then I can't help you.

### What if I want to use a language other than Racket?
Then do that.

### What if I don't want to write a program just to parse my document?
Then you'll grab a well-adopted markup language and the libraries that
come with it. I'll bet you that you'll then write a bunch of
validation code in light of extra context that you didn't expect to
care about.

### What if I want everyone to write ISML documents that match a specific schema?
If you really mean "everyone", then you likely have the brain parasite
that makes you write another markup language that nobody needs.

If you mean a subset of people who consent to a document format, then
use your own reader procedure for the expressions after control characters.

### What if I want my team to use this?
They won't.
