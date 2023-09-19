; Imports
; TODO: Only set this role for relative imports, e.g. `./file`
(stmt_import module: (string_literal) @subtree (#set! role file))

; Declarations
(var_decl name: ((identifier) @name) @displayname @subtree
  ; If the variable is set to a `Fn.new` closure, assign this variable the `function` role
  (function_call
    receiver: (_) @receiver
    name: (identifier) @method
    (closure_block
      ("{" @_is_func) @start
      (closure_params)? @displayname
      "}" @end
    )
  )?
  (#set! role variable)
  (#set-if-eq! @_is_func "{" role function)
  (#set-if-not-eq! @receiver "Fn" role variable)
  (#set-if-not-eq! @method "new" role variable)
)

; Function Calls
; TODO: (#set! role argument) for function args

; Closures
; QUESTION: Add @subtree capture after `(closure_block)`?
; FIXME: This query does not to function. Remove it?
(function_call (closure_block "{" @start "}" @end)
  (#set! role closure)
  (#set! name.query "Names/ClosureFunctionCall.scm")
) @name.target
; QUESTION: Add @subtree capture after `(closure_block)`?
; FIXME: This query does not to function. Remove it?
(this_call name: (identifier) @name (closure_block "{" @start "}" @end)
  (#set! role closure)
  (#set! displayname.query "Names/ClosureThisCall.scm")
  (#prefix! @name "#")
) @displayname.target

; Classes
(class_definition name: (identifier) @name "{" @start "}" @end (#set! role class))

; TODO: (#set! role property) for class `_vars`.
; TODO: (#set! role static-property) for `static getter {}` getters.

; Methods
(method
  "static"? @_is_static "construct"? @_is_construct
  name: ((identifier) @name) @displayname
  ; Append parameter list to the display name
  (param_list ("="? @_is_setter) "(" @_is_method)? @displayname
  (stmt_block "{" @start "}" @end)
  ; Determine the role of this method
  (#set! role getter)
  ; The order of these checks matters, logically!
  (#set-if-eq! @_is_method "(" role method)
  (#set-if-eq! @_is_setter "=" role setter)
  (#set-if-eq! @_is_static "static" role static-method)
  (#set-if-eq! @_is_construct "construct" role constructor)
)
(foreign_method
  "static"? @_is_static "construct"? @_is_construct
  name: (((identifier) @name) @displayname) @subtree
  ; Append parameter list to the display name
  (param_list ("="? @_is_setter) "(" @_is_method)? @displayname
  ; Determine the role of this method
  (#set! role getter)
  ; The order of these checks matters, logically!
  (#set-if-eq! @_is_method "(" role method)
  (#set-if-eq! @_is_setter "=" role setter)
  (#set-if-eq! @_is_static "static" role static-method)
  (#set-if-eq! @_is_construct "construct" role constructor)
)
(foreign_method
  name: (((operator_method_name) @name) @displayname) @subtree
  (#set! role method)
  (#prefix! @displayname "Operator: ")
)
; Operator Overload
(method name: ((operator_method_name) @name) @displayname
  (stmt_block "{" @start "}" @end)
  (#set! role method)
  (#prefix! @displayname "Operator: ")
)
