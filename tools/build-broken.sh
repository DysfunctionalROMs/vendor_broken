#!/bin/bash

#export BEEP=vendor/broken/proprietary/common/system/media/audio/ringtones/ImBroken.ogg

usage()
{
    echo -e ""
    echo -e ${txtbld}"Usage:"${txtrst}
    echo -e "  build-broken.sh [options] device"
    echo -e ""
    echo -e ${txtbld}"  Options:"${txtrst}
    echo -e "    -c# Cleanin options before build:"
    echo -e "        0 - make official"
    echo -e "        1 - make clean"
    echo -e "        2 - make dirty"
    echo -e "        3 - make magic"
    echo -e "        4 - make kernelclean"
    echo -e "        5 - make appclean"
    echo -e "        6 - make imgclean"
    echo -e "        7 - make systemclean"
    echo -e "        8 - make recoveryclean"
    echo -e "        9 - make rootclean"
    echo -e "    -d  Use dex optimizations"
    echo -e "    -i  Static Initlogo"
    echo -e "    -j# Set jobs"
    echo -e "    -s  Sync before build"
    echo -e "    -p  Build using pipe"
    echo -e "    -o# Select GCC O Level"
    echo -e "        Valid O Levels are"
    echo -e "        1 (Os) or 3 (O3)"
    echo -e "    -z  create build log in 'build-logs'"
    echo -e ""
    echo -e ${txtbld}"  Example:"${txtrst}
    echo -e "    ./build-broken.sh -p -o3 -j18 hammerhead"
    echo -e ""
    exit 1
}

# colors
. ./vendor/broken/tools/colors

if [ ! -d ".repo" ]; then
    echo -e ${red}"No .repo directory found.  Is this an Android build tree?"${txtrst}
    exit 1
fi
if [ ! -d "vendor/broken" ]; then
    echo -e ${red}"No vendor/broken directory found.  Is this an BrokenOs build tree?"${txtrst}
    exit 1
fi

# figure out the output directories
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
thisDIR="${PWD##*/}"

findOUT() {
if [ -n "${OUT_DIR_COMMON_BASE+x}" ]; then
return 1; else
return 0
fi;}

findOUT
RES="$?"

if [ $RES = 1 ];then
    export OUTDIR=$OUT_DIR_COMMON_BASE/$thisDIR
    echo -e ""
    echo -e ${cya}"External out DIR is set ($OUTDIR)"${txtrst}
    echo -e ""
elif [ $RES = 0 ];then
    export OUTDIR=$DIR/out
    echo -e ""
    echo -e ${cya}"No external out, using default ($OUTDIR)"${txtrst}
    echo -e ""
else
    echo -e ""
    echo -e ${red}"NULL"${txtrst}
    echo -e ${red}"Error wrong results"${txtrst}
    echo -e ""
fi

# get OS (linux / Mac OS x)
IS_DARWIN=$(uname -a | grep Darwin)
if [ -n "$IS_DARWIN" ]; then
    CPUS=$(sysctl hw.ncpu | awk '{print $2}')
    DATE=gdate
else
    CPUS=$(grep "^processor" /proc/cpuinfo | wc -l)
    DATE=date
fi

export USE_CCACHE=1

opt_clean=0
opt_dex=0
opt_initlogo=0
opt_jobs="$CPUS"
opt_log=0
opt_sync=0
opt_pipe=0
opt_olvl=0
opt_verbose=0

while getopts "c:dij:psfo:z" opt; do
    case "$opt" in
    c) opt_clean="$OPTARG" ;;
    d) opt_dex=1 ;;
    i) opt_initlogo=1 ;;
    j) opt_jobs="$OPTARG" ;;
    s) opt_sync=1 ;;
    p) opt_pipe=1 ;;
    o) opt_olvl="$OPTARG" ;;
    z) opt_log=1 ;;
    *) usage
    esac
done
shift $((OPTIND-1))
if [ "$#" -ne 1 ]; then
    usage
fi
device="$1"

# get current version
eval $(grep "^PRODUCT_VERSION_" vendor/broken/config/common.mk | sed 's/ *//g')
VERSION="$PRODUCT_VERSION_MAINTENANCE.$BROKEN_VERSION_MAJOR."

echo -e ${cya}"Building ${ppl}Broken ${bldylw}$VERSION"${txtrst}

if [ "$opt_clean" -eq 0 ]; then
    make official >/dev/null
    echo -e ""
    echo -e ${bldblu}"Make sure to flip the flag in vendor OFFICIAL DEVICES ONLY"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 1 ]; then
    make clean >/dev/null
    echo -e ""
    echo -e ${bldblu}"Got rid of the garbage"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 2 ]; then
    make dirty >/dev/null
    echo -e ""
    echo -e ${bldblu}"Changelogs, build.prop and zips removed yet still full of crap"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 3 ]; then
    make magic >/dev/null
    echo -e ""
    echo -e ${bldblu}"Muhahaha"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 4 ]; then
    make kernelclean >/dev/null
    echo -e ""
    echo -e ${bldblu}"All kernel components have been removed"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 5 ]; then
    make appclean >/dev/null
    echo -e ""
    echo -e ${bldblu}"All apps have been removed"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 6 ]; then
    make imgclean >/dev/null
    echo -e ""
    echo -e ${bldblu}"All imgs have been removed"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 7 ]; then
    make systemclean >/dev/null
    echo -e ""
    echo -e ${bldblu}"All system components have been removed"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 8 ]; then
    make recoveryclean >/dev/null
    echo -e ""
    echo -e ${bldblu}"All recovery components have been removed"${txtrst}
    echo -e ""
elif [ "$opt_clean" -eq 9 ]; then
    make rootclean >/dev/null
    echo -e ""
    echo -e ${bldblu}"Root components have been removed"${txtrst}
    echo -e ""
fi

# sync with latest sources
if [ "$opt_sync" -ne 0 ]; then
    echo -e ""
    echo -e ${bldblu}"Getting the latest shit"${txtrst}
    repo sync -j"$opt_jobs"
    echo -e ""
fi

rm -f $OUTDIR/target/product/$device/obj/KERNEL_OBJ/.version

# get time of startup
t1=$($DATE +%s)

# setup environment
echo -e ${bldblu}"Getting ready"${txtrst}
. build/envsetup.sh

# Remove system folder (this will create a new build.prop with updated build time and date)
rm -f $OUTDIR/target/product/$device/system/build.prop
rm -f $OUTDIR/target/product/$device/system/app/*.odex
rm -f $OUTDIR/target/product/$device/system/framework/*.odex

# initlogo
if [ "$opt_initlogo" -ne 0 ]; then
    export BUILD_WITH_STATIC_INITLOGO=true
fi

# lunch device
echo -e ""
echo -e ${bldblu}"Getting your device"${txtrst}
lunch "broken_$device-userdebug";

echo -e ""
echo -e ${bldblu}"Off like a prom dress"${txtrst}

# start compilation
if [ "$opt_dex" -ne 0 ]; then
    export WITH_DEXPREOPT=true
fi

if [ "$opt_pipe" -ne 0 ]; then
    export TARGET_USE_PIPE=true
fi

if [ "$opt_olvl" -eq 1 ]; then
    export TARGET_USE_O_LEVEL_S=true
    echo -e ""
    echo -e ${bldgrn}"Using Os Optimization"${txtrst}
    echo -e ""
elif [ "$opt_olvl" -eq 3 ]; then
    export TARGET_USE_O_LEVEL_3=true
    echo -e ""
    echo -e ${bldgrn}"Using O3 Optimization"${txtrst}
    echo -e ""
else
    echo -e ""
    echo -e ${bldgrn}"Using the default GCC Optimization Level, O2"${txtrst}
    echo -e ""
fi

# make broken
if [ "$opt_log" -ne 0 ]; then
    echo -e ""
    echo -e ${bldgrn}"Creating 'build-logs' directory if one hasn't been created already"${txtrst}
    echo -e ""
    # create 'build-logs' directory if it hasn't already been created
    mkdir -p build-logs
    echo -e ""
    echo -e ${bldgrn}"Your build will be logged in 'build-logs'"${txtrst}
    echo -e ""
    # log build into 'build-logs'
    make -j"$opt_jobs" broken 2>&1 | tee build-logs/broken_$device-$(date "+%Y%m%d").txt
else
    # build normally
    make -j"$opt_jobs" broken

fi

play $BEEP &> /dev/null

# finished? get elapsed time
t2=$($DATE +%s)

tmin=$(( (t2-t1)/60 ))
tsec=$(( (t2-t1)%60 ))

echo -e ${bldgrn}"Total time elapsed:${txtrst} ${grn}$tmin minutes $tsec seconds"${txtrst}
