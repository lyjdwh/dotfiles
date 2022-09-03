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

(use-package corfu
  :config
  (setq corfu-cycle t)
  (setq corfu-auto t)

  (setq corfu-auto-delay 0)
  (setq corfu-auto-prefix 1)
  (setq corfu-quit-at-boundary t)
  (setq corfu-quit-no-match t)
  (setq corfu-preview-current nil)
  (setq corfu-preselect-first t)
  (setq corfu-scroll-margin 5)

  (require 'corfu-info)
  (require 'corfu-history)

  (corfu-history-mode t)
  (global-corfu-mode)

  (define-key corfu-map (kbd "C-j") #'corfu-next)
  (define-key corfu-map (kbd "C-k") #'corfu-prev))

(use-package corfu-doc
  :after corfu
  :bind (:map corfu-map
              ("C-h" . corfu-doc-toggle)
              ("C-n" . corfu-doc-scroll-down)
              ("C-p" . corfu-doc-scroll-up)
              ))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default)
  (kind-icon-blend-background nil)
  (kind-icon-blend-frac 0.08)
  :config
  ; Enable `kind-icon'
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package orderless
  :init
  (defun my/orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))

  ;; configure the first word as flex filtered.
  (add-hook 'orderless-style-dispatchers #'my/orderless-dispatch-flex-first nil 'local)

  ;; Tune the global completion style settings to your liking!
  ;; This affects the minibuffer and non-lsp completion at point.
  (setq orderless-matching-styles '(orderless-initialism orderless-flex))
  (setq completion-styles '(orderless partial-completion basic)
        completion-category-defaults nil
        completion-category-overrides nil))

(use-package cape
  :init
  (defun lsp-trigger-chars ()
    (->> (lsp--server-capabilities)
         (lsp:server-capabilities-completion-provider?)
         (lsp:completion-options-trigger-characters?)))

  (defun cape-check-trigger (trigger-chars)
    (not (save-excursion
           (goto-char (or (car (bounds-of-thing-at-point 'symbol)) (point)))
           (and (lsp-completion--looking-back-trigger-characterp trigger-chars) t))))

  (defun trigger-char-p (sym)
    (let ((trigger-chars (lsp-trigger-chars)))
      (cape-check-trigger trigger-chars)))

  (defun yas-trigger-char-p (sym)
    (let ((trigger-chars (append (lsp-trigger-chars)
                                 '("\'" "\""))))
      (cape-check-trigger trigger-chars)))

  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless))

    ;; configure the cape-capf-buster.
    (setq-local completion-at-point-functions
                (list (cape-capf-buster
                       (cape-super-capf
                        (cape-capf-predicate #'cape-file #'trigger-char-p)
                        #'lsp-completion-at-point
                        (cape-capf-predicate #'cape-dabbrev #'trigger-char-p)
                        (cape-capf-predicate (cape-company-to-capf #'company-yasnippet) #'yas-trigger-char-p)
                        )
                       'equal
                       ))))

  :config
  (setq cape-dabbrev-min-length 3)
  (setq cape-dabbrev-check-other-buffers 'some)

  (add-to-list 'completion-at-point-functions #'cape-symbol)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(use-package yasnippet
  :config
  (add-to-list 'yas-snippet-dirs "~/.spacemacs.d/snippets")
  (yas-global-mode 1)
  )

(use-package lsp-pyright)
(use-package ccls)

(use-package lsp-mode
  :custom
  (lsp-completion-provider :none) ;; we use Corfu!
  (lsp-enable-file-watchers nil)
  :init
  (add-hook 'python-mode-hook #'lsp-deferred)
  (add-hook 'c++-mode-hook #'lsp-deferred)

  :hook
  (lsp-completion-mode . my/lsp-mode-setup-completion))

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
