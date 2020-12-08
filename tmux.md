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

- start: 
``` tmux ```
- start with session name:  
```tmux new -s myname```
- attach:   
```tmux a  #  (or at, or attach)```
- attach to named:  
```tmux a -t myname```
- list sessions: 
```tmux ls```
- kill session:  
```tmux kill-session -t myname```
- Kill all the tmux sessions:  
```tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill```

### ‘ctrl-a’ (or ctrl-b without above conf)

#### Window No.1

- main use command before other commands
```
 ctrl+a a 
```
- shortcuts

```ctrl+a ?```

- vertical split window

```ctrl+a %```

- horizontal split window

```ctrl+a ‘’```

- change pane arrangement

```ctrl+a <Space>```

- rotate panes

```ctrl+a o```

- move left [vim] 

```ctrl+a h```

- move down [vim]

```ctrl+a j```

- move up [vim]

```ctrl+a k```

- move right [vim]


```ctrl+a l```

- create window

```ctrl+a c```

- list windows

```ctrl+a w```

- next window

```ctrl+a n```

- previous window

```ctrl+a p```

- find window

```ctrl+a f```

- name window

```ctrl+a ,```

- kill window

```ctrl+a &```

- goto window



## Commands

- command mode
```
:
```

- shows all the commands
```
:list-keys
```
- shows the names of all panes
```
:list-panes
```
- resize down

```
:resize-pane-D 20 	
```

- resize up
```
:resize-pane -U 20 	 
```
- resize left

```
:resize-pane -L 20 	
```
- resize right
```
:resize-pane -R 20 
```
- swap pane ‘1’ with pane ‘3’
```
:swap-pane -s 3 -t 1
```

## Sessions
```
    :new<CR>  new session
    s  list sessions
    $  name session
```


## Window Panees 
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
## Copy mode:

Pressing PREFIX places us in Copy mode. 
We can then use our movement keys to move our cursor around the screen. 
By default, the arrow keys work. we set our configuration file to use Vim keys for moving between windows and resizing panes so we wouldn’t have to take our hands off the home row. 
tmux has a vi mode for working with the buffer as well. 
To enable it, add this line to .tmux.conf:
```
    setw -g mode-keys vi
```
With this option set, we can use h, j, k, and l to move around our buffer.‘’


### vim 
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



## Resources:

* [tmuxguide readthedocs](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)
* [tmux: Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux)
* [How to reorder windows](http://superuser.com/questions/343572/tmux-how-do-i-reorder-my-windows)
* [MohamedAlaa Gist](https://gist.github.com/MohamedAlaa/2961058)
* [tao of tmux](https://leanpub.com/the-tao-of-tmux/read)
* [tmux-mem-cpu-load](http://github.com/thewtex/tmux-mem-cpu-load)
* [tmuxp](https://github.com/tony/tmuxp).
* [vcspull](https://github.com/tony/vcspull).
* [tony/vim-config](https://github.com/tony/vim-config)
* [tony/.dot-config](https://github.com/tony/.dot-config)


