;;; packages.el --- figlet layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: mac07 <mac07@mac07s-iMac.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `figlet-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `figlet/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `figlet/pre-init-PACKAGE' and/or
;;   `figlet/post-init-PACKAGE' to customize the package as it is loaded.

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
                     (list (line-beginning-position) (line-beginning-position 2))))))
    :config (progn
              (spacemacs/declare-prefix "xf" "figlet")
              (spacemacs/declare-prefix "xfr" "region")
              (spacemacs/set-leader-keys
                "xff" 'figlet
                "xfc" 'figlet-comment
                "xfrc" 'figlet-figletify-region-comment
                "xfrr" 'figlet-figletify-region))))

;;; packages.el ends here
