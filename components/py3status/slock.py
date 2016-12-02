# -*- coding: utf-8 -*-
class Py3status:
    """
    Module for clickable lockscreen [L] button'
    """
    def slock(self):
        return {
            'full_text': self.format,
            'cached_until': self.py3.CACHE_FOREVER
        }
