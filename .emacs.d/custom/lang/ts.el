;; Typescript mode
(defun setup-tide-mode ()
  (interactive)
  (setq typescript-indent-level 4)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled))
  (flycheck-mode 1)
  (eldoc-mode 1)
  (tide-hl-identifier-mode 1)
  (set-local-company-backends-for-typescript)
  (company-mode 1)
  (setq company-idle-delay 0)
  (hs-minor-mode 1))

(defun set-local-company-backends-for-typescript ()
  (interactive)
  (setq-local company-backends
              '((company-tide :separate company-dabbrev company-keywords))))

(setq company-tooltip-align-annotations t) ;; aligns annotation to the right hand side

;; custom keybindings
(add-hook
 'typescript-mode-hook
 '(lambda ()
    (local-set-key (kbd "C-<tab>") 'yas-expand)
    (local-set-key (kbd "C-c C-r") 'tide-rename-symbol)
    (local-set-key (kbd "C-c C-o") 'hs-toggle-hiding)
    ))

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook 'setup-tide-mode)

;; Javascript Mode
(add-hook 'js-mode-hook #'setup-tide-mode)
