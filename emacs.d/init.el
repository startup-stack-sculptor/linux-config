
;;; Commentary:
;;
;; B Emacs - A Fancy and Fast Emacs Configuration.
;;


;;; Code:

(global-display-line-numbers-mode 1)

(setq inhibit-startup-message t
      visible-bell t
      display-line-numbers 'relative
			gdscript-godot-executable "~/Desktop/Godot"
      package-archives '(
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa"."http://melpa.org/packages/"))
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
(evil-mode 1)

(require 'yasnippet)
(yas-global-mode 1)


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
(when (require 'dired-sync nil t)
   (define-key dired-mode-map (kbd "C-c S") 'dired-do-sync))

;; Sublime-like comments
(defun toggle-comment-on-line-or-region ()
  "Comments or uncomments the region or the current line if there is no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "M-/") 'toggle-comment-on-line-or-region)
;; Programming

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(helm-mode t)
 '(package-selected-packages
	 '(gdscript-mode company-go go-mode zig-mode markdown-mode rust-mode rustic vterm magit restclient yasnippet-snippets eglot omnisharp flycheck evil elpy ##))
 '(tab-bar-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Fixed SS13" :foundry "UKWN" :slant normal :weight normal :height 143 :width normal)))))
;;; init.el ends here

