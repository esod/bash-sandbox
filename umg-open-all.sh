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
sites=(
	50cent.com
	ahsanofficial.com
	alex242.com
	allamericanrejects.com
	azealiabanks.com
	badmeetsevil.net
	britsmithofficial.com
	cassiesuper.com
	chelseawilliams.com
	chiefkeef.com
	colettecarr.com
	comptongame.com
	dre2001.com
	eminem.com
	esterdean.com
	evasimons.com
	fareastmovement.com
	fergie.com
	frankandderol.com
	girlsgenerationusa.com
	greyson-official.com
	iamkinglos.com
	ilvolomusic.com
	imaginedragonsmusic.com
	interscope.com
	jessicasanchezofficial.com
	jrandmusic.com
	kaylabrianna.com
	kendricklamar.com
	kerihilson.com
	keyshiacole.com
	ladiesloverance.com
	ladygaga.com
	laurenalainaofficial.com
	lifehousemusic.com
	lmfaomusic.com
	matthewkoma.com
	miauk.com
	mindlessbehavior.com
	mjblige.com
	mrdontrip.com
	nellyfurtado.com
	nicolescherzingermusic.com
	nodoubt.com
	omggirlz.com
	phillipphillips.com
	priyankachopramusic.com
	red-cafe.com
	riseagainst.com
	robinthicke.com
	schoolboyq.com
	scottymccreery.com
	skylargreymusic.com
	slaughterhousemusic.com
	starshellworld.com
	startersite
	theprettyreckless.com
	timbalandmusic.com
	us.michaelkiwanuka.com
	xambassadors.com
	zedd.net
)

for site in ${sites[@]}
do
sh /Users/matt/Scripts/bash/sublime.sh "/Users/matt/Sites/UMG/themes/${site}/${site}.css"
done