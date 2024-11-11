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

This thesis template is aimed at students of the University of Brescia. 

You can use it in the Typst *web app*, creating a new project. The short way to do so is the following link: #link("https://typst.app/?template=" + package-meta.name + "&version=latest").

You can also use it *locally*, with the following command:

#raw(
  block: true,
  lang: "bash",
  "typst init @preview/" + package-meta.name
)

Please, take a look at the document created by the template: the usage should be easy and clear at a first sight. If you are new to Typst, check out the documentation: https://typst.app/docs/.

The rest of this manual shows the functions offered by this package: it is useful if you want to know what customization options are available, or if you're not sure what parts of the template package do.

As a university-specific template, this package may not offer enough configurability to be used at different institutions. Feel free to adapt it to you needs and also to open a Github issue or pull request.


= Modules reference

In this sections are showed the modules of the template. 

The most relevant module is explained in the @unibs-thesis-lib: the other modules are used by the latter.

== `unibs-thesis.lib` <unibs-thesis-lib>

The template's main module. It contains the one and only function that should be called from your project.

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

It is possible to define a custom `strings` dictionary respecting the needed fields, for example:

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
  introduction-title: "Introduzione",
  acknowledgements-title: "Ringraziamenti"
)
```

== `unibs-thesis.show`

This module contains visualization methods, called by the `lib` module.

#{
  let module = tidy.parse-module(
    read("/src/show.typ"),
    scope: scope,
  )
  tidy.show-module(
    module,
    sort-functions: none,
    style: tidy.styles.minimal,
  )
}

== `unibs-thesis.custom`

This module contains custom ```typst #show``` methods for various elements, called by the `show` module. 

#{
  let module = tidy.parse-module(
    read("/src/custom.typ"),
    scope: scope,
  )
  tidy.show-module(
    module,
    sort-functions: none,
    style: tidy.styles.minimal,
  )
}

== `unibs-thesis.utils`

This module contains utils methods.

#{
  let module = tidy.parse-module(
    read("/src/utils.typ"),
    scope: scope,
  )
  tidy.show-module(
    module,
    sort-functions: none,
    style: tidy.styles.minimal,
  )
}

== `unibs-thesis.img`

This directory contains images used in the template, like the logo of the University of Brescia.
