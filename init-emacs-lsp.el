;; init-emacs.el
;; emacs -Q -l init-emacs.el

;; basics
;; don't auto-save and back up files
(setq auto-save-default nil
      make-backup-files nil)

;; look and feel
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package quelpa-use-package)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package company
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :config
  (global-company-mode 1)
  (delq 'company-preview-if-just-one-frontend company-frontends)
  )

(use-package company-prescient
  :init
  (company-prescient-mode 1)
  :config
  (setq completion-ignore-case t)
  )

(use-package company-box
  :hook '(company-mode . company-box-mode)
  )

(use-package all-the-icons)

;; (use-package lspce
;;   :load-path "/home/liuyan/bin/lspce"
;;   :init
;;   (require 'lspce-module)
;;   :config (progn
;;             (setq lspce-send-changes-idle-time 1)

;;             ;; enable lspce in particular buffers
;;             ;; (add-hook 'rust-mode-hook 'lspce-mode)
;;             )
;;   )

(use-package eglot
  :hook ((prog-mode . (lambda ()
                        (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'makefile-mode)
                          (eglot-ensure)))))
  :config
  (setq eglot-stay-out-of '(flymake))
  (setq eglot-events-buffer-size 0)
  (setq eglot-ignored-server-capabilites nil)
  )

;; (use-package lsp-mode)

;; (use-package lsp-pyright
;;   :config
;;   (add-hook 'python-mode-hook (lambda ()
;;                                 (lsp)))
;;   )

(use-package copilot
  :quelpa (copilot :fetcher github :repo "zerolfx/copilot.el"
                   :files ("*.el" "dist"))
  :init
  ;; accept completion from copilot and fallback to company
  (defun my-tab ()
    (interactive)
    (or (copilot-accept-completion)
        (company-indent-or-complete-common nil)))

  :hook (prog-mode . copilot-mode)
  :bind (:map evil-insert-state-map
              ("s-<tab>" . 'copilot-accept-completion)
              ("C-l" . 'copilot-accept-completion-by-word)
              ("C-S-l" . 'copilot-accept-completion-by-line)
              ("C-," . 'copilot-next-completion)
              ("C-." . 'copilot-previous-completion)
              :map company-active-map
              ("<tab>" . 'my-tab)
              ("TAB" . 'my-tab)
              ("C-l" . 'copilot-accept-completion-by-word)
              ("C-S-l" . 'copilot-accept-completion-by-line))
  )
