# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.default import Default
from ranger.gui.color import green, red, blue, magenta, black, default, BRIGHT


class Scheme(Default):
    progress_bar_color = magenta

    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.border:
            return black + BRIGHT, default, attr

        if context.directory and not context.marked and not context.link \
                and not context.inactive_pane:
            fg = self.progress_bar_color

        if context.in_titlebar and context.hostname:
            fg = blue if context.bad else green

        if context.selected:
            fg = magenta

        return fg, bg, attr
