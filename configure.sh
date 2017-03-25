#!/bin/bash

if [ -n "$2" ]; then
	echo "Configure only accepts --prefix argument."
	exit 1
fi

case "$1" in
	--prefix=*)
	PREFIX=`echo $1 | sed 's/--prefix=//'`
	echo "PREFIX=$PREFIX" > Makefile
	echo -e "#!/bin/bash\n\nPREFIX=$PREFIX" > lgtinit.sh
	cat Makefile.in >> Makefile
	cat lgtinit.in >> lgtinit.sh
	chmod a+x lgtinit.sh
	;;

	*)
	if [ -n "$1" ]; then
		echo "Configure only accepts --prefix argument."
		exit 1
	fi
	;;
esac

if [ -z "$PREFIX" ] ; then
	PREFIX=/usr/local
	echo "PREFIX=$PREFIX" > Makefile
	echo -e "#!/bin/bash\n\nPREFIX=$PREFIX" > lgtinit.sh
	cat Makefile.in >> Makefile
	cat lgtinit.in >> lgtinit.sh
	chmod a+x lgtinit.sh
fi

echo "Configuration complete. Type 'make install' to install."
