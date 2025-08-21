;; Add MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)

;; Paredit
(use-package paredit :ensure t)
(use-package org-roam :ensure t)
(use-package magit :ensure t)

(provide 'packages)
