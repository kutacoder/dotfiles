;;; init-modes.el --- Modes Setup file

;;; Commentary:
;; This file is responsible for setting up major
;; and minor modes for different source files.

;;; Code:

;; -*- coding: utf-8; lexical-binding: t; -*-

(setenv "TSSERVER_LOG_FILE" "C:/temp/tsserver.log")

(defun add-to-mode (mode lst)
  "Add LST of file extensions to major MODE."
  (dolist (file lst)
    (add-to-list 'auto-mode-alist
                 (cons file mode))))

(defvar lsp-prefer-flymake nil)

(defvar rust-format-on-save t)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(add-to-mode 'rust-mode (list "\\.rs\\'"))
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'cargo-minor-mode)

(add-to-mode 'js2-mode (list "\\.js\\'"))
(add-hook 'js2-mode-hook #'lsp)
(setq js2-mode-show-strict-warnings nil)

(add-to-mode 'typescript-mode (list "\\.ts\\'" "\\.d\\.ts\\'"))
(add-hook 'typescript-mode-hook #'lsp)

(add-to-mode 'json-mode (list "\\.json\\'"))

(add-to-mode 'php-mode (list "\\.php\\'"))

(add-to-mode 'yaml-mode (list "\\.yml\\'"))

(add-to-mode 'go-mode (list "\\.go\\'"))
(add-hook 'go-mode-hook #'lsp)

(add-to-mode 'web-mode (list "\\.html\\'" "\\.tsx\\'" "\\.jsx\\'" "\\.svelte\\'"))
(add-to-list 'lsp-disabled-clients '(web-mode . angular-ls))
(add-hook 'web-mode-hook #'lsp)

(setq-default typescript-indent-level 2)

(provide 'init-modes)

;;; init-modes.el ends here
