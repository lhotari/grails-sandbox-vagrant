#!/bin/sh
if [ "`uname`"=="Darwin" ]; then
   # brew install bindfs
   bindfs $GRAILS_HOME grails-home-mount
else
   # mount $GRAILS_HOME to sub-directory in Linux
   sudo mount -o bind $GRAILS_HOME grails-home-mount
fi
