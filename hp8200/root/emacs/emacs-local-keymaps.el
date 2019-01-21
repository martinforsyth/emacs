;; ===========================
;; key mappings
;; ===========================
;; Remember that a number of bindings are already 'taken' in
;; k6/emacs/.emacs:(defun our-cmode-hook ()
;;(global-set-key [?\C-\M-z] 'tv-get-mod)
(global-set-key [C-kp-up] 'line-to-top-of-window)
(global-set-key [f1] 'undo) ;; previously toggle-read-only
;;(global-set-key [f2] 't2s) ;; previously ff-find-other-file
;;(global-set-key [(f3)] (lambda () (interactive) (manual-entry (current-word))));; get man page for the library call at the current cursor position.
;;(global-set-key [f4] ' bkb-my-nice-toggle-framewidth)
(global-set-key (kbd "<C-M-insert>") 'bm-toggle)
(global-set-key (kbd "<C-M-delete>") 'bm-remove-all)
(global-set-key (kbd "<C-M-next>")   'bm-next)
(global-set-key (kbd "<C-M-prior>") 'bm-previous)
;;(global-set-key [?\C-c ?\C-c] 'comment-region)
(global-set-key [?\C-c ?c] 'comment-region)
;;(global-set-key (kbd "C-g") 'my-keybord-quit)

;;(global-set-key (C-c <C-up>) 'mf-scroll-up)
;;(global-set-key (C-c <C-down>) 'mf-scroll-down)

;;(global-set-key [?\M-.] 'find-tag)
;;(global-set-key [?\M-*] 'pop-tag-mark)
;;(global-set-key [f7] 'cscope-find-functions-calling-this-function)
;;(global-set-key [M-backspace] 'backward-kill-word)

(global-set-key (kbd "C-c a") 'apropos)
;;(global-set-key [?\C-c ?A] 'bkb-insert-wiki-analysis-headings)
;;(global-set-key [?\C-c ?c] 'command-history)
(global-set-key [?\C-c ?E] 'ediff-revision)
(global-set-key [?\C-c ?e] 'vc-version-ediff)

(global-set-key [?\C-c ?f] 'find-name-dired)
;;(global-set-key [?\C-c ?f] 'uchar-string-literal-format);; temp

;;(global-set-key [?\C-c ?g] 'bkb-trace-goto-source)
(global-set-key [?\C-c ?h] 'hexl-find-file)
;;(global-set-key [?\C-c ?m] 'bkb-insert-c-code-main)
;;(global-set-key [?\C-c ?M] 'bkb-insert-makefile-simple)
;;(global-set-key [?\C-c ?n] 'tv-forward-mod)
(global-set-key [?\C-c ?o] 'occur)
;;(global-set-key [?\C-c ?p] 'tv-backward-mod)
(global-set-key [?\C-c ?r] 'rgrep)
;;(global-set-key [?\C-c ?R] 'remember)
;;(global-set-key [?\C-c ?T] 'bkb-tidy-frames)
(global-set-key [?\C-c ?I] 'info-apropos)
(global-set-key [?\C-c ?i] 'imenu-add-menubar-index)
;;(global-set-key [?\C-c ?l] 'bkb-insert-trace)
;;(global-set-key [?\C-c ?8] 'goto-line-over-80-chars)
(global-set-key [?\C-c ?u] 'my-untabify)
(global-set-key [?\C-c ?v] 'apropos-variable)
;;(global-set-key [?\C-c ?x] 'bkb-compile-and-run)
;;(global-set-key [?\C-c ?C] 'bkb-compile-and-run)

;; keep exuberant ctags available for finding defs - at least until rtags is working nicely
;;(global-set-key [?\C-c ?\M-.] 'find-tag)  ;; find-tag obsolete - use xref-find-definition
;;(global-set-key [?\C-c ?\M-\[] 'pop-tag-mark)


(global-set-key [?\C-c ?T] 'indent-buffer)
