#!/bin/bash
#
# Add remote to be tracked to the linux kernel mirror.
#

GIT_BASE_URL="https://git.kernel.org/pub/scm/linux/kernel/git"
NEXT_REMOTE_URL=$GIT_BASE_URL"/next/linux-next.git"
ARM_SOC_REMOTE_URL=$GIT_BASE_URL"/arm/arm-soc.git"

function check_remote() {
    git remote | grep "$1"
    return $?
}

cd "/srv/mirrors/linux.git"

# Check/Add the "next" remote.
if [ ! `check_remote "next"` ]; then
    git remote add --no-tags next $NEXT_REMOTE_URL
fi

# Check/Add the "arm-soc" remote.
if [ ! `check_remote "arm-soc"` ]; then
    git remote add --no-tags arm-soc $ARM_SOC_REMOTE_URL
fi

# Check/Add the "lsk" remote.
if [ ! `check_remote "lsk"` ]; then
    git remote add --no-tags lsk https://git.linaro.org/kernel/linux-linaro-stable.git
fi

# Check/Add the "rmk" remote.
if [ ! `check_remote "rmk"` ]; then
    git remote add --no-tags rmk git://git.armlinux.org.uk/~rmk/linux-arm.git
fi
