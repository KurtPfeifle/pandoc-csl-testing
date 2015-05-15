# Testing and Using CSL Style Files with Pandoc

> Scripts and Howtos about using different CSL (Citation Style Language) files with Pandoc.

Pandoc can insert an automatically generated citation list into documents converted from Markdown (or ASCIIdoc -- but I haven't tested that so far).
This works for output types LaTeX/PDF/Beamer as well as for HTML/EPUB/EPUB3, HTML Slide formats (DZSlide, Slidy, Slideous, S5 and RevealJS), DOCX, ODT and DocBook.

The following command line parameters are required to run the tests covered by this repository:

    --bibliography=/path/to/my.bib   \
    --csl=/path/to/my.csl            \
    --filter=/path/to/pandoc-citeproc

But users are often unsure how to insert the citation Markdown code into their source files.
And frequently they are surprised how the generated output looks in the final document.

However, often it is the used **[CSL style](http://en.wikipedia.org/wiki/Citation_Style_Language)** file which manipulates the output in a surprising way.

Users (as well as developers of CSL styles) can use the scripts and example files provided here to check and verify a specific configuration they use, or find an alternative one which they like better.
The CSL file does not only determine the look of the bibliography section of the document.
It excerts its influence in four distinct areas, formatting also the look and feel, and even *the actual text contents* of other parts of the document:

1. The footnotes of pages including citations.
1. The references to the citation.

See [the example gallery](example-gallery.md) for a few remarkable examples depicting some results for PDF files.

# Prerequisites

On top of a current, working `pandoc` installation (including a working LaTeX installation for PDF output), you need to have two more elements:

1. **A `.bib` file with the list of used bibliographic resources.**
1. **A few CSL files you want to test.**


# Steps to follow

Follow these step if you want to test a ***lot*** of different CSL styles. (This works for Linux and Mac OS X users -- Windows users must apply a few modifications):

1. **Create `.bib` file with the list of used bibliographic resources.**

    This file can be seen as your personal "database of references".
    It must be formatted in a specific way.
    (There are many tools out there, like **[Zotero](https://www.zotero.org/)** and others, which help you create and maintain your .bib file(s).
    But dealing with that is beyond the scope of this project.)

    The `my-csl-testing.bib` provideded here is a .bib file with a few dummy entries.
    It can be used as a template to model your own .bib files after.
    It is required to run the test script.
    (I'm myself by no way an expert in this field: I've created the scripts here first of all for *myself*, in order to find out how things work, and how the different outputs would look like.)

1. **Access to all the CSL files you want to test.**

    I recommend to clone the GitHub repo of **[citationstyles.org](http://citationstyles.org)**:

        cd $HOME
        mkdir svn-git-stuff
        cd svn-git-stuff
        git clone https://github.com/citation-style-language/styles.git git.csl-styles

    This repo currently weights about 75 MBytes.
    There are more than 1000 different CSL style files in there!

1. **Clone this repository here.**

        cd ~/svn-git-stuff
        git clone https://github.com/KurtPfeifle/pandoc-csl-testing.git git.pandoc-csl-testing

1. **Run the testscript**

        cd ~/svn-git-stuff/git.pandoc-csl-testing/scripts
        bash run-some-csl-tests.sh

    The script `run-some-csl-tests.sh` is designed to run out of the box.
    It generates PDF, HTML and EPUB3 output.
    Other output formats can be enabled by editing the script.

    The `run-all-csl-tests.sh` script requires you to do some editing first.
    You want to enable DOCX or ODT output?
    Do you ***really*** want to generate a test output document showing 1100 different citation styles?!? -- 
    Decide, edit, then run.

# Caveats

I've not tested the scripts contained here on Linux (yet).
My main personal focus is to test the PDF output -- so I haven't tested EPUB3 or HTML output much either (yet).
This version is a short-term, quick'n'dirty cleaned up modification from my private local resources.
I made it because a friend asked me to get a copy.
Now the whole (Pandoc) world can also.

Please tell me where I have br0ken things.
Pull requests are accepted if they are generally useful.

# Roadmap

I will add DOCX and ODP tests soon.

# Credits

Thank you, John McFarlane, for this wonderful tool Pandoc is today!
The initial Markdown file used in these tests was inspired by one provided by John McFarlane somewhere on the 'Net.

