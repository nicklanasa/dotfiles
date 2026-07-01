;;; ny-vterm.el --- Local vterm helpers -*- lexical-binding: t; -*-

(defvar ny/vterm-theme-color-snapshot nil
  "Last known vterm color snapshot.")

(defvar ny/vterm-theme-colors-before-change nil
  "Vterm color snapshot from before the current theme change.")

(defun ny/vterm-theme-color-snapshot ()
  "Return the vterm colors that are embedded into rendered cells."
  (when (fboundp 'vterm--get-color)
    (let (colors)
      (push (cons 'default-foreground
                  (vterm--get-color -1 :foreground))
            colors)
      (push (cons 'default-background
                  (vterm--get-color -1))
            colors)
      (dotimes (index 16)
        (push (cons (list index :foreground)
                    (vterm--get-color index :foreground))
              colors)
        (push (cons (list index :background)
                    (vterm--get-color index))
              colors))
      colors)))

(defun ny/capture-vterm-theme-colors (&rest _)
  "Remember the current vterm colors before a theme changes them."
  (unless ny/vterm-theme-colors-before-change
    (setq ny/vterm-theme-colors-before-change
          (or ny/vterm-theme-color-snapshot
              (ny/vterm-theme-color-snapshot)))))

(defun ny/vterm-theme-color-map (old-colors new-colors)
  "Build a hash table mapping OLD-COLORS to NEW-COLORS."
  (let ((color-map (make-hash-table :test #'equal)))
    (dolist (old old-colors)
      (let ((old-color (cdr old))
            (new-color (cdr (assoc (car old) new-colors))))
        (when (and (stringp old-color)
                   (stringp new-color)
                   (not (equal old-color new-color)))
          (puthash old-color new-color color-map)
          (puthash (downcase old-color) new-color color-map))))
    color-map))

(defun ny/recolor-vterm-face-property (face color-map)
  "Return FACE with embedded colors replaced through COLOR-MAP."
  (cond
   ((and (consp face)
         (keywordp (car face)))
    (let ((copy (copy-sequence face))
          tail)
      (setq tail copy)
      (while tail
        (when (and (memq (car tail) '(:foreground :background))
                   (stringp (cadr tail)))
          (let ((new-color (or (gethash (cadr tail) color-map)
                               (gethash (downcase (cadr tail))
                                        color-map))))
            (when new-color
              (setcar (cdr tail) new-color))))
        (setq tail (cddr tail)))
      copy))
   ((consp face)
    (mapcar (lambda (item)
              (ny/recolor-vterm-face-property item color-map))
            face))
   (t face)))

(defun ny/recolor-vterm-buffer-after-theme-change (buffer color-map)
  "Replace old vterm colors in BUFFER using COLOR-MAP."
  (when (buffer-live-p buffer)
    (with-current-buffer buffer
      (when (eq major-mode 'vterm-mode)
        (let ((inhibit-read-only t)
              (position (point-min)))
          (while (< position (point-max))
            (let* ((next (next-single-property-change
                          position 'font-lock-face nil (point-max)))
                   (face (get-text-property position 'font-lock-face))
                   (new-face (ny/recolor-vterm-face-property
                              face color-map)))
              (unless (equal face new-face)
                (put-text-property position next
                                   'font-lock-face new-face))
              (setq position next)))
          (force-window-update buffer))))))

(defun ny/recolor-vterm-buffers-after-theme-change (&rest _)
  "Update live vterm buffers after a theme is enabled."
  (run-at-time
   0 nil
   (lambda ()
     (let* ((old-colors ny/vterm-theme-colors-before-change)
            (new-colors (ny/vterm-theme-color-snapshot))
            (color-map (ny/vterm-theme-color-map old-colors new-colors)))
       (when old-colors
         (dolist (buffer (buffer-list))
           (ny/recolor-vterm-buffer-after-theme-change buffer color-map)))
       (setq ny/vterm-theme-color-snapshot new-colors
             ny/vterm-theme-colors-before-change nil)))))

(defun ny/setup-vterm-theme-recoloring ()
  "Keep existing vterm buffers readable after theme changes."
  (advice-add #'disable-theme :before #'ny/capture-vterm-theme-colors)
  (advice-add #'load-theme :before #'ny/capture-vterm-theme-colors)
  (when (boundp 'enable-theme-functions)
    (add-hook 'enable-theme-functions
              #'ny/recolor-vterm-buffers-after-theme-change))
  (ny/capture-vterm-theme-colors))

(provide 'ny-vterm)
;;; ny-vterm.el ends here
