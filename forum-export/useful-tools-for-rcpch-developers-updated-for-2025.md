## Launcher
A launcher allows you to pop up a text box using a predefined keyboard shortcut (for me, using Albert on Linux, it is <kbd>Ctrl</kbd> + <kbd>Space</kbd>) and then **type the thing you want to open** - it can be a bookmark, a file, or an application, and it will just start. Saves a lot of mousing and finding things in Start menus.
* Albert Launcher (Linux only) https://albertlauncher.github.io/
* List of Linux launchers, some of which are cross-platform and available on Win/Mac. https://marcus-baw.medium.com/theres-no-such-thing-as-a-free-launch-or-maybe-there-is-launchers-on-linux-in-2017-2f1bad929403
* Alfred Launcher (MacOS only) https://www.alfredapp.com/

## [CopyQ Clipboard Manager](https://hluk.github.io/CopyQ/)
* CopyQ is a cross platform clipboard manager which allows you to save your clipboard history, with a configurable number of entires to retain. It can be disabled temporarily for security reasons (eg. if you were copy/pasting credentials, passwords, or credit card numbers). Saves a huge amount of time when repeatedly copy-pasting the same content. Frequent clips can be saved and organised by Tab or Tag.
* It can also be used to set up global hotkey actions which can run any command you want, written in something a little like JavaScript. Some example commands you can install in CopyQ:
[ctrl+1 => paste email address.ini|attachment](upload://bPCCjJjIw5jQiETORl2c0uLyPLU.ini) (316 Bytes)
[ctrl+8 => paste current datetime (alternative format).ini|attachment](upload://4zAzjofE0iHaW41d1agzjjDzuM2.ini) (340 Bytes)
[alt+- => slugify-text.ini|attachment](upload://mp9J0KvAn1G3EVkcSjzg9f4a13p.ini) (455 Bytes)


## [CLUT for Tab switching](https://chrome.google.com/webstore/detail/clut-cycle-last-used-)
* CLUT (Cycle Last Used Tabs) is a Chrome browser extension which allows you to use <kbd>Alt</kbd> + <kbd>S</kbd> to 'tab' between recently used Chrome tabs, saving a lot of time when switching back and forth between multiple tabs. Shortcuts are configurable. 

## [Zsh](https://www.zsh.org/) and [Oh-my-Zsh](https://ohmyz.sh/)
If you spend a lot of time in the CLI then I recommend the shell [Zsh](https://www.zsh.org/), which has a few nice tab-completion features that make it faster and more usable, and a companion project [Oh-my-Zsh](https://ohmyz.sh/) which includes easily customisable and very pretty shell prompts, and plugins for git, ruby, docker, and many others that essentially give you lots of aliases (but *the same aliases as everyone else uses*, so there is at least a thought process/pattern behind it, and a consistency)

## `wd` (Warp Drive)
`wd` is a customisable 'jump to directory X' tool which is part of Oh-my-Zsh. When in a directory you can type `wd add [optional alias]` and it will add the current directory name and path to the list in `.warprc`. After that you can type `wd alias` and it will take you there instantly. Replaces endless `cd ../../../../../../somedirectory` type of thing.

<div data-theme-toc="true"> </div>