# This will check for arguments

#!/bin/bash
if [[ $@ < 1  ]]; then
	echo "No Arguments"
else
	echo "The # of arguments is $#"
fi


