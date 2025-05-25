#!/bin/bash

output_format="php"

if [ "$#" -eq 1 ]; then
    if [ "$1" == "html" ]; then
        output_format="html"
        echo "Building as .html"
    elif [ "$1" == "php" ]; then
        output_format="php"
        echo "Building as .php"
    else
        echo "Invalid argument. Usage: $0 [html|php]"
        exit
    fi
else
    echo "No argument provided. Usage: $0 [html|php]"
    exit
fi

replacement_link_extension=".$output_format)"

echo "(1) Copying folder structure"
rm -rf out/
cp -r in/ out/

echo "(2) Removing .md files from out/..."
cd out/
for i in $(find . -name "*.md");
do
    rm "$i"
done
cd ..

echo "(3) Creating temp folder"
mkdir -p temp/

echo "(4) Processing files"
cd in/
for i in $(find . -name "*.md");
do
    echo "    + $i"

    mkdir -p "../temp/$(dirname "${i}")"

    sed "s/\.md)/$replacement_link_extension/g" "$i" > "../temp/${i}"

    filename_without_ext="${i%.md}"

    pandoc "../temp/${i}" -o "../out/${filename_without_ext}.html" --template=../template.html

    if [ "$output_format" == "php" ]; then
        mv "../out/${filename_without_ext}.html" "../out/${filename_without_ext}.php"
    fi
done
cd ..

echo "(5) Cleaning up temporary files"
rm -rf temp/

echo "(6) Moving resources into build folder"
cp -r res/ out/

echo "Done"
