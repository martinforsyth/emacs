(load-file '"~/emacs/emacs-package-management.el")

;; turn on smart-mode-line theme
;; (sml/setup)

;; add third party package/lisp directories
(setq load-path (cons "~/emacs/third-party-packages" load-path))

;; ;; add third party packages
;; (require 'hl-tags-mode)

;; (load "~/emacs/third-party-packages/hl-tags-mode.el")

;; https://github.com/fgallina/multi-web-mode
(require 'multi-web-mode)
;;(setq mweb-default-major-mode 'html-mode)
(setq mweb-default-major-mode 'web-mode)
(setq mweb-tags '(
                  (php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")
                  )
      )
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;; setup files ending in “.php” to open in web-mode
;;(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; setup files ending in “.js” to open in js2-mode
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; setup googlescripts files, ending in ".gs", to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.gs\\'" . js2-mode))

;;(add-hook 'php-mode-hook #'js2-refactor-mode)

;; web-mode possibly redundant now i'm exploring multi-web-mode
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
             
   ;; https://github.com/xcwen/ac-php/blob/master/README.md
   ;; Etags doesn't find definition of symbol such as WPINC, but
   ;; ac-php-find-symbol-at-point does.
   ;;
   ;; So, when etags doesn't work, provide similar keys for similar
   ;; functionality from ac-php ...
   (local-set-key (kbd "C-.") 'ac-php-find-symbol-at-point)  ;like M-. for xref-find-definitions
   (local-set-key (kbd "C-,") 'ac-php-location-stack-back)   ;like M-, for xref-pop-marker-stack
   ;;(local-set-key (kbd "C-<f1>") 'my-php-symbol-lookup-on-web)
   (local-set-key (kbd "C-<f1>") 'my-html-symbol-lookup-on-web)  


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
   (hs-minor-mode 1) ;; for folding

   ;; https://github.com/xcwen/ac-php/blob/master/README.md
   ;; Etags doesn't find definition of symbol such as WPINC, but
   ;; ac-php-find-symbol-at-point does.
   ;;
   ;; So, when etags doesn't work, provide similar keys for similar
   ;; functionality from ac-php ...
   (local-set-key (kbd "C-.") 'ac-php-find-symbol-at-point)  ;like M-. for xref-find-definitions
   (local-set-key (kbd "C-,") 'ac-php-location-stack-back)   ;like M-, for xref-pop-marker-stack
   ;; (local-set-key (kbd "C-<f1>") 'my-php-symbol-lookup-on-web)  ;; function already exists in php-mode, see below

   ;; rebind keys so that case fold is same in web-mode and php-mode, namely C-c C-f
   (local-set-key (kbd "C-<f1>")  'php-search-documentation)  
   (local-set-key (kbd "C-c C-f") 'hs-toggle-hiding)  

   ;; (c-set-offset 'substatement-open 0)
   (hs-minor-mode 1)
   t)
(add-hook 'php-mode-hook 'my-php-mode-hook)

(defun my-js2-mode-hook ()
   (setq tab-width 2)
   (imenu-add-menubar-index)
   ;; (c-set-offset 'substatement-open 0)
   ;; (add-hook 'write-file-functions 'php-delete-trailing-blank-lines)
   t)
(add-hook 'js2-mode-hook 'my-js2-mode-hook)

(defun my-html-mode-hook ()
   (local-set-key (kbd "C-<f1>") 'my-html-symbol-lookup-on-web)  
  )
(add-hook 'html-mode-hook 'my-html-mode-hook)






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

;; lookup standard php functions on web - from ...
;; https://www.emacswiki.org/emacs/LookUpHTMLDoc
;; and ...
;; https://www.emacswiki.org/emacs/PhpMode#toc13
(defun my-php-symbol-lookup-on-web ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")
      
      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))


;; lookup standard html tags on web - from ...
(defun my-html-symbol-lookup-on-web ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")
      
      (browse-url (concat "https://www.w3schools.com/tags/tag_" (symbol-name symbol) ".asp")))))

;; full path to file in frame title
;; https://stackoverflow.com/questions/29816326/how-to-show-path-to-file-in-the-emacs-mode-line
(setq frame-title-format
      '(buffer-file-name "%b - %f" ; File buffer
                         (dired-directory dired-directory ; Dired buffer
                                          (revert-buffer-function "%b" ; Buffer Menu
                                                                  ("%b - Dir: " default-directory))))) ; Plain buffer


(load-file '"~/emacs/emacs-local-keymaps.el")
