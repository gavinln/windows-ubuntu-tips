# Nvim LSP keys

Created similar to LunarVim - lvim

## Goto

* gd - Goto Definition
* gD - Goto declaration
* gI - Goto Implementation
* gl - Show line diagnostics
* gr - Goto references
* gs - show signature help

## Lsp

* <Space>la - Code Action
* <Space>ld - Buffer Diagnostics
* <Space>lf - Format
* <Space>li - Info
* <Space>lj - Next Diagnostic
* <Space>lk - Prev Diagnostic
* <Space>ll - Codelens Action
* <Space>lq - Quickfix
* <Space>lr - Codelens Action
* <Space>ls - Document Symbols
* <Space>lS - Workspace Symbols
* <Space>lw - Diagnostics

## Nvim lsp functions

```
Try :lua vim.lsp.buf.<tab>
```

* add_workspace_folder
* clear_references
* code_action
* completion
* declaration
* definition
* document_highlight
* document_symbol
* execute_command
* format
* formatting
* hover
* implementation
* incoming_calls
* list_workspace_folders
* outgoing_calls
* range_code_action
* range_formatting
* references
* remove_workspace_folder
* rename
* server_ready
* signature_help
* type_definition
* workspace_symbol
