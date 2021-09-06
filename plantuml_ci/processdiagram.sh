#!/bin/bash
git clone https://victor89:$PAT@dev.azure.com/victor89/LDC-DEMO/_git/LDC-DEMO
cd LDC-DEMO
mkdir -p images
for i in *.puml; do
    [ -f "$i" ] || break
    newFileName=${i/.puml/.png}
    finalFileName="images/${newFileName}"
    cat "$i" | java -Djava.awt.headless=true -jar ../plantuml.jar -p -tpng > $finalFileName
done

git config --global user.email "ci-update@some-org.com"
git config --global user.name "CI Build Agent"

git add .
git commit -m "CI Pipeline diagram update [skip ci]"
git push
