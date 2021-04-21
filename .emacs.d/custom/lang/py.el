;; Python Mode

(add-hook 'python-mode-hook
     (lambda ()
        (setq tab-width 2)))

(elpy-enable)

(setq elpy-rpc-virtualenv-path 'current)
