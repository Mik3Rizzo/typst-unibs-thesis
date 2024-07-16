#import "@preview/hydra:0.5.0": hydra, selectors

#import "show.typ": *
#import "custom.typ": *

/// The main template function. Your document will generally start with ```typ #show: thesis(...)```, 
/// which it already does after initializing the template.
/// 
/// - language (string): Language in which the thesis is written; `"it"` and `"en"` are supported. 
///   The choice of language influences certain texts on the title page and in headings.
/// - logo (string): Path to the logo. The default is the logo of the University of Brescia.
/// - department (content, string): Department's name.
/// - degree (dictionary): Type and name of the degree.
/// - title (string): Thesis' title.
/// - supervisor (content, string): Thesis' supervisor.
/// - co-supervisor (content, string): Thesis' co-supervisor.
/// - candidate (dictionary): Name and ID of the candidate.
/// - academic-year (string): Academic year, like `"2023-2024"`.
/// - strings (dictionary): Strings used to change language; for example, for italian you should set the fields like this: ```typ dissertation: "Tesi di Laurea", supervisor: "Relatore", co-supervisor: "Correlatore", candidate: "Laureando", candidate-id: "Matricola", academic-year: "Anno Accademico", chapter: "Capitolo", outline-title: "Indice", acknowledgements-title: "Ringraziamenti"```.
/// - abstract (content, string): Thesis' abstract.
/// - dedication (content, string): Thesis' dedication.
/// - acknowledgements (content, string): Thesis' acknowledgements.
/// - bibliography (content, string): Thesis' bibliography. Should be something like ```typ #bibliography("bib.yaml")```.
/// - body (content): Thesis' body.
/// 
/// -> function
#let thesis(
  language: "en", 
  logo: "img/unibs_logo.svg", 

  department: "Department of Something",  
  degree: (type: "Master's degree", name: "Something Engineering"),
  title: "Thesis Title", 
  supervisor: "Prof. Name Surname", 
  co-supervisor: none,
  candidate: (name: "Name Surname", id: "123456"), 
  academic-year: "20xx/20xx", 

  strings: (
    dissertation: "Dissertation",
    supervisor: "Supervisor",
    co-supervisor: "Co-supervisor", 
    candidate: "Candidate", 
    candidate-id: "ID", 
    academic-year: "Academic Year",

    chapter: "Chapter",

    outline-title: "Outline",
    acknowledgements-title: "Acknowledgements"
  ), 

  abstract: none, 
  dedication: none, 
  acknowledgements: none,
  bibliography: none,

  body
) = {

  // TODO do dynamic language management
  
  // Document Settings
  set document(author: candidate.name, title: title)
  set page(paper: "a4", margin: (top: 3.5cm, rest: 3cm)) // TODO change
  set text(font: "New Computer Modern", size: 12pt, lang: language)  // same as LaTeX
  set par(first-line-indent: 1.5em)

  show math.equation: set text(weight: 400)
  show link: underline

  // Header Settings
  // TODO the header should be "Chapter 1. First chapter"
  // Now it is "1 First chapter"
  set page(header: context {

    let chapter = hydra(1, skip-starting: true)

    if chapter != none {
      align(right)[
        #block([
          #emph(chapter)
        ], below: 0.5em)
      ]
      line(length: 100%, stroke: 0.5pt)
    }
  })

  // Heading Settings
  show heading: it => custom-heading(it)
  show heading.where(level: 1): it => custom-heading-level-1(it, chapter-string: strings.chapter)
  show heading.where(level: 1): it => pagebreak(weak: true) + it  // new page every chapter

  show heading.where(level: 1): set text(size: 1.4em)
  show heading.where(level: 2): set text(size: 1.3em)
  show heading.where(level: 3): set text(size: 1.2em)
  show heading.where(level: 4): set text(size: 1.1em)
  show heading.where(level: 5): set text(size: 1.0em)

  // Cover Page
  show-cover(logo: logo, department: department,  degree: degree, title: title, supervisor: supervisor, co-supervisor: co-supervisor, candidate: candidate,  academic-year: academic-year, strings: strings)

  // Dedication
  show-dedication(dedication: dedication)

  // Outline
  show-outline(title: strings.outline-title)

  // Abstract
  show-abstract(abstract: abstract)

  // Body
  show-body(body: body)
  
  // Acknowledgements
  show-acknowledgements(title: strings.acknowledgements-title, acknowledgements: acknowledgements)

  // Bibliography
  show-bibliography(bibliography: bibliography)

}

