;; Frame transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; Font
(add-to-list 'default-frame-alist
             `(font . ,(format "%s-%d" "CaskaydiaMono Nerd Font Mono" 18)))

(provide 'appearance)
