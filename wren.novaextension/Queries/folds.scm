((stmt_block) @subtree (#set! role block))
((closure_block) @subtree (#set! role function))
((class_definition "{" @start) @end.after (#set! role type))
((method (stmt_block) @subtree) (#set! role type))
