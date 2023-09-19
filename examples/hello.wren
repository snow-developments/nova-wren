// This is a comment.

/* This
   is
   a
   multi-line
   comment. */

/* This is /* a nested */ comment. */

import "beverages" for Coffee, Tea

var foo = false
var bar = 7
var fizz = null // It's nothing!

System.print("Hello, world!")

class Wren {
  construct new() {}
  static with() {}

  // Getter
  name { _name }
  // Setter
  name=(value) { _name = value }

  foreign fetch()

  flyTo(city) {
    System.print("Flying to %(city)")
  }
}

var fn = Fn.new {|foo, bar|}

var adjectives = Fiber.new {
  ["small", "clean", "fast"].each {|word| Fiber.yield(word) }
}

while (!adjectives.isDone) System.print(adjectives.call())
