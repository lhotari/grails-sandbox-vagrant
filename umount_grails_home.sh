#!/bin/sh
if [ "`uname`"=="Darwin" ]; then
   umount grails-home-mount
else
   sudo umount grails-home-mount
fi
