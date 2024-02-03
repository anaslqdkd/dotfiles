import os
from urllib.request import urlopen

config.load_autoconfig()


import catppuccin
config.load_autoconfig()
catppuccin.setup(c, 'mocha', True)
config.bind(',m', 'hint links spawn mpv {hint-url}')
config.bind(',s', 'session-save --only-active-window session')
c.url.start_pages = ["http://spaceis.cool/"]
c.content.cookies.accept = 'all'
c.colors.webpage.darkmode.enabled=True

from qutebrowser.api import interceptor
def filter_yt(info: interceptor.Request):
	"""Block the given request if necessary."""
	url = info.request_url
	if (url.host() == 'www.youtube.com' and
			url.path() == '/get_video_info' and
			'&adformat=' in url.query()):
		info.block()
interceptor.register(filter_yt)

# config.source('qutebrowser-themes/themes/onedark.py')
