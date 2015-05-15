# `pandoc`: Testreihe zu automatisch erzeugten Literaturverzeichnissen mit unterschiedlichen CSL-Dateien von [citationstyles.org](http://citationstyles.org/styles/)
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *hier mit:* `___csl_style___`

## Markdown-Quellcode des relevanten Teils dieser Seite

``` {.markdown}
i.  [@nonexistent]
i.  @nonexistent
i.  @z1 sagt blah.
i.  @z1 [p. 30] sagt blubb.
i.  @z1 [p. 30, mit Suffix] sagt blahblah.
i.  @z1 [-@z2 p. 30; siehe auch @z3] sagt blah-blubb.
i.  In einer Fußnote.[^1]
i.  Eine Zitat-Gruppe [siehe @z1 p. 34-35; ebenfalls @z3 chap. 3].
i.  Noch eine [siehe @z1 p. 34-35].
i.  Und noch eine, in einer Fußnote.[^2]
i.  Zitat mit einem *Suffix* und einem *Locator* [@z1 pp. 33, 35-37, und sonst nirgends].
i.  Zitat nur mit einem Locator [@z1 und sonst nirgends].
i.  Jetzt ein paar *Modifiers*[^3]...
i.  Mit etwas extra Markup [*siehe* @z1 p. **32**].

[^1]: Ein Zitat ohne Locators [@z3].

[^2]: Mehrere Zitate [siehe @z2 chap. 3; @z3; @z1].

[^3]: ...wie z.B. ein Zitat ohne Autor: [-@z1]. Und jetzt noch OStR Oster mit einem Locator [-@z2 p. 44].
```


<!--
    > In einem 'Block-Quote' behauptet @z2 [p. 44-46]

    +------------------+-----------------------------------+
    | Tabellen-Zeile:  | Hier                              |
    |                  | verweist @z1 [p.31] darauf        |
    +------------------+-----------------------------------+
-->

<!--
## Quellcode der `my-biblio.bib`-Datei

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

## Pandoc-Kommando zum Erzeugen dieser Seite

``` {.noweb}
csl=___csl_style___
pandoc -V geometry="paperwidth=21cm, paperheight=42cm, margin=0.5cm -V language=de-DE -V lang=ngerman \
       --highlight-style=espresso --filter=pandoc-citeproc --biblio=my-biblio.bib de---citations.mmd  \
       -o de---git.citation-styles.trunk---${csl}.pdf --csl ___csl_style___
```


## PDF-Ergebnis des Markdown-Codes

i.  [@nonexistent]
i.  @nonexistent
i.  @z1 sagt blah.
i.  @z1 [p. 30] sagt blubb.
i.  @z1 [p. 30, mit Suffix] sagt blahblah.
i.  @z1 [-@z2 p. 30; siehe auch @z3] sagt blah-blubb.
i.  In einer Fußnote.[^1]
i.  Eine Zitat-Gruppe [siehe @z1 p. 34-35; ebenfalls @z3 chap. 3].
i.  Noch eine [siehe @z1 p. 34-35].
i.  Und noch eine, in einer Fußnote.[^2]
i.  Zitat mit einem *Suffix* und einem *Locator* [@z1 pp. 33, 35-37, und sonst nirgends].
i.  Zitat nur mit einem Locator [@z1 und sonst nirgends].
i.  Jetzt ein paar *Modifiers*[^3]...
i.  Mit etwas extra Markup [*siehe* @z1 p. **32**].

[^1]: Ein Zitat ohne Locators [@z3].

[^2]: Mehrere Zitate [siehe @z2 chap. 3; @z3; @z1].

[^3]: ...wie z.B. ein Zitat ohne Autor: [-@z1]. Und jetzt noch OStR Oster mit einem Locator [-@z2 p. 44].

$x^2 + y^2 = 1$ @z1

# Literaturverzeichnis

