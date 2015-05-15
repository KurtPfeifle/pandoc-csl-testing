#!/bin/bash
#
# (c) 2015 Kurt Pfeifle
#
# 

mkdir ../images 2>/dev/null

for img in ../output/*latex---pandoc-csl-testing---*.pdf ; do
    csl=${img/pdflatex---pandoc-csl-testing---/}
    csl=${csl/pdflatex---pandoc-csl-testing---/}
    csl=${csl/pdflatex---pandoc-csl-testing---/}
    csl=${csl/.pdf/.csl}
    convert                         \
        ${img}[0]                   \
        -background '#0000'         \
        -frame 1                    \
        -alpha on                   \
         +write mpr:a -delete 0     \
        \(                          \
            mpr:a[530x350+0+083]    \
            mpr:a[595x280+0+527]    \
            mpr:a[595x380+0+804]    \
        +append                     \
        \)                          \
        +repage                     \
        \( -size 560x80 -background '#0008' -fill white -gravity center caption:" CSL style file: $(basename ${csl/.pdf/.csl}) " \) \
        -gravity south              \
        -geometry -32+10            \
        -composite                  \
        ${img/.pdf/.png}
    mv ${img/.pdf/.png}  ../images/
done

open ../images/*.png
