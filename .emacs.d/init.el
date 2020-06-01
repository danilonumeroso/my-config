;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/") ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

;; Define packages I will be using
(defvar my_packages
  '(tide
    elpy
    company
    atom-dark-theme
    solarized-theme
    irony
    counsel
    )
  )

;; Install packages defined in 'my_packages'
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
            (package-install package))) my_packages)

;; Emacs backup dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; ===================================
;; section: UI
;; ===================================

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; mode line customization
(load "~/.emacs.d/custom/sml/init.el")

(load-theme 'atom-one-dark t) ;; Load default theme
;; (load-theme 'solarized-gruvbox-dark t) ;; Load default theme

(fset 'yes-or-no-p 'y-or-n-p)

(global-display-line-numbers-mode) ;; Show line numbers

;; ===================================
;; section: ALIASES & KEYBINDS
;; ===================================

(defalias 'autocomplete 'company-complete)

(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c TAB") 'company-complete)

;; ===================================
;; section: DEVELOPMENT
;; ===================================

;; General Settings

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil) ;; Do not use tab

;; Language-specific Settings

(load "~/.emacs.d/custom/lang/ts.el") ;; Typescript/Javascript
(load "~/.emacs.d/custom/lang/py.el") ;; Python
(load "~/.emacs.d/custom/lang/cc.el") ;; C/C++

;; ===================================
;; section: AUTO-GENERATED
;; ===================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1e9001d2f6ffb095eafd9514b4d5974b720b275143fbc89ea046495a99c940b0" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (smart-mode-line-atom-one-dark-theme powerline smart-mode-line tide solarized-theme rust-mode material-theme magit fontawesome elpy dracula-theme counsel company-irony clues-theme bubbleberry-theme blackboard-theme atom-one-dark-theme atom-dark-theme arjen-grey-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
