;;; packages.el --- smarttab layer packages file for Spacemacs.
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
;; added to `smarttab-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `smarttab/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `smarttab/pre-init-PACKAGE' and/or
;;   `smarttab/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst smarttab-packages
  '(smart-tabs-mode)
  "The list of Lisp packages required by the smarttab layer.")

(defun smarttab/init-smart-tabs-mode ()
  "Initialize smart-tabs-mode"
  (use-package smart-tabs-mode
    :config (progn
              ;; C
              (when (configuration-layer/package-usedp 'cc-mode)
                (smart-tabs-insinuate 'c)
                (smart-tabs-advice c-indent-line c-basic-offset)
                (smart-tabs-advice c-indent-region c-basic-offset)
                (add-hook 'c-mode-hook (lambda () (setq indent-tabs-mode t))))

              ;; Javascript
              (when (configuration-layer/package-usedp 'js2-mode)
                (smart-tabs-insinuate 'javascript)
                (smart-tabs-advice js2-indent-line js2-basic-offset)
                (add-hook 'js2-mode-hook (lambda () (setq indent-tabs-mode t))))

              ;; Ruby
              (when (or (configuration-layer/package-usedp 'ruby-mode)
                        (configuration-layer/package-usedp 'enh-ruby-mode))
                (smart-tabs-insinuate 'ruby)
                (smart-tabs-advice ruby-indent-line ruby-indent-level)
                (setq ruby-indent-tabs-mode t)
                (add-hook 'ruby-mode-hook (lambda () (setq indent-line-function 'ruby-indent-line)))))))

;;; packages.el ends here
