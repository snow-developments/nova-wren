; Imports
; TODO: (#set! role file) for `import "./file" for X`
(stmt_import module: (string_literal) (#set! role file))

; Declarations
(var_decl name: (identifier) @name (#set! role variable))

; Function Calls
; TODO: (#set! role argument) for function args

; Closures
; QUESTION: Add @subtree capture after `(closure_block)`?
(function_call (closure_block)
  (#set! role closure)
  (#set! name.query "Names/ClosureFunctionCall.scm")
) @name.target
; QUESTION: Add @subtree capture after `(closure_block)`?
(this_call name: (identifier) @name (closure_block)
  (#set! role closure)
  (#set! displayname.query "Names/ClosureThisCall.scm")
  (#prefix! @name "#")
) @displayname.target

; Classes
(class_definition name: (identifier) @name (#set! role class))

; TODO: (#set! role property) for class `_vars`.
; TODO: (#set! role static-property) for `static getter {}` getters.
; TODO: (#set! role getter) for class `getter {}`.
; TODO: (#set! role setter) for class `setter=(v)`.

; Methods
(method name: (identifier) @name (#set! role method))
(method name: ((operator_method_name) @name) @displayname (#set! role method) (#prefix! @displayname "Operator: "))
(foreign_method name: (identifier) @name (#set! role method))
(foreign_method name: ((operator_method_name) @name) @displayname (#set! role method) (#prefix! @displayname "Operator: "))

; TODO: (#set! role static-method) for `static method()` methods.
; TODO: (#set! role constructor) for `construct new()` constructors.
