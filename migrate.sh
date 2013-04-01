#!/bin/bash
#
# @category umg
#
# @internal fetch headers for umg sites
#
#Script to download themes
sites=(
	50cent.com
	ahsanofficial.com
	alex242.com
	azealiabanks.com
	badmeetsevil.net
	britsmithofficial.com
	reevecarney.com
	cassiesuper.com
	chelseawilliams.com
	chiefkeef.com
	colettecarr.com
	interscope.com
	d12online.com
	mrdontrip.com
	dre2001.com
	elliegoulding.com
	eminem.com
	esterdean.com
	evasimons.com
	fareastmovement.com
	fergie.com
	frankandderol.com
	frenchmontana.com
	comptongame.com
	girlsgenerationusa.com
	greyson-official.com
	gwenstefani.com
	ilvolomusic.com
	imaginedragonsmusic.com
	jessicasanchezofficial.com
	jrandmusic.com
	kroseonline.com
	kaylabrianna.com
	kendricklamar.com
	kerihilson.com
	keyshiacole.com
	larouxonline.com
	ladygaga.com
	laurenalainaofficial.com
	lifehousemusic.com
	lmfaomusic.com
	iamkinglos.com
	ladiesloverance.com
	miauk.com
	mjblige.com
	matthewkoma.com
	mgklaceup.com
	mindlessbehavior.com
	nellyfurtado.com
	thisisnero.com
	nicolescherzingermusic.com
	nodoubt.com
	omggirlz.com
	phillipphillips.com
	priyankachopramusic.com
	red-cafe.com
	riseagainst.com
	robinthicke.com
	scottymccreery.com
	skylargreymusic.com
	slaughterhousemusic.com
	starshellworld.com
	allamericanrejects.com
	theprettyreckless.com
	timbalandmusic.com
	interscope.com
	yeahyeahyeahs.com
	us.michaelkiwanuka.com
	yelawolf.com
	zedd.net
)

if [ ! -z "$1" ]; then
	sites=($1)
fi
    
for site in ${sites[@]}
do
	echo "\n\033[38;5;148m[Fetching headers for $site]\033[39m"
	curl -I $site
done