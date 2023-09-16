; Query to name anonymous functions, e.g. `this.update { null }`.
; This anonymous function is a parameter to the `update` function call.

; Receiving object of the function call, i.e. the class `this` references
(class_definition name: (identifier) @result)
; Name of the function this closure is being passed to
(this_call name: (identifier) @result (#prefix! @result "."))
