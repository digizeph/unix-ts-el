# unix-ts-el

Elisp package for handling unix timestamps in Emacs. 

## Installation

### General

`M-x load-file` and load the `unix-ts.el` file.

### Doom Emacs

Install the package (in your `packages.el` file):
```elisp
(package! unix-ts :recipe (:host github :repo "digizeph/unix-ts-el"))
```

Use the package (in your `config.el` file):
```elisp
(use-package! unix-ts)
```

## Functions

### `unix-ts-now`

Get current unix timestamp as integer and copy the value to clipboard.

### `unix-ts-to-str`

Conver unix timestamp (current position or provided interactively) to human-readable string
using RFC3339 format and copy the result to clipboard.

Example:
```
0 ===> 1970-01-01T00:00:00+0000
```

## Needs more functions?

Need more functions handling unix timestamp? Feel free to create an issue.
