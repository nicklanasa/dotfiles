;; ---------------------------
;; Backup files
;; ---------------------------
(defvar ny/backups-dir (expand-file-name "backups/" user-emacs-directory)
  "Directory to store all Emacs backup files.")

(unless (file-exists-p ny/backups-dir)
  (make-directory ny/backups-dir t))

(setq backup-directory-alist `((".*" . ,ny/backups-dir))
      backup-by-copying t    ;; avoid symlink issues
      version-control t      ;; use numbered backups
      delete-old-versions t  ;; automatically delete old versions
      kept-new-versions 10
      kept-old-versions 2)

;; ---------------------------
;; Auto-save files
;; ---------------------------
(defvar ny/autosave-dir (expand-file-name "autosaves/" user-emacs-directory)
  "Directory to store all Emacs auto-save files.")

(unless (file-exists-p ny/autosave-dir)
  (make-directory ny/autosave-dir t))

(setq auto-save-file-name-transforms `((".*" ,ny/autosave-dir t)))

(provide 'editing)
