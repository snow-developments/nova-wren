; Blocks
((stmt_block "{" @start "}" @end) (#set! role block))
; Functions
((closure_block "{" @start "}" @end) (#set! role function))
; Classes
((class_definition "{" @start "}" @end) (#set! role type))
; Methods
((method (stmt_block "{" @start "}" @end)) (#set! role function))
