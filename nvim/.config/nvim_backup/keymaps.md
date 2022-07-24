# NeoVim Keymaps

## Keymap Information / Features
> I currently use the *Corsair K65 RGB Mini* and I have the arrow keys remapped to *FN+W* *FN+A* *FN+S* *FN+D* respectively. Due to this and the fact that I've been gaming on PC most of my life, it is easier to use those keys to navigate in most circumstances. 

## Leader
> Leader Key

| Key           | Action                    | Notes         |
| --------      | --------                  | --------      |
|`SPACE`        | Leader Key                | Substitute *SPACE* anytime *LEADER* is listed below.|

## Insert Mode
> The below keymaps are for use in *Insert Mode*

### Exit Insert Mode
- Used to exit insert mode

| Shortcut      | Action                    | Notes         |
| --------      | --------                  | --------      |
|`jk`           | Exit insert mode          | Type fast     |
|`ESC`          | Exit insert mode          |               |
|`CTRL + c`     | Exit insert mode          |               |
|`CTRL + [`     | Exit insert mode          |               |
 

## Normal Mode
> The below keymaps are for use in *Normal Mode*.

### Movement / Motion
- Used for cursor movement

| Shortcut      | Action                    | Notes         |
| --------      | --------                  | --------      |
|`h`            | Move left by one          |               |
|`j`            | Move down by one          |               |
|`k`            | Move up by one            |               |
|`l`            | Move right by one         |               |
|`LEFT`         | Move left by one          | Left Arrow    |
|`UP`           | Move up by one            | Up Arrow      |
|`DOWN`         | Move down by one          | Down Arrow    |
|`RIGHT`        | Move right by one         | Right Arrow   |
|`w`            | Move forward by one word  |               |
|`b`            | Move backward by one word |               |

### Editing
- Used for editing text, undo, delete, copy, paste, etc...

| Shortcut      | Action                    | Notes                         |
| --------      | --------                  | --------                      |
|`y`            | Copy selected text        | Text is saved in the register |
|`yy`           | Copy entire line          | Text is saved in the register |
|`x`            | Delete under cursor       | Text is saved in the register |
|`d`            | Delete selected text      | Text is saved in the register |
|`dd`           | Delete entire line        | Text is saved in the register |
|`p`            | Paste below / after       | Paste what is in the resister. </br> If a **line** was sent to the register, it will paste **below** the cursor. </br> Otherwise, it will paste **after** the cursor.|
|`SHIFT + p`    | Paste above / before      | Paste what is in the resister. </br> If a **line** was sent to the register, it will paste **above** the cursor. </br> Otherwise, it will paste **before** the cursor.|
|`u`            | Undo previous command     |                               |
|`CTRL + r`     | Redo previous command     |                               |
|`v`            | Highlight under cursor    | Enters *Visual Mode*          |
|`SHIFT + v`    | Highlight current line    | Enters *Visual Mode*          |
|`u`            | Undo previous command     |                               |
|`u`            | Undo previous command     |                               |
|`u`            | Undo previous command     |                               |

- **Copy** command with *motion*

| Shortcut      | Action                    | Notes                         |
| --------      | --------                  | --------                      |
|`yw`           | Copy from cursor forward  | Text is saved in the register. </br> It will copy from the cursor's current position in a word and forward until the end of that word.|
|`yb`           | Copy from cursor backward | Text is saved in the register. </br> It will copy from the cursor's current position in a word and backward until the beginning of that word.|

- **Delete** command with **motion**

| Shortcut      | Action                    | Notes                         |
| --------      | --------                  | --------                      |



### Navigate Windows
- Used to navigate between splits, NvimTree, etc...

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`CTRL + h`     | Move window left      |               |
|`CTRL + LEFT`  | Move window left      | Left Arrow    |
|`CTRL + k`     | Move window up        |               |
|`CTRL + UP`    | Move window up        | Up Arrow      |
|`CTRL + j`     | Move window down      |               |
|`CTRL + DOWN`  | Move window down      | Down Arrow    |
|`CTRL + l`     | Move window right     |               |
|`CTRL + RIGHT` | Move window right     | Right Arrow   |

### Navigate Buffers
- Used to navigate between tabs, etc...

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`SHIFT + h`    | Move buffer left      |               |
|`SHIFT + LEFT` | Move buffer left      | Left Arrow    |
|`SHIFT + l`    | Move buffer right     |               |
|`SHIFT + RIGHT`| Move buffer right     | Right Arrow   |

### Resize Windows
- Used to resize spits, NvimTree, etc...

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`ALT + LEFT`   | Resize window left    | Left Arrow    |
|`ALT + UP`     | Resize window up      | Up Arrow      |
|`ALT + DOWN`   | Resize window down    | Down Arrow    |
|`ALT + RIGHT`  | Resize window right   | Right Arrow   |

### Clear Highlights
- Used to clear highlighted text

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`LEADER + h`    | Move buffer left     |               |

### Close Buffers
- Used to close buffers, IE: tabs, etc...

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`SHIFT + q`    | Close buffers         |               |

## Visual Mode
> The below keymaps are used in *Visual Mode*

### Paste
- Used for pasting

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`p`            | Paste                 |               |

### Indenting
- Used for staying in indent mode

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`<`            |                       |               |
|`>`            |                       |               |

## Plugins
> The below keymaps are used for their relevant *Plugins*

### NvimTree
-  Used for NVimTree

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`LEADER + t`   | Toggle NVimTree       |               |

### Telescope
- Used for Telescope

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`LEADER + ff`  | Find Files            |               |
|`LEADER + ft`  | Live Grep             |               |
|`LEADER + fp`  | Projects              |               |
|`LEADER + fb`  | Buffers               |               |

### Git
- Used for Git

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`LEADER + gg`  | Lua Lazy GIT toggle   |               |

### Comment
- Used for Commenting

| Shortcut      | Action                | Notes         |
| --------      | --------              | --------      |
|`LEADER + /`   | Comment current line  |               |









