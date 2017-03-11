#!/bin/bash

if [ -n "$1" ]; then
	PROJ_NAME=$1
	LGTINIT_DIR=$HOME/Development/src/lgtinit

	mkdir -p "$PROJ_NAME"

	for file in $LGTINIT_DIR/template/*; do
		cp $file $PROJ_NAME/
	done

	mv "$PROJ_NAME/main.lgt" "$PROJ_NAME/$PROJ_NAME.lgt"
	sed -i "s/:- object(main)/:- object($PROJ_NAME)/" $PROJ_NAME/$PROJ_NAME.lgt
	sed -i "s/logtalk_load(main)/logtalk_load($PROJ_NAME)/" $PROJ_NAME/loader.lgt
	sed -i "s/logtalk_load(main/logtalk_load($PROJ_NAME/" $PROJ_NAME/tester.lgt
else
	echo "No project name provided."
fi
