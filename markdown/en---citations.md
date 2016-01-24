# `pandoc`: Test Series for automatically generated bibliographies using different CSL files from [citationstyles.org](http://citationstyles.org/styles/)
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *here using:* `___csl_style___`

## Markdown source code for relevant port of this page

``` {.markdown}
i.  [@nonexistent]
i.  @nonexistent
i.  @z1 says fooo.
i.  @z1 [p. 30] says baaar.
i.  @z1 [p. 30, with suffix] says blahblah.
i.  @z1 [-@z2 p. 30; see also @z3] says blah-blubb.
i.  In a footnote.[^1]
i.  A citation group [see  @z1 p. 34-35; also @z3 chap. 3].
i.  Another one [see @z1 p. 34-35].
i.  And still anoter, in a footnote.[^2]
i.  Quote with a *suffix* and a *locator* [@z1 pp. 33, 35-37, and nothing else].
i.  Quote with only one locator [@z1 and nowhere else].
i.  Now a few *modifiers*[^3]...
i.  With some extra Markup [*see* @z1 p. **32**].
i.  Jane Doz doesnt like me [***see*** **@z4**].

[^1]: A citation without locators [@z3].

[^2]: Multiple citations [siehe @z2 chap. 3; @z3; @z1].

[^3]: ...like a quote without author: [-@z1]. And now OStR Oster with a locator [-@z2 p. 44].

$x^2 + y^2 = 1$ @z1
```

<!--
## Source code of the `my-biblio.bib` file

``` {.bibtex}
@Book{z1,
author="Thales von Milet",
title="Doppelwinkel-Funktionen",
url="http://de.wikipedia.org/wiki/Formelsammlung_Trigonometrie#Doppelwinkelfunktionen",
year="600 v.Chr.",
address="Milet, Kleinasien",
publisher="Wikipedia"
}

@Article{z2,
author="OStR Dr. math.nat. Oster",
title="Unterrichtsmaterialen für Klasse 9 (Mittelstufe)",
year="1969",
journal="Journal of Generic Studies",
volume="9",
pages="33-34"
}

@InCollection{z3,
author="Elvis Presley, Madonna and Pink Floyd",
title="Kombinatorik Hypergeometrischer Verteilungen",
booktitle="Wiederholungslose Auswahlprobleme",
editor="Cleopatra, Königin von Ägypten",
publisher="Steintafeln Moses GmbH & Co. KG",
address="Gizeh",
year="30 v.Chr."
}
```
-->

## Pandoc command to generate this document

``` {.noweb}
csl=___csl_style___
pandoc -V geometry="paperwidth=21cm, paperheight=42cm, margin=0.5cm -V language=de-DE -V lang=ngerman \
       --highlight-style=espresso --filter=pandoc-citeproc --biblio=my-biblio.bib de---citations.mmd  \
       -o de---git.citation-styles.trunk---${csl}.pdf --csl ___csl_style___
```


## Document output of Markdown code

i.  [@nonexistent]
i.  @nonexistent
i.  @z1 says fooo.
i.  @z1 [p. 30] says baaar.
i.  @z1 [p. 30, with suffix] says blahblah.
i.  @z1 [-@z2 p. 30; see also @z3] says blah-blubb.
i.  In a footnote.[^1]
i.  A citation group [see  @z1 p. 34-35; also @z3 chap. 3].
i.  Another one [see @z1 p. 34-35].
i.  And still anoter, in a footnote.[^2]
i.  Quote with a *suffix* and a *locator* [@z1 pp. 33, 35-37, and nothing else].
i.  Quote with only one locator [@z1 and nowhere else].
i.  Now a few *modifiers*[^3]...
i.  With some extra Markup [*see* @z1 p. **32**].
i.  Jane Doz doesnt like me [***see*** **@z4**].

[^1]: A citation without locators [@z3].

[^2]: Multiple citations [siehe @z2 chap. 3; @z3; @z1].

[^3]: ...like a quote without author: [-@z1]. And now OStR Oster with a locator [-@z2 p. 44].

$x^2 + y^2 = 1$ @z1


# Bibliography

