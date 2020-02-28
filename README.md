# Infuriatingly Subjective and Meaningless Markup Language

I present to you the stupidest markup language in the world, made with
nihilism.

I'll start with a 10-second tutorial, follow with a rant, and then a
series of "what if" questions I now anticipate after arguing with
invisible critics in the shower.

## The Required Specification
Ready? Go.

* UTF-8 only.
* The first character is the _control character_.
* Whatever follows a control character is for a program to read.
  Doesn't matter how it's read, except the program should
  know when the expression ends.
* The result of a parse is a list of strings with expressions.

Here's an ISML document.

```
^Hello ^(bold world)
```

Parsed using Racket's `read`, the parse tree is `'("Hello " (bold "world") "\n")`.

## The Optional Rant
I know what you are going to say. "This is trash. There are no
semantics, and you have to know what program should parse a specific
document." And you're right. If ISML were well-adopted, it would
create an ecosystem where everyone has their own format, parser and
validator. And even then, 10% of those would work well.

That would be damning criticism, if it weren't for the fact that the
world is _already like that right now._ Even well-adopted formats like
YAML has someone pasting base64 blobs into it, forcing their team to
write accomodating code. I know this because I've seen this. Even the
ubiquitous Markdown has been extended in enough ways to make the name
"Markdown" meaningless. I know this because I've [done exactly that](https://docs.racket-lang.org/polyglot-guide/Racket_in_Markdown.html). If you think I'm exaggerating, then tell me that
using [HTML6](http://www.html6.network/H%D0%A2ML/).

So while I don't expect you to use ISML, I do expect you to think what
you really want when you get ready to add new languages and tooling to
support YAML, TOML, PML, Markdown, Pollen Markup, Polymath or (and?!) some
other format.

If you are going to live in a world of disparate formats, then why not
use _only the rules you need_ to write annotated text? All you need
is text, and a signal that some content is structured. Everything
else is added configuration and training, so why not control that?

## The Supplemental Dialogue
### What if I want to escape the control character?
You can't. Pick a different character.

### What if I start an ISML document with a space?
Then your control character is a space.

### What if I think that's too sensitive?
Some languages need a semicolon after _every statement_. If you can't trust
yourself to not put a space at the front of a _document_, then that's
on you.

### What if I want to use a language other than Racket?
Then do that, and follow the rules above.

### What if I don't want to write a program just to parse my document?
Then you'll grab a well-adopted markup language and the libraries that
come with it. I'll bet you that you'll then write a bunch of
validation code in light of extra context that you didn't expect to
care about.

### What if I want everyone to write ISML documents that match a specific schema?
If you really mean "everyone", then you are likely infected with a
brain parasite and will one day write your own markup language.

If you mean a subset of people who consent to a document format, then
override the reader procedure to detect errors.

### What if I want my team to use this?
They won't.
