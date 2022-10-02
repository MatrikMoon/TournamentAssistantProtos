#!/bin/bash
if [[ ! -d ./node_modules ]]; then
    echo "Installing dependencies..." 
    npm i
fi
if [[ -d ./TS ]]; then
    rm -rf ./TS
fi
mkdir ./TS
protoc -I=../ ../*.proto --ts_out="TS"

for FILE in ./TS/*.ts; do 
    echo "Processing $FILE"; 
    sed -i -r 's/\#one_of_decls:/private one_of_decls:/g' $FILE;
    sed -i -r 's/\#one_of_decls/one_of_decls/g' $FILE;
    sed -i -r 's/proto.models/Models/g' $FILE;
    sed -i -r 's/proto.packet/Packets/g' $FILE;
    sed -i -r 's/message.difficulties = reader.readPackedInt32\(\);/var values = \(reader.isDelimited\(\) ? reader.readPackedInt32\(\) : [reader.readInt32\(\)]\);\
                        for \(var i = 0; i < values.length; i++\) {\
                            message.difficulties.push\(values[i]\);\
                        }/g' $FILE;
done
