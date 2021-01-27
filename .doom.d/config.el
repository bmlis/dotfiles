;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Bart Lisiecki"
      user-mail-address "b.m.lisiecki@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-horizon)
(setq doom-one-brighter-modeline t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(global-set-key (kbd "C-s") 'swiper)

;; 15Five settings
(dir-locals-set-class-variables '15five-directory
                                '((python-mode . ((flycheck-disabled-checkers . (python-mypy
                                                                                 python-pylint))))))
(setq lsp-log-io t)

(defun setup-flake-hook ()
  (flycheck-add-next-checker 'lsp 'python-flake8))

;; (add-hook 'lsp-after-initialize-hook 'setup-flake-hook)
(add-hook 'lsp-after-open-hook 'setup-flake-hook)

;; These MODE-local-vars-hook hooks are a Doom thing. They're executed after
;; MODE-hook, on hack-local-variables-hook. Although `lsp!` is attached to
;; python-mode-local-vars-hook, it should occur earlier than my-flycheck-setup
;; this way:
;; (add-hook 'python-mode-local-vars-hook #'my-flycheck-setup)

(dir-locals-set-directory-class
  "/Users/h3ra/Workspace/15five/fifteen5/" '15five-directory)


;; Configure imports for python
(add-hook 'before-save-hook 'py-isort-before-save)
(add-hook 'before-save-hook 'pyimport-remove-unused)

(after! python
  (set-company-backend! 'python-mode 'company-anaconda))

;; Setup freaking tsx
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; Here are some additional functions/macros that could help you configure Doom:
(setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
