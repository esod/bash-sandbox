#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal 
#
# @category 
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
umg_urls=(
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/headersparkles.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/skitszo-header-3.jpg"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/comment.gif"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/comment.gif"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/btn-gradient.gif"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/sprite_social_icons.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/sso_social_icons.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/headerSparkles.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/header_sprite.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/headerSparkles.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/skitszo-header-3.jpg"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/grid.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/bg_internal.jpg"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/hdSparkles.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/logo.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/internalLogo.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/bg_topBar.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/footerSparkles.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/footerSparkles.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/islandLogo_footer.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/sprite_0a0a0a.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/cloud.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/nav_sprite.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/bg_footernav.gif"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/cherry.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/interscope.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/nLogo.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/signUp.jpg"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/bg_content.jpg"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/btn-mailinglist.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/splash_bg.jpg"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/hdSparkles.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/cherry.png"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/btn-gradient.gif"
	"http://colettecarr.umg.edrupalgardens.com/sites/colettecarr.umg.edrupalgardens.com/files/201305/icons/mobile-menu-24.png"
)
for url in ${umg_urls[@]}
do
	echo ${url}|sed 's/http:\/\/colettecarr\.umg\.edrupalgardens\.com\/sites\/colettecarr\.umg\.edrupalgardens\.com\/files\/201305\///g'
	curl -I ${url}
done