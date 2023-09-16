; Query to name anonymous functions, e.g. `thing.update { null }`.
; This anonymous function is a parameter to the `update` function call.

; Receiving object of the function call
(function_call receiver: (_) @result)
; Name of the function this closure is being passed to
(function_call name: (identifier) @result (#prefix! @result "."))
