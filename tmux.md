 ## [tmux](http://tmux.sourceforge.net/)
 
 #### config file
 
 ```
 nano ~/.tmux.conf
 ```

#### Changes to config including binding to ctrl-a and not ctrl-b as easier to use

```bash
# unbind default prefix and set it to ctrl-a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# make delay shorter
set -sg escape-time 0

#### key bindings ####

# reload config file
bind r source-file ~/.tmux.conf \; display ".tmux.conf reloaded!"

# quickly open a new window
bind N new-window

# synchronize all panes in a window
bind y setw synchronize-panes

# pane movement shortcuts (same as vim)
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# enable mouse support for switching panes/windows
set -g mouse-utf8 on
set -g mouse on


#### copy mode : vim ####

# set vi mode for copy mode
setw -g mode-keys vi

# copy mode using 'Esc'
unbind [
bind Escape copy-mode

# start selection with 'space' and copy using 'y'
bind -t vi-copy 'y' copy-selection

# paste using 'p'
unbind p
bind p paste-buffer
```


### tmux use


- start:  ``` tmux ```
- start with session name:  ```tmux new -s myname```
- attach:   ```tmux a  #  (or at, or attach)```
- attach to named:  ```tmux a -t myname```
- list sessions:  ```tmux ls```
- kill session:   ```tmux kill-session -t myname```
- Kill all the tmux sessions:   ```tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill```

### ‘ctrl-a’ (or ctrl-b without above conf)

#### Window No.1

* `Control + a` main use command before other commands


* `Control + a` and `?` to bring up list of keyboard shortcuts
* `Control + a` and `?` to split window
* `Control + a` and `<Space>` to change pane arrangement
* `Control + a` and `o` to rotate panes
* `Control + a` and `h`, `j`, `k`, `l` to move left, down, up, right. Respectively. (vim hjkl)
* `Control + a` and `;` to go to last panel

- shortcuts
`Control + a` and `?`
- split window
`Control + a` and `?`
- change pane arrangement
`Control + a` and `<Space>`
- rotate panes
`Control + a` and `o`
- move left [vim] 
`Control + a` and `h`
- move down [vim]
`Control + a` and `j`
- move up [vim]
`Control + a` and `k`
- move right [vim]
`Control + a` and `l`
- list sessions
```tmux ls```
- kill sessions
```tmux kill-session -t myname```
- name session

- create window

- list windows

- next window

- previous window

- find window

- name window

- kill window

- goto window


## Sessions
```
    :new<CR>  new session
    s  list sessions
    $  name session
```
## <a name="WindowsTabs"></a>Windows (tabs)
```
    c  create window
    w  list windows
    n  next window
    p  previous window
    f  find window
    ,  name window
    &  kill window
```
## <a name="PanesSplits"></a>Panes (splits) 
```
    %  vertical split
    "  horizontal split
    
    o  swap panes
    q  show pane numbers
    x  kill pane
    +  break pane into window (e.g. to select text by mouse to copy)
    -  restore pane from window
    ⍽  space - toggle between layouts
    <prefix> q (Show pane numbers, when the numbers show up type the key to goto that pane)
    <prefix> { (Move the current pane left)
    <prefix> } (Move the current pane right)
    <prefix> z toggle pane zoom
```
## <a name="syncPanes"></a>Sync Panes 

You can do this by switching to the appropriate window, typing your Tmux prefix (commonly Ctrl-B) and then a colon to bring up a Tmux command line, and typing:

```
:setw synchronize-panes
```

You can optionally add on or off to specify which state you want; otherwise the option is simply toggled. This option is specific to one window, so it won’t change the way your other sessions or windows operate. When you’re done, toggle it off again by repeating the command. [tip source](http://blog.sanctum.geek.nz/sync-tmux-panes/)

    
## Copy mode:

Pressing PREFIX [ places us in Copy mode. We can then use our movement keys to move our cursor around the screen. By default, the arrow keys work. we set our configuration file to use Vim keys for moving between windows and resizing panes so we wouldn’t have to take our hands off the home row. tmux has a vi mode for working with the buffer as well. To enable it, add this line to .tmux.conf:

    setw -g mode-keys vi

With this option set, we can use h, j, k, and l to move around our buffer.

To get out of Copy mode, we just press the ENTER key. Moving around one character at a time isn’t very efficient. Since we enabled vi mode, we can also use some other visible shortcuts to move around the buffer.

For example, we can use "w" to jump to the next word and "b" to jump back one word. And we can use "f", followed by any character, to jump to that character on the same line, and "F" to jump backwards on the line.

       Function                vi             emacs
       Back to indentation     ^              M-m
       Clear selection         Escape         C-g
       Copy selection          Enter          M-w
       Cursor down             j              Down
       Cursor left             h              Left
       Cursor right            l              Right
       Cursor to bottom line   L
       Cursor to middle line   M              M-r
       Cursor to top line      H              M-R
       Cursor up               k              Up
       Delete entire line      d              C-u
       Delete to end of line   D              C-k
       End of line             $              C-e
       Goto line               :              g
       Half page down          C-d            M-Down
       Half page up            C-u            M-Up
       Next page               C-f            Page down
       Next word               w              M-f
       Paste buffer            p              C-y
       Previous page           C-b            Page up
       Previous word           b              M-b
       Quit mode               q              Escape
       Scroll down             C-Down or J    C-Down
       Scroll up               C-Up or K      C-Up
       Search again            n              n
       Search backward         ?              C-r
       Search forward          /              C-s
       Start of line           0              C-a
       Start selection         Space          C-Space
       Transpose chars                        C-t

## Misc

    d  detach
    t  big clock
    ?  list shortcuts
    :  prompt

## Configurations Options:

    # Mouse support - set to on if you want to use the mouse
    * setw -g mode-mouse off
    * set -g mouse-select-pane off
    * set -g mouse-resize-pane off
    * set -g mouse-select-window off

    # Set the default terminal mode to 256color mode
    set -g default-terminal "screen-256color"

    # enable activity alerts
    setw -g monitor-activity on
    set -g visual-activity on

    # Center the window list
    set -g status-justify centre

    # Maximize and restore a pane
    unbind Up bind Up new-window -d -n tmp \; swap-pane -s tmp.1 \; select-window -t tmp
    unbind Down
    bind Down last-window \; swap-pane -s tmp.1 \; kill-window -t tmp

## Resources:

* [tmuxguide readthedocs](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)
* [tmux: Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux)
* [How to reorder windows](http://superuser.com/questions/343572/tmux-how-do-i-reorder-my-windows)
* [MohamedAlaa Gist](https://gist.github.com/MohamedAlaa/2961058
* [tao of tmux](https://leanpub.com/the-tao-of-tmux/read)
* [tmux-mem-cpu-load](http://github.com/thewtex/tmux-mem-cpu-load)
* [tmuxp](https://github.com/tony/tmuxp).
* [vcspull](https://github.com/tony/vcspull).
* [tony/vim-config](https://github.com/tony/vim-config)
* [tony/.dot-config](https://github.com/tony/.dot-config)


