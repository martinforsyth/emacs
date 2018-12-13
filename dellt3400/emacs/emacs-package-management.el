;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package management                                             ;;
;; Keep this early in the file as it may need to install packages ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; load emacs 24's package system. Add MELPA repository.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa"        . "http://melpa.org/packages/") t)
(package-initialize)

;; Decide which tags system to attempt to use
;; RG: This is here because I can not get rtags to run / run stably on Windows
(defvar bkb-have-rtags t "Whether we should try to use rtags for tags. If not t then use gtags.")

(if (string-equal "windows-nt" system-type)
    (setq bkb-have-rtags nil))

(defvar BKBExtraPackageList (list 'bm
																	'epl
                                  'pkg-info
                                  'let-alist
                                  's
                                  'dash
                                  'dash-functional
                                  'irony
                                  'irony-eldoc
                                  'company
                                  'company-irony
                                  'company-tern
                                  'flycheck
                                  'flycheck-color-mode-line
                                  'flycheck-irony
                                  'flycheck-pos-tip
                                  'popup
                                  'powerline
                                  'solarized-theme
                                  'tern
                                  'json-mode
                                  'diminish
                                  'yasnippet
																	'magit
																	'web-mode)
  "This is a list of all the extra packages that need to be installed")

;; (defvar BKBExtraPackageList (list 'epl
;;                                   'pkg-info
;;                                   'let-alist
;;                                   's
;;                                   'dash
;;                                   'dash-functional
;;                                   'psvn
;;                                   'irony
;;                                   'irony-eldoc
;;                                   'company
;;                                   'company-irony
;;                                   'company-tern
;;                                   'flycheck
;;                                   'flycheck-color-mode-line
;;                                   'flycheck-irony
;;                                   'flycheck-pos-tip
;;                                   'popup
;;                                   'powerline
;;                                   'solarized-theme
;;                                   'tern
;;                                   'json-mode
;;                                   'diminish
;;                                   'yasnippet
;;                                   'frame-cmds
;;                                   'hideshowvis)
;;   "This is a list of all the extra packages that need to be installed")

(if (equal bkb-have-rtags t)
    (add-to-list 'BKBExtraPackageList 'rtags)
  (add-to-list 'BKBExtraPackageList 'ggtags))

(defun bkb-check-packages ()
  "Checks if all needed packages are installed. Returns t if they are, otherwise nil"
  (interactive)

  (defvar all-installed t)
  
  (dolist (the-package BKBExtraPackageList)
    (progn
      ;;(message "Try %s" the-package)
      (if (not (package-installed-p the-package))
          (progn
            (setq all-installed nil)
            (message "Need to install  : %s" the-package))
        )
      ))
  all-installed
  )

(defun bkb-install-packages ()
  "Function to install the extra packages needed for our Emacs configuration"
  (interactive)

  (switch-to-buffer "*Messages*")
  (goto-char (point-max))
  (message "")
  (message "=== Refreshing available package list===")
  (package-refresh-contents)
  (message "=== Checking needed packages===")
  
  (dolist (the-package BKBExtraPackageList)
    (progn
      ;;(message "Try %s" the-package)
      (if (not (package-installed-p the-package))
          (progn
            (message "Need to install  : %s" the-package)
            (package-install the-package))
        (message "Already installed: %s" the-package))
      )
    )

  ;; Print final results
  (message "=== Final package status ===")
  (dolist (the-package BKBExtraPackageList)
    (progn
      (if (not (package-installed-p the-package))
          (message "** NOT installed ** : %s" the-package)
        (message "Installed OK        : %s" the-package))
      )
    )
  )

(if (not (bkb-check-packages))
    (bkb-install-packages))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End Package Management ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
