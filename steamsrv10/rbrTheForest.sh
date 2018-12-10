#!/bin/bash

user="steam"
serverdir="/minecraft/Steam/forest"
steamcmddir="/home/$user/.steam/steamcmd/"
dateFormat="[$(date +"%Y-%m-%d")][$(date +"%T")]"

function theforest_start {

echo "$dateFormat Starting server..."

isServerDown=$(ps axf | grep TheForestDedicatedServer.exe | grep -v grep)
if [ -z "$isServerDown" ]; then
        screen -dmS TheForest xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' wine $serverdir/TheForestDedicatedServer.exe -batchmode -nographics -savefolderpath "$serverdir/saves/" -log -configfilepath "$serverdir/config/config.cfg"
        echo "$dateFormat [SUCCESS] Server is now up"
else
        echo "$dateFormat [FAILED] A server is already up, no restart required"
fi

}

function theforest_stop {

pid=$(ps axf | grep TheForestDedicatedServer.exe | grep -v grep | awk '{print $1}')

if [ -z "$pid" ]; then
        echo "$dateFormat [FAILED] There is no server to stop"
else
        echo "$dateFormat [SUCCESS] Existing PIDs: $pid"
        kill -SIGINT $pid
        echo "$dateFormat [INFO] Killing server process..."

        isServerDown=$(ps axf | grep TheForestDedicatedServer.exe | grep -v grep)
        cpt=0
        while [ ! -z "$isServerDown" ]; do
                echo "$dateFormat [WAIT] Server is stopping..."
                ((cpt++))
                sleep 1
                isServerDown=$(ps axf | grep TheForestDedicatedServer.exe | grep -v grep)
        done
        echo "$dateFormat [SUCCESS] Server stopped in $cpt seconds"
fi

}

function theforest_reboot {

        echo "$dateFormat [SUCCESS] Server is going to reboot"
        theforest_stop
        theforest_start wait

}

function theforest_backup {

echo "$dateFormat  Backing up files..."
tarballName="configBackup_$(date +%Y-%m-%d_%H-%M).tar.gz"
mkdir -p $serverdir/Backups
tar zcfv $serverdir/Backups/$tarballName $serverdir/saves/Multiplayer $serverdir/config

}

function theforest_update {

cd $HOMEDIR
if [ ! -f $serverdir/latestInstalledUpdate.buildid ] ; then
 touch $serverdir/latestInstalledUpdate.buildid
 echo "0" > $serverdir/latestInstalledUpdate.buildid
fi

echo "$dateFormat [INFO] Removing Steam/appcache/appinfo.vdf"
rm -rf "<change folder here>/Steam/appcache/appinfo.vdf"

$steamcmddir/steamcmd.sh +login anonymous +app_info_update 1 +app_info_print 556450 +quit | grep -EA 1000 "^\s+\"branches\"$" | grep -EA 5 "^\s+\"public\"$" | grep -m 1 -EB 10 "^\s+}$" | grep -E "^\s+\"timeupdated\"\s+" | tr '[:blank:]"' ' ' | tr -s ' ' | cut -d' ' -f3 > $serverdir/latestAvaliableUpdate.buildid

installedupdate=`cat $serverdir/latestInstalledUpdate.buildid`
latestupdate=`cat $serverdir/latestAvaliableUpdate.buildid`

if [ "$latestupdate" -gt "$installedupdate" ]; then
        echo "$dateFormat [SUCCESS] New update found"

        theforest_stop
        theforest_backup

        $steamcmddir/steamcmd.sh +login anonymous +@sSteamCmdForcePlatformType windows +force_install_dir $serverdir +app_update 556450 validate +quit
        echo "$dateFormat [SUCCESS] Update finished"
        echo "$latestupdate" > $serverdir/latestInstalledUpdate.buildid

        theforest_start
else
        echo "$dateFormat [FAILED] No update found"
fi

}

case "$1" in
        update) theforest_update $2 ;;
        start) theforest_start $2 ;;
        stop) theforest_stop $2 ;;
        reboot) theforest_reboot $2 ;;
        backup) theforest_backup $2 ;;

        *) echo "Command not found: \"$1\""
esac
