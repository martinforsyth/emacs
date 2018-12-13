;; load customisations, then off load all to emacs-local.el
(setq custom-file "~/emacs/emacs-customizations.el")
(load-file "~/emacs/emacs-customizations.el")
(load-file '"~/emacs/emacs-local.el")
