#!/bin/bash

##INSTALL IMAGEMAGICK
sudo installer -pkg "$SOURCEDIR/ImageMagick-6.9.1-0.pkg" -target /

##INSTALL PYTHON 3.5
sudo installer -pkg "$SOURCEDIR/python-3.5.0-macosx10.6.pkg" -target /

#RUN TESTS
/path/to/tests.sh

##RETURN LICENSES for entitlements
/Library/Frameworks/Houdini.framework/Versions/${HOUDINIVERSION}/Resources/houdini/sbin/sesictrl [-p host -P port] -d id
