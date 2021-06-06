# -*- coding: utf-8 -*-

import re
import os
import shlex
from xkeysnail.transform import *

def cycle(app):
    _cycle = "bash /home/liuyan/dotfiles/scripts/cycle.sh "
    return shlex.split(_cycle+app)

# define timeout for multipurpose_modmap
define_timeout(0.5)

define_keymap(re.compile("Chromium|Google-chrome"), {
    # Ctrl+Alt+j/k to switch next/previous tab
    K("RC-M-j"): K("C-TAB"),
    K("RC-M-k"): K("C-Shift-TAB"),
}, "Chromium and Chrome")

define_multipurpose_modmap({
    # To use this example, you can't remap capslock with define_modmap.
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
    Key.TAB: [Key.TAB, Key.RIGHT_CTRL],
})

define_keymap(None, {
    K("RC-KEY_4"): K("F4"),
    K("RC-KEY_5"): K("F5"),
    K("RC-KEY_6"): K("F6"),
    K("RC-KEY_7"): K("F7"),
    K("RC-KEY_8"): K("F8"),
    K("RC-KEY_9"): K("F9"),
    K("RC-P"): K("MUTE"),
    K("RC-LEFT_BRACE"): K("VOLUMEDOWN"),
    K("RC-RIGHT_BRACE"): K("VOLUMEUP"),
    K("RC-APOSTROPHE"): K("CAPSLOCK"),

    K("RC-H"): K("LEFT"),
    K("RC-J"): K("DOWN"),
    K("RC-K"): K("UP"),
    K("RC-L"): K("RIGHT"),
    K("LC-RC-H"): K("LC-LEFT"),
    K("LC-RC-J"): K("LC-DOWN"),
    K("LC-RC-K"): K("LC-UP"),
    K("LC-RC-L"): K("LC-RIGHT"),

    K("RC-G"): launch(cycle("chromium")),
    K("RC-E"): launch(cycle("emacs")),
    K("RC-Y"): launch(cycle("yesplaymusic")),
    K("RC-SEMICOLON"): launch(cycle("st-256color")),
    K("RC-W"): launch(cycle("wine")),
})