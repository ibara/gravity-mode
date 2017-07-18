;;; gravity-mode.el --- Major-mode for Gravity lang. -*- lexical-binding: t -*-

;; Copyright (C) 2017 Brian Callahan

;; Authors: Brian Callahan <bcallah@openbsd.org>
;;
;; Version: 0.1
;; Package-Requires: ((emacs "25.2"))
;; Keywords: languages gravity
;; URL: https://github.com/ibara/gravity-mode

;; This file is not part of GNU Emacs.

;; Copyright (c) 2017 Brian Callahan <bcallah@openbsd.org>

;; Permission to use, copy, modify, and distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

;;; Commentary:

;; Major-mode for the Gravity programming language (http://gravity-lang.org/)

;; Source code for Gravity available at https://github.com/marcobambini/gravity

;;; Code:

(setq gravity-keywords '("System" "and" "associatedtype" "associativity"
			 "atexit" "break" "case" "catch" "class" "continue"
			 "convenience" "default" "defer" "deinit" "didSet" "do"
			 "dynamic" "else" "elseif" "extension" "fallthrough"
			 "fileprivate" "final" "for" "func" "_func" "get"
			 "guard" "if" "in" "indirect case" "indirect enum"
			 "infix" "init" "inout" "internal" "lazy" "let"
			 "mutating" "nil" "nonmutating" "not" "operator"
			 "optional" "or" "override" "postfix" "precedence"
			 "precedencegroup" "prefix" "private" "protocol"
			 "public" "repeat" "required" "rethrows" "return" "self"
			 "set" "static" "subscript" "super" "switch" "throw"
			 "throws" "try" "typealias" "unowned" "weak" "where"
			 "while" "willSet"))
(setq gravity-types '("Int" "Float" "true" "false" "null" "var"))
(setq gravity-constants '("@assignment" "@autoclosure" "@available"
			  "@convention" "@discardableResult" "@exported"
			  "@IBAction" "@IBDesignable" "@IBInspectable"
			  "@IBOutlet" "@noescape" "@nonobjc" "@noreturn"
			  "@NSApplicationMain" "@NSCopying" "@NSManaged" "@objc"
			  "@testable" "@UIApplicationMain"
			  "@warn_unused_result"))
(setq gravity-events '("__COLUMN__" "__FILE__" "__FUNCTION__" "__LINE__" "#if"
		       "#column" "#else" "#elseif" "#endif" "#file" "#function"
		       "#include" "#line" "#selector" "enum" "struct"))
(setq gravity-functions '("import" "is as" "main"))

(setq gravity-keywords-regexp (regexp-opt gravity-keywords 'words))
(setq gravity-types-regexp (regexp-opt gravity-types 'words))
(setq gravity-constants-regexp (regexp-opt gravity-constants 'words))
(setq gravity-events-regexp (regexp-opt gravity-events 'words))
(setq gravity-functions-regexp (regexp-opt gravity-functions 'words))

(setq gravity-font-lock-keywords
      `(
	(,gravity-keywords-regexp . font-lock-keyword-face)
	(,gravity-types-regexp . font-lock-type-face)
	(,gravity-constants-regexp . font-lock-constant-face)
	(,gravity-events-regexp . font-lock-builtin-face)
	(,gravity-functions-regexp . font-lock-function-name-face)))

;;;###autoload
(define-derived-mode gravity-mode c-mode "Gravity"
  "Major mode for editing Gravity code."

  (setq font-lock-defaults '((gravity-font-lock-keywords)))
  (modify-syntax-entry ?_ "w" gravity-mode-syntax-table)
  (modify-syntax-entry ?# "w" gravity-mode-syntax-table)
  (modify-syntax-entry ?@ "w" gravity-mode-syntax-table))

(setq gravity-keywords nil)
(setq gravity-types nil)
(setq gravity-constants nil)
(setq gravity-events nil)
(setq gravity-functions nil)

(setq gravity-keywords-regexp nil)
(setq gravity-types-regexp nil)
(setq gravity-constants-regexp nil)
(setq gravity-events-regexp nil)
(setq gravity-functions-regexp nil)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.gr\\'" . gravity-mode))
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.gravity\\'" . gravity-mode))

(provide 'gravity-mode)

;;; gravity-mode.el ends here
