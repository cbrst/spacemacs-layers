;;; packages.el --- figlet layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Christian Brassat <crshd@trashbukk.it>
;; URL: https://github.com/crshd/spacemacs-layers
;;
;; This file is not part of GNU Emacs.

;;; Code:

(defconst figlet-packages
  '(figlet))

(defun figlet/init-figlet ()
  (use-package figlet
    :defer t
    :init (progn
            (setq figlet-default-font figlet-font)

            (put 'figlet-figletify-region-comment 'interactive-form
                 '(interactive
                   (if (use-region-p)
                       (list (region-beginning) (region-end))
                     (list (line-beginning-position) (line-beginning-position 2)))))

            (put 'figlet-figletify-region 'interactive-form
                 '(interactive
                   (if (use-region-p)
                       (list (region-beginning) (region-end))
                     (list (line-beginning-position) (line-beginning-position 2))))))))

;;; packages.el ends here
