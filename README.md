# My personal config for Doom Emacs
These are my personal config files for [Doom Emacs](https://github.com/hlissner/doom-emacs).

## Prerequisites
In addition to the Doom Emacs requirements, this config uses the font [Iosevka Nova](https://github.com/janusvm/iosevka-nova/) by default.
However, this can be overridden via `local-config.el`, see below.

## Machine specific settings
While I would ideally have just one config that gives a consistent result across different computers, the reality is that some things (such as font size settings) end up requiring a little bit of machine specific tinkering for me.

This config allows for such settings by loading the (gitignored) file `local-config.el` after everything else, if it exists.
The contents of such a file might for example look like:

```elisp
;;; $DOOMDIR/local-config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Iosevka Nova" :size 32))
```

This would set the font size to 32 (rather than the default 18) for that specific machine only.
I use this on a computer with a high density display, as UI scaling just seems to slightly blur everything.
