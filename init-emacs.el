;; init-emacs.el
;; emacs -Q -l init-emacs.el

(setq package-enable-at-startup nil)
(setq package-archives
      '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")))

(package-initialize)

(require 'cl-lib)
(defvar my/packages '(use-package which-key counsel quelpa-use-package evil evil-collection
                       all-the-icons corfu cape unicode-escape orderless))

(defun my/packages-installed-p ()
  (cl-loop for pkg in my/packages
	    when (not (package-installed-p pkg)) do (cl-return nil)
	    finally (cl-return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
	  (package-install pkg))))

(require 'use-package)
(require 'quelpa-use-package)

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
    (let ((project-name (nth 2 (project-current))))
      (message project-name)
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

(use-package lsp-bridge
    :quelpa
    (lsp-bridge :fetcher github :repo "manateelazycat/lsp-bridge" :files ("*"))
    :config
    (setq lsp-bridge-completion-provider 'corfu)
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
                       (lsp-bridge-mode 1)         ; 开启lsp-bridge
                       (lsp-bridge-mix-multi-backends) ; 通过Cape融合多个补全后端
                       )))

    (define-key evil-motion-state-map "gR" #'lsp-bridge-rename)
    (define-key evil-motion-state-map "gr" #'lsp-bridge-find-references)
    (define-key evil-normal-state-map "gi" #'lsp-bridge-find-impl)
    (define-key evil-motion-state-map "gd" #'lsp-bridge-find-def)
    (define-key evil-motion-state-map "gs" #'lsp-bridge-restart-process)
    (define-key evil-normal-state-map "gh" #'lsp-bridge-lookup-documentation)
  )
