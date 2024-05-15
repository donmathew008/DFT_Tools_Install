#!/bin/sh

cd ../
java -Dprism.forceGPU=true -jar ./bin/burai.jar $@
