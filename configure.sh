#!/bin/bash

for arg in "$@"; do
	case "$arg" in
		--prefix=*)
		PREFIX=`echo $arg | sed 's/--prefix=//'`
		echo "PREFIX=$PREFIX" > Makefile
		echo -e "#!/bin/bash\n\nPREFIX=$PREFIX" > lgtinit.sh
		cat Makefile.in >> Makefile
		cat lgtinit.in >> lgtinit.sh
		chmod a+x lgtinit.sh
		;;
	esac
done

if [ -z "$PREFIX" ] ; then
	PREFIX=/usr/local
	echo "PREFIX=$PREFIX" > Makefile
	echo -e "#!/bin/bash\n\nPREFIX=$PREFIX" > lgtinit.sh
	cat Makefile.in >> Makefile
	cat lgtinit.in >> lgtinit.sh
	chmod a+x lgtinit.sh
fi

echo "Configuration complete. Type 'make install' to install."
