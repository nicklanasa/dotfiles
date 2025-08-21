;; Frame transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; Font
(add-to-list 'default-frame-alist
             `(font . ,(format "%s-%d" "CaskaydiaMono Nerd Font Mono" 18)))

;; Theme auto-switching
(defun ny/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'solarized-light t))
    ('dark  (load-theme 'solarized-dark t))))

(add-hook 'ns-system-appearance-change-functions #'ny/apply-theme)

;; Load solarized theme initially
(use-package solarized-theme :ensure t)
(load-theme 'solarized-dark t)

(provide 'appearance)
