;;; keybindings.el --- Figlet Layer Keybindings File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Christian Brassat <crshd@trashbukk.it>
;; URL: https://github.com/crshd/spacemacs-layers
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Variables
(spacemacs/declare-prefix "xf" "figlet")
(spacemacs/declare-prefix "xfr" "region")
(spacemacs/set-leader-keys
  "xff" 'figlet
  "xfc" 'figlet-comment
  "xfrc" 'figlet-figletify-region-comment
  "xfrr" 'figlet-figletify-region)

;; keybindings.el ends here
