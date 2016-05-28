#!/bin/bash

SOURCEDIR=`dirname "${BASH_SOURCE[0]}"`
HOUDINIVERSION="15.5.488" 
sudo echo "Installing Houdini ${HOUDINIVERSION}"
hdiutil mount "$SOURCEDIR/houdini-${HOUDINIVERSION}-macosx_x86_64_clang6.1_10.10.dmg"
sudo installer -pkg /Volumes/Houdini/Houdini.pkg -target /
hdiutil unmount /Volumes/Houdini/

##LICENSING HOUDINI: http://www.sidefx.com/faq/license-management/#how-do-i-use-sesictrl
cd /Library/Frameworks/Houdini.framework/Versions/${HOUDINIVERSION}/Resources/houdini/sbin

##INSTALL IMAGEMAGICK
sudo installer -pkg "$SOURCEDIR/ImageMagick-6.9.1-0.pkg" -target /

##INSTALL PYTHON 3.5
sudo installer -pkg "$SOURCEDIR/python-3.5.0-macosx10.6.pkg" -target /

#RUN TESTS
/path/to/tests.sh

##RETURN LICENSES for entitlements
/Library/Frameworks/Houdini.framework/Versions/${HOUDINIVERSION}/Resources/houdini/sbin/sesictrl [-p host -P port] -d id
