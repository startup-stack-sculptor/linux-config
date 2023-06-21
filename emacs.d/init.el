
;;; Commentary:
;;
;; B Emacs - A Fancy and Fast Emacs Configuration.
;;


;;; Code:

(global-display-line-numbers-mode 1)
(global-visual-line-mode 1)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-s") 'isearch-forward-thing-at-point)

;; stop creating backup files
(setq make-backup-files nil)

(setq auth-source-save-behavior 'verbose)

;;(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
;;(add-hook 'xref-backend-definitions #'dumb-jump-xref-activate)
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)


(setq inhibit-startup-message t
      visible-bell t
			gdscript-godot-executable "~/Desktop/Godot"
      package-archives '(
			 ("melpas" . "https://melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpastable" . "https://stable.melpa.org/packages/")
			 ("melpa"."http://melpa.org/packages/"))
      suggest-key-bindings t
      tab-width 2)

(require 'server)
(unless (server-running-p)
  (server-start))


(if (not (display-graphic-p))
    ;; This configuration will only be applied in a terminal session
    (progn
      ;; Bind the key sequence C-M-S-v to scroll down the other window
      (global-set-key (kbd "C-M-z") 'scroll-other-window-down)))


(electric-pair-mode)
(icomplete-mode)

(require 'ido)
(ido-mode t)

(load-theme 'tsdh-dark)

(require 'package)

(global-flycheck-mode)

(global-subword-mode)

(setq company-dabbrev-downcase nil)

;; Enable Evil
(require 'evil)
(evil-mode t)
(global-evil-surround-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(add-hook 'dart-mode-hook 'hs-minor-mode)
(add-hook 'dart-mode-hook 'highlight-parentheses-mode)
(add-hook 'scheme-mode-hook 'highlight-parentheses-mode)

(setq inferior-lisp-program "/usr/bin/sbcl")


;; Load path
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/lisp")

(add-to-list 'auto-mode-alist '("\\.script\\'" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.as\\'" . c-mode))
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
;; Packages
;; Preferences

;; Programming

;; use-package

;; company-mode
(global-company-mode)
(add-hook 'after-init-hook 'company-tng-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)  ;; Auto-start in all markup modes
(add-hook 'css-mode-hook 'emmet-mode)  ;; enable Emmet's css abbreviation.
(setq company-show-quick-access 'left)

(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(scala-mode cmake-mode evil-surround magit nim-mode svelte-mode graphql-mode protobuf-mode tuareg csharp-mode clojure-mode typescript-mode docker-tramp haxe-mode racket-mode geiser-gambit kotlin-mode zig-mode ggtags php-mode geiser-guile geiser-chez xref-js2 yaml-mode haskell-mode highlight-parentheses paredit geiser-chicken sudo-edit groovy-mode sly muse julia-mode lua-mode ess emmet-mode dart-mode flutter d-mode gdscript-mode company-go go-mode markdown-mode rust-mode rustic vterm restclient yasnippet-snippets eglot flycheck evil ##))
 '(tty-menu-open-use-tmm nil)
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Fixed SS13" :foundry "UKWN" :slant normal :weight normal :height 143 :width normal)))))
;;; init.el ends here

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(put 'narrow-to-region 'disabled nil)
