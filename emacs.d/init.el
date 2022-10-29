
;;; Commentary:
;;
;; B Emacs - A Fancy and Fast Emacs Configuration.
;;


;;; Code:

(global-display-line-numbers-mode 1)
(global-visual-line-mode 1)

(setq inhibit-startup-message t
      visible-bell t
      display-line-numbers 'relative
			gdscript-godot-executable "~/Desktop/Godot"
      package-archives '(
			 ("melpas" . "https://melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpastable" . "https://stable.melpa.org/packages/")
			 ("melpa"."http://melpa.org/packages/"))
      suggest-key-bindings t
      tab-width 2)


(electric-pair-mode)
(icomplete-mode)

(require 'ido)
(ido-mode t)

(load-theme 'tsdh-dark)

(require 'package)

(global-flycheck-mode)

;; Enable Evil
(require 'evil)
(evil-mode t)

(require 'yasnippet)
(yas-global-mode 1)

(setq inferior-lisp-program "/usr/bin/sbcl")


;; Load path
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/lisp")

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(sly muse julia-mode lua-mode ess emmet-mode use-package dart-mode flutter d-mode gdscript-mode company-go go-mode markdown-mode rust-mode rustic vterm magit restclient yasnippet-snippets eglot flycheck evil ##))
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Fixed SS13" :foundry "UKWN" :slant normal :weight normal :height 143 :width normal)))))
;;; init.el ends here

