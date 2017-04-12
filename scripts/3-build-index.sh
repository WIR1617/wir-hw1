x\#!/bin/sh

debug_msg="BUILD_INDEX"

build_index () {
    stemmer=$1
    stemmer_name=$2

    echo $debug_msg - creating new \"out/indices/$stemmer_name\" folder...
    mkdir out/indices/$stemmer_name

    java it.unimi.di.big.mg4j.tool.IndexBuilder -t $stemmer -S out/cran.collection out/indices/$stemmer_name/cran
    # java it.unimi.di.big.mg4j.tool.IndexBuilder --downcase -t $stemmer -S out/cran.collection out/$stemmer_name/cran

    ln out/cran.collection out/indices/$stemmer_name/cran.collection
}

echo
echo $debug_msg - start...

if [ ! -d out ]; then
    echo $debug_msg - cannot find \"out\" directory...
    echo $debug_msg - exiting...
    exit 1
fi

# echo $debug_msg ${stemmers[@]}
# echo $debug_msg ${stemmer_names[@]}

if [ -d out/indices ]; then
    rm -r out/indices
fi
mkdir out/indices

for i in {0..2}; do
    build_index ${stemmers[i]} ${stemmer_names[i]}
done

echo $debug_msg - done!
echo
