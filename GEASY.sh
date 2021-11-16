#!/bin/bash
Geasy(){
	if test -f "conf.json";then
		LIBPRE=`cat conf.json | jq -r '.libPrefixes[]'`
		INCLUSIONS=`cat conf.json | jq -r '.Include[]'`
		LIBS=`cat conf.json | jq -r '.libs[]'`
		FILE=`cat conf.json | jq -r '.file'`
		COMMAND=" "
		for i in ${INCLUSIONS[@]}
		do
			if [ -z "$INCLUSIONS" ];then
				echo "No INCLUSIONS"
			else
				COMMAND+=" -I "$i
			fi
		done
		for i in ${LIBS[@]}
		do
			if [ -z "$LIBS" ];then
				echo "No LIBS"
			else
				COMMAND+=" -L "$i
			fi
		done
		echo g++ $FILE -o app $LIBPRE $COMMAND > exe.txt
		/bin/bash -c "`cat exe.txt`"
		rm exe.txt
		if [ "$1" = "-w" ];then
			if test -f "W64conf.json";then
				WLIBPRE=`cat W64conf.json | jq -r '.libPrefixes[]'`
				WINCLUSIONS=`cat W64conf.json | jq -r '.Include[]'`
				WLIBS=`cat W64conf.json | jq -r '.libs[]'`
				WFILE=`cat W64conf.json | jq -r '.file'`
				WCOMMAND=" "
				for i in ${WINCLUSIONS[@]}
				do
					if [ -z "$WINCLUSIONS" ];then
						echo "No INCLUSIONS"
					else
						WCOMMAND+=" -I "$i
					fi
				done
				for i in ${WLIBS[@]}
				do
					if [ -z "$WLIBS" ];then
						echo "No LIBS"
					else
						WCOMMAND+=" -L "$i
					fi
				done
				echo x86_64-w64-mingw32-g++ $WFILE -o app.exe  $WCOMMAND $WLIBPRE > exe.txt
				/bin/bash -c "`cat exe.txt`"
				rm exe.txt
				echo 
			else
				cp ~/TerminalScripts/templates/W64conf.json .
				echo "W64conf.json doesn't exist. Created Wconf.json. Please configure"
			fi
		fi
		./app
	else
		cp ~/TerminalScripts/templates/conf.json .
		echo "conf.json doesn't exist. Created conf.json. Please configure"
	fi
}
