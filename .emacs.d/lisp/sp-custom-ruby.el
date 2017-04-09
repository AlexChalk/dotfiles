(dolist (pair '("def"
		"do"
		"begin"
		"class"
		"module"
		"case"
		"if"
		"for"
		"while"
		"until"
		"unless"))
  (sp-local-pair 'ruby-mode pair nil :actions :rem))
