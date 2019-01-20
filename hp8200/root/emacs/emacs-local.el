(load-file '"~/emacs/emacs-package-management.el")

;; turn on smart-mode-line theme
;; (sml/setup)

;; add third party package/lisp directories
(setq load-path (cons "~/emacs/third-party-packages" load-path))

;; ;; add third party packages
;; (require 'hl-tags-mode)

;; (load "~/emacs/third-party-packages/hl-tags-mode.el")

;; setup files ending in “.php” to open in web-mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; setup files ending in “.js” to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; setup googlescripts files, ending in ".gs", to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.gs\\'" . js2-mode))

;;(add-hook 'php-mode-hook #'js2-refactor-mode)

(defun my-web-mode-hook ()
   (setq tab-width 2)
   (imenu-add-menubar-index)
   (setq web-mode-markup-indent-offset 2)

   ;; see https://github.com/xcwen/ac-php
   (require 'company-php)
   (company-mode t)
   (ac-php-core-eldoc-setup) ;; enable eldoc
   (make-local-variable 'company-backends)
   (add-to-list 'company-backends 'company-ac-php-backend)
             
   ;; (c-set-offset 'substatement-open 0)
   ;; (setq indent-tabs-mode nil)
   t)
(add-hook 'web-mode-hook 'my-web-mode-hook)

(defun my-php-mode-hook ()
   (setq tab-width 2)
   (imenu-add-menubar-index)

   ;; see https://github.com/xcwen/ac-php
   (require 'company-php)
   (company-mode t)
   (ac-php-core-eldoc-setup) ;; enable eldoc
   (make-local-variable 'company-backends)
   (add-to-list 'company-backends 'company-ac-php-backend)

   ;; (c-set-offset 'substatement-open 0)
   t)
(add-hook 'php-mode-hook 'my-php-mode-hook)

(defun my-js2-mode-hook ()
   (setq tab-width 2)
   (imenu-add-menubar-index)
   ;; (c-set-offset 'substatement-open 0)
   ;; (add-hook 'write-file-functions 'php-delete-trailing-blank-lines)
   t)
(add-hook 'js2-mode-hook 'my-js2-mode-hook)







;; START js2-refactor setup
;; ref https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
;; xref-js2 mentioned at that link doesn't seem to work. Well not painlessly at leas
(require 'js2-refactor)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

;; END js2-refactor setup


;; some global settings
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)  ;; indent with spaces, never tabs
(setq c-basic-offset 2)
(setq-default c-basic-offset 2)

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max) nil)
		)
	)

(show-paren-mode 1)
(load-file '"~/emacs/emacs-local-keymaps.el")
