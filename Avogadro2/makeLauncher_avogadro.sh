#!/bin/sh

DIR=`dirname $0`

cd ${DIR}

FILE=Avogadro.desktop

echo "[Desktop Entry]"                          >  ${FILE}
echo "Type=Application"                         >> ${FILE}
echo "Terminal=false"                           >> ${FILE}
echo "Version=1.99"                              >> ${FILE}
echo "Name=Avogadro2"                               >> ${FILE}
echo "Path=${PWD}/"                          >> ${FILE}
echo "Exec=${PWD}/avogadro.sh %F"              >> ${FILE}
echo "Icon=${PWD}/avogadro.png"                >> ${FILE}

chmod +x ${FILE}
