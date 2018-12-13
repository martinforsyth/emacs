(load-file '"~/emacs/emacs-package-management.el")

;; setup files ending in “.php” to open in web-mode
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

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
