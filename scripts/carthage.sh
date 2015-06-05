#!/bin/sh

export PATH=/opt/local/bin/:/opt/local/sbin:$PATH:/usr/local/bin:

carthagePath=`which carthage`
if [[ ! -f ${carthagePath} ]]; then
  echo "ERROR: You need to install Carthage first, you can use brew to simplify process:
  brew install carthage, OR,
  download package from https://github.com/Carthage/Carthage"
exit 0;
fi

carthageFile="./Cartfile"
carthageFileTimestamp="./Cartfile.timestamp"
if [ "$carthageFileTimestamp" -ot "$carthageFile" ];
then
  echo Cartfile updated, performing carthage update
  ${carthagePath} update
  touch -m -r "$carthageFile" "$carthageFileTimestamp"
else
  ${carthagePath} copy-frameworks
fi
