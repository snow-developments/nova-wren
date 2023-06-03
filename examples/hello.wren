// This is a comment.

/* This
   is
   a
   multi-line
   comment. */

/* This is /* a nested */ comment. */

var foo = false;
var bar = 7;
var fizz = null;

System.print("Hello, world!")

class Wren {
  _field

  flyTo(city) {
	System.print("Flying to %(city)")
  }
}

var adjectives = Fiber.new {
  ["small", "clean", "fast"].each {|word| Fiber.yield(word) }
}

while (!adjectives.isDone) System.print(adjectives.call())
