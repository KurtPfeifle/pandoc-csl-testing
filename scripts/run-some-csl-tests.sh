#!/bin/bash
# 
# (C) 2015, Kurt Pfeifle
#
# Skript to run CSL tests for documents generated by Pandoc from Markdown

my_biblio="../resources/my-csl-testing.bib"
#my_markdown="../markdown/de---citations.md"
my_markdown="../markdown/en---citations.md"
my_output="../output"
my_logdir="../logdir"

mkdir ${my_output} ${my_logdir}

#my_highlight_style="zenburn"
#my_highlight_style="tango"
#my_highlight_style="haddock"
#my_highlight_style="monochrome"
#my_highlight_style="kate"
#my_highlight_style="pygments"
my_highlight_style="espresso"

authormeta='John McFarlane and Kurt Pfeifle'
titlemeta='Testing CSL-Styles with pandoc'

#latex_engine="xelatex"
#latex_engine="lualatex"
latex_engine="pdflatex"

my_pandoc_options="             \
-V geometry=paperwidth=21cm     \
-V geometry:paperheight=42cm    \
-V geometry:margin=0.5cm        \
-V language=de-DE               \
-V lang=ngerman                 \
--highlight-style=${my_highlight_style} \
--filter=pandoc-citeproc        \
--standalone                    \
--self-contained                \
--webtex                        \
--latex-engine=${latex_engine}      \
--biblio=${my_biblio}"

#-V hypersetup:author-meta=\"${authormeta}\" \
#-V hypersetup:title-meta=\"${titlemeta}\" \
#-H ../resources/usepackagefontspec.tex \

PATH=$HOME/.cabal/bin:$PATH

#time for csl in ~/svn-git-stuff/git.csl-styles/*.csl; do
time for csl in ~/svn-git-stuff/git.csl-styles/{thomson-reuters-legal-tax,triangle,universidade-de-sao-paulo-instituto,wissenschaftlicher-industrielogistik-dialog,stuttgart-media-university,thieme-e-journals-vancover,rapid-communications-in-mass-spectrometry,rtf-scan,small,multiple-sclerosis-journal,norma-portuguesa-405,lluelles-lexisnexis}*.csl; do
xelatex-mit-var-de---git.citation-styles.trunk---wissenschaftlicher-industrielogistik-dialog.pdf
    cslname=$(basename "${csl}")

    # There are some "small" .csl files in this repo which do no work;
    # I dunno if they are only "stubs" and not meant to work at all;
    # filter them out by running a stupid file size comparison:
    if [ $(stat -f "%z" "${csl}") -gt 2000 ]; then

        ######## LaTeX/PDF... ##########################################################
        # Echo the command to the terminal first, so I know what's currently going on...
        echo "cat  ${my_markdown}                                               \
              |  sed 's#___csl_style___#'"${cslname}"'#'                        \
              | pandoc ${my_pandoc_options}                                     \
                --csl ${csl}                                                    \
                -o ${my_output}/${latex_engine}---pandoc-csl-testing---${cslname/.csl/.pdf}  \
                -
             " | sed 's#  *# #g'

             # Nor run the thing...
              cat  ${my_markdown}                                               \
              |  sed 's#___csl_style___#'"${cslname}"'#'                        \
              | pandoc ${my_pandoc_options}                                     \
                --csl ${csl}                                                    \
                -o ${my_output}/${latex_engine}---pandoc-csl-testing---${cslname/.csl/.pdf}  \
                -

        return_value=$?
        touch ${my_logdir}/${latex_engine}---git.pandoc-csl-testing.log
        if [ "x${return_value}" != "x0" ]; then
            echo -n " $(date)  :   ERROR processing source Markdown file ${my_markdown} with ${latex_engine} + style file ${cslname}" \
                  | tee -a ${my_logdir}/${latex_engine}---git.pandoc-csl-testing.log
            echo  | tee -a ${my_logdir}/${latex_engine}---git.pandoc-csl-testing.log
        fi

        ######## HTML... ###############################################################
        # Echo the command to the terminal first, so I know what's currently going on...
        echo "cat  ${my_markdown}                                       \
              |  sed 's#___csl_style___#'"${cslname}"'#'                \
              | pandoc ${my_pandoc_options}                             \
                --csl ${csl}                                            \
                --standalone                                            \
                -o ${my_output}/html---pandoc-csl-testing---${cslname/.csl/.html}    \
                -
             " | sed 's#  *# #g'

             # Nor run the thing...
              cat  ${my_markdown}                                       \
              |  sed 's#___csl_style___#'"${cslname}"'#'                \
              | pandoc ${my_pandoc_options}                             \
                --csl ${csl}                                            \
                --standalone                                            \
                -o ${my_output}/html---pandoc-csl-testing---${cslname/.csl/.html}    \
                -

        return_value=$?
        touch ${my_logdir}/html---git.pandoc-csl-testing.log
        if [ "x${return_value}" != "x0" ]; then
            echo -n " $(date)  :   ERROR converting source Markdown file ${my_markdown} + style file ${cslname} to HTML" \
                  | tee -a ${my_logdir}/html---git.pandoc-csl-testing.log
            echo  | tee -a ${my_logdir}/html---git.pandoc-csl-testing.log
        fi

        ######## EPUB3... ##############################################################
        # Echo the command to the terminal first, so I know what's currently going on...
        echo "cat  ${my_markdown}                                   \
              |  sed 's#___csl_style___#'"${cslname}"'#'            \
              | pandoc ${my_pandoc_options}                         \
                --csl ${csl}                                        \
                --standalone                                        \
                --to=epub3                                          \
                -o ${my_output}/epub3-pandoc-csl-testing---${cslname/.csl/.epub} \
                -
             " | sed 's#  *# #g'

             # Nor run the thing...
              cat  ${my_markdown}                                   \
              |  sed 's#___csl_style___#'"${cslname}"'#'            \
              | pandoc ${my_pandoc_options}                         \
                --csl ${csl}                                        \
                --standalone                                        \
                --to=epub3                                          \
                -o ${my_output}/epub3-pandoc-csl-testing---${cslname/.csl/.epub} \
                -

        return_value=$?
        touch ${my_logdir}/epub3---git.pandoc-csl-testing.log
        if [ "x${return_value}" != "x0" ]; then
            echo -n " $(date)  :   ERROR converting source Markdown file ${my_markdown} + style file ${cslname} to EPUB3" \
                  | tee -a ${my_logdir}/epub3---git.pandoc-csl-testing.log
            echo  | tee -a ${my_logdir}/epub3---git.pandoc-csl-testing.log
        fi

    else
            echo "${csl} is not a decent CSL style file: filesize is only $(stat -f "%z" "${csl}") Bytes." \
                  | tee -a ${my_logdir}/epub3---git.pandoc-csl-testing.log
            echo  | tee -a ${my_logdir}/epub3---git.pandoc-csl-testing.log
    fi

done

echo
echo "ERRORS for EPUB3 output:"
    grep ERROR ${my_logdir}/epub3---git.pandoc-csl-testing.log
echo

echo "ERRORS for HTML output:"
    grep ERROR ${my_logdir}/html---git.pandoc-csl-testing.log
echo

echo "ERRORS for PDF output:"
    grep ERROR ${my_logdir}/*latex---git.pandoc-csl-testing.log
echo

## Now look at the actual files generated by above commands;
## Linux users have to use `xdg-open` instead of `open`:
#open ${my_output}/epub3-pandoc-csl-testing---*.epub
#open ${my_output}/html---pandoc-csl-testing---*.html
open ${my_output}/*latex---pandoc-csl-testing---*.pdf
# xdg-open ${my_output}/epub3---pandoc-csl-testing---*.epub
# xdg-open ${my_output}/html---pandoc-csl-testing---*.html
# xdg-open ${my_output}/*latex---pandoc-csl-testing---*.pdf

