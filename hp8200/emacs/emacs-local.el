(load-file '"~/emacs/emacs-package-management.el")

;; setup files ending in “.php” to open in web-mode
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; setup files ending in “.js” and googlescripts ".gs" to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.gs\\'" . js2-mode))

;; START js2-refactor and xref-js2 setup
;; ref https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
													 (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
;; END js2-refactor and xref-js2 setup



(setq-default tab-width 2)

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max) nil)
		)
	)

(show-paren-mode 1)

(load-file '"~/emacs/emacs-local-keymaps.el")
