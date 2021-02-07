# SuperMemoVim: Learning By Editing at the Speed of Thought

![logo](https://raw.githubusercontent.com/MasterHowToLearn/SuperMemoVim/master/images/supermemovim.png "logo")

Vim emulator customized for SuperMemo, the best learning software in the world. This is my implementation with some custom scripts for SuperMemo. For demo and accompanying article please see [SuperMemoVim: Learning By Editing at the Speed of Thought](https://www.masterhowtolearn.com/2020-05-05-supermemovim-learning-by-editing-at-the-speed-of-thought/).

This is a fork from [vim_ahk](https://github.com/rcmdnk/vim_ahk/releases). All credits go to the original developer and contributors. For details about what it could do before my SuperMemo layer is added, please visit the [original repo](https://github.com/rcmdnk/vim_ahk/).

## Release Note

2021-02:07: Version 0.0.2

- Added utility class [Clip.ahk](https://github.com/berban/Clip/blob/master/Clip.ahk) for more reliable clipboard functionality

- Removed many triggers that are probably useless other than for my own

- Prioritize mnemonics over key locations. See below documentation

2020-11:26: Version 0.0.1

- Initial release

## Installation

### Disclaimer

I've been using a variant of this SuperMemoVim for more than a year. Nothing bad has happened to my collection (thankfully). This program probably won't make your computer explode, and more importantly, mess up your collection. But I can't guarantee it and I recommend you automate your [collection backup strategy](https://www.masterhowtolearn.com/2019-05-11-hands-down-the-most-important-thing-in-using-supermemo).

1. Make sure you've installed [AutoHotKey](https://www.autohotkey.com/).

2. Click the green "Code" button above and download the zip.

3. Unzip it and open `SuperMemoVim.ahk` to use.

## Documentation

PS: The symbol `^` means the Control key

### Normal mode

```ahk
p:: WheelUp 2
n:: WheelDown 2
^d:: Auto-close *d*ismiss messages
^t: Open/Close Knowledge *T*ree
u:: Focus into SuperMemo's Topic component

; SuperMemo grading
a: 1
s: 2
d: 3
f: 4
g: 5
```

### Visual Mode

```ahk
c: *C*loze
e: *E*xtract
t: Highlighted *t*urned [...]
f: Remove *f*ormatting through SuperMemo Commander
```

### Command Mode

```ahk
r: Go to *r*ead point
s: *S*et current line as read point

a: Remove all text *a*fter cursor
b: Remove all text *b*efore cursor

h: Knowledge Tree: Up to parent
k: Knowledge Tree: Up one element
j: Knowledge Tree: Down one element
```

### Insert Mode

```ahk
^w:: remove left word
^e:: remove right word
^h:: remove left character
```

### Usage

To add triggers, the most important files are `lib\bind\vim_normal.ahk`, `lib\bind\vim_visual.ahk` and `lib\bind\vim_command.ahk`.

For example, the following trigger means pressing `1` in Normal mode will open notepad:

```ahk
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
1::
Run, notepad
return
```

Line 1: means this trigger will be activated in Normal mode

Line 2: the trigger. In this case it is the key 1

Line 3: ahk specific syntax. This opens up notepad. For more, please consult the [AutoHotkey doc](https://www.autohotkey.com/docs/AutoHotkey.htm)

Line 4: `return` means end of trigger

If your usual SuperMemo shortcuts don't work, please look into `disable_dangerous_sm_combo.ahk` and enable them back. For example, to enable back the default SuperMemo's `Alt h` that triggers the help menu, comment out the line `!h:: ; Help menu` by adding a `;` at the beginning of line, i.e., from `!h:: ; Help menu` to `; !h:: ; Help menu`.
