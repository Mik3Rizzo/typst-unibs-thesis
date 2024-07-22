#import "@preview/tidy:0.3.0"
#import "@preview/crudo:0.1.0"

#import "template.typ": *

#import "/src/lib.typ" as template

#let package-meta = toml("/typst.toml").package
// the scope for evaluating expressions and documentation
#let scope = (template: template)

#show: project.with(
  title: "University of Brescia thesis template",
  authors: package-meta.authors.map(a => a.split("<").at(0).trim()),
  abstract: [
    A thesis template for students of the University of Brescia.
  ],
  url: package-meta.repository,
  version: package-meta.version,
  date: datetime.today(),
)

= Introduction

This template is aimed at students of the University of Brescia. 

You can use it in the Typst *web app*, creating a new project. The short way to do so is the following link: #link("https://typst.app/?template=" + package-meta.name + "&version=latest").

You can also use it *locally*, with the following command:

#raw(
  block: true,
  lang: "bash",
  "typst init @preview/" + package-meta.name
)

Please, take a look at the document created by the template. The usage should be easy and clean at a first sight. If you have not yet initialized the template, a rendered version is linked in the README. If you are new to Typst, also check out the Typst documentation: https://typst.app/docs/.

The rest of this manual shows the functions offered by this package: it is useful if you want to know what customization options are available, or if you're not sure what parts of the template package do.

As a university-specific template, this package may not offer enough configurability to be used at different institutions. Feel free to adapt it to you needs and also to open a Github issue or pull request.


= Module reference

== `unibs-thesis.lib`

The template's main module. All functions that need to be called are directly exported from this module.

#{
  let module = tidy.parse-module(
    read("/src/lib.typ"),
    scope: scope,
  )
  tidy.show-module(
    module,
    sort-functions: none,
    style: tidy.styles.minimal,
  )
}

== `unibs-thesis.strings`

This module contains `strings` variables for various languages. Currently only english and italian are supported.

#{
  let module = tidy.parse-module(
    read("/src/strings.typ"),
    scope: scope,
  )
  tidy.show-module(
    module,
    sort-functions: none,
    style: tidy.styles.minimal,
  )
}

It is possible to define a custom `strings` dictionary, for example:

```typst
custom_strings = (
  dissertation: "Tesi di Laurea", 
  supervisor: "Relatrice", 
  co-supervisor: "Correlatore", 
  candidate: "Candidata", 
  candidate-id: "Matricola", 
  academic-year: "Anno Accademico", 
  chapter: "Capitolo",  
  outline-title: "Indice dei contenuti", 
  acknowledgements-title: "Ringraziamenti"
)
```


== `unibs-thesis.img`

Contains images used in the template, like the logo of the University of Brescia.
