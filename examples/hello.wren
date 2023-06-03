// This is a comment.

/* This
   is
   a
   multi-line
   comment. */

/* This is /* a nested */ comment. */

System.print("Hello, world!")

class Wren {
  flyTo(city) {
	System.print("Flying to %(city)")
  }
}

var adjectives = Fiber.new {
  ["small", "clean", "fast"].each {|word| Fiber.yield(word) }
}

while (!adjectives.isDone) System.print(adjectives.call())
