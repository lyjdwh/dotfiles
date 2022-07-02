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
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package quelpa-use-package)

(use-package which-key
  :config
  (setq which-key-idle-delay 0.4
        which-key-idle-secondary-delay 0.01
        )
  (which-key-mode))

(use-package counsel
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-h f") 'counsel-describe-function)
  (global-set-key (kbd "C-h v") 'counsel-describe-variable))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package awesome-tab
  :quelpa
  (awesome-tab :fetcher github :repo "manateelazycat/awesome-tab")
  :config
  (defun awesome-tab-project-name ()
    (let ((project-name
           (if (version< "29.0" emacs-version)
               (nth 2 (project-current))
             (cdr (project-current)))))
      (if project-name
          (format "Project: %s" (expand-file-name project-name))
        awesome-tab-common-group-name)))

  (setq awesome-tab-height 100)
  (awesome-tab-mode t))

(use-package all-the-icons)

(menu-bar-mode -1)

(use-package corfu
  :config
  (setq corfu-cycle t)
  (setq corfu-auto t)

  (setq corfu-auto-delay 0)
  (setq corfu-auto-prefix 1)

  (require 'corfu-info)
  (require 'corfu-history)

  (global-corfu-mode)
  (corfu-history-mode t)

  (define-key corfu-map (kbd "C-j") 'corfu-next)
  (define-key corfu-map (kbd "C-k") 'corfu-previous)
  )

(use-package corfu-doc
  :bind (:map corfu-map
              ("C-h" . corfu-doc-toggle))
  )

(use-package cape
  :config
  (add-to-list 'completion-at-point-functions #'cape-symbol)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(use-package copilot
  :quelpa (copilot :fetcher github :repo "zerolfx/copilot.el"
                   :files ("*.el" "dist"))
  :init
  ;; accept completion from copilot and fallback to company
  (defun my-tab ()
    (interactive)
    (or (copilot-accept-completion)
        (corfu-complete)))

  :hook (prog-mode . copilot-mode)
  :bind (:map evil-insert-state-map
              ("s-<tab>" . 'copilot-accept-completion)
              ("C-l" . 'copilot-accept-completion-by-word)
              ("C-S-l" . 'copilot-accept-completion-by-line)
              ("C-," . 'copilot-next-completion)
              ("C-." . 'copilot-previous-completion)
              :map corfu-map
              ("<tab>" . 'my-tab)
              ("TAB" . 'my-tab)
              ("C-l" . 'copilot-accept-completion-by-word)
              ("C-S-l" . 'copilot-accept-completion-by-line))
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package lsp-bridge
    :quelpa
    (lsp-bridge :fetcher github :repo "manateelazycat/lsp-bridge" :files ("*"))
    :config
    (setq lsp-bridge-hide-completion-characters '(":" ";" ")" "]" "}" ","))
    (setq lsp-bridge-enable-diagnostics t)
    (setq lsp-bridge-enable-candidate-doc-preview t)

    (require 'lsp-bridge-icon)
    (require 'lsp-bridge-orderless)

    ;; For Xref support
    (add-hook 'lsp-bridge-mode-hook (lambda ()
                                      (add-hook 'xref-backend-functions #'lsp-bridge-xref-backend nil t)))

    ;; ;; 通过Cape融合不同的补全后端，比如lsp-bridge、file、 dabbrev.
    (defun lsp-bridge-mix-multi-backends ()
      (setq-local completion-category-defaults nil)
      (setq-local completion-at-point-functions
                  (list
                   (cape-capf-buster
                    (cape-super-capf
                     #'lsp-bridge-capf
                     #'cape-file
                     #'cape-dabbrev
                     )
                    'equal)
                   )))

    (dolist (hook lsp-bridge-default-mode-hooks)
      (add-hook hook (lambda ()
                       (setq-local corfu-auto nil)
                       (lsp-bridge-mode 1)         ; 开启lsp-bridge
                       (lsp-bridge-mix-multi-backends) ; 通过Cape融合多个补全后端
                       )))

    (evil-define-key 'normal 'lsp-bridge-mode (kbd "gR") 'lsp-bridge-rename)
    (evil-define-key 'normal 'lsp-bridge-mode (kbd "gr") 'lsp-bridge-find-references)
    (evil-define-key 'normal 'lsp-bridge-mode (kbd "gi") 'lsp-bridge-find-impl)
    (evil-define-key 'normal 'lsp-bridge-mode (kbd "gd") 'lsp-bridge-find-def)
    (evil-define-key 'normal 'lsp-bridge-mode (kbd "gs") 'lsp-bridge-restart-process)
    (evil-define-key 'normal 'lsp-bridge-mode (kbd "gh") 'lsp-bridge-lookup-documentation)
    (evil-define-key 'normal 'lsp-bridge-mode (kbd "K") 'lsp-bridge-lookup-documentation)
  )
