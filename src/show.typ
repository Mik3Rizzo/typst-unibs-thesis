#import "utils.typ": repeat

/// Shows the cover.
/// 
/// - logo (string): Path to the logo. The default is the logo of the University of Brescia.
/// - department (content, string): Department's name.
/// - degree (dictionary): Type and name of the degree.
/// - title (string): Thesis' title.
/// - supervisor (content, string): Thesis' supervisor.
/// - co-supervisor (content, string): Thesis' co-supervisor.
/// - candidate (dictionary): Name and ID of the candidate.
/// - academic-year (string): Academic year, like `"2023-2024"`.
/// - strings (dictionary): Strings used to change language. Should be a variable from the `strings` module, like `en_strings` or `it_strings` or a custom dictionary.
/// 
/// -> function
#let show-cover(
  logo: "", 
  department: "",  
  degree: (),
  title: "", 
  supervisor: "",
  co-supervisor: "",
  candidate: (), 
  academic-year: "", 

  strings: ()
) = {
  
  // Cover Settings
  set page(margin: (top: 2.5cm, bottom: 2cm, x: 2cm), header: none)
  set text(size: 16pt, font: "Avenir", weight: "medium")
  
  align(center)[

    // Logo
    #image("img/unibs_logo.svg", height: 3cm)
    
    #v(2fr) // fill vertical space to equally distribute blocks vertically

    // Department
    #block[
      #upper(department)
    ]
    
    // Degree
    #block[
      #set text(font: "Avenir Book")
      #degree.type\
      in #degree.name
    ]
    
    #v(2fr)

    // Title
    #block[
      #set text(size: 20pt)
      #strings.dissertation

      #upper(title)
    ]

  ]

  align(left)[

    #v(2fr)

    // Supervisor
    #block[
      #strings.supervisor: #h(5pt)
      #set text(font: "Avenir Book")
      #supervisor
    ]

    // Co-supervisor
    #if co-supervisor != none {
      block[
        #strings.co-supervisor: #h(5pt)
        #set text(font: "Avenir Book")
        #co-supervisor
      ]
    }

  ]

  align(right)[

    #v(1fr)

    // Candidate
    #block[
      #strings.candidate:\
      #set text(font: "Avenir Book")
      #candidate.name\
      #strings.candidate-id n. #candidate.id
    ]

  ]

  align(center)[

    #v(3fr)

    // Academic Year
    #line(
      length: 70%,
      stroke: 1pt,
    )
    #block[
      #strings.academic-year #academic-year
    ]
  ]

}

/// Shows the dedication.
/// 
/// - dedication (content, string): Dedication's content.
/// 
/// -> function
#let show-dedication(dedication: none) = {
  
  // Dedication Settings
  set page(header: none)
  set align(end + horizon)
  set text(style: "italic")

  block[
    #dedication
  ]
  // If the dedication is none, It would be printed a blank page
}

/// Shows the outline.
/// 
/// - title (string): Outline's title.
/// 
/// -> function
#let show-outline(title: none) = {

  // Outline Settings
  set page(numbering: "i")
  counter(page).update(1)

  // Copied from here
  show outline.entry: it => locate(loc => style(styles => {
    let max-page-width = calc.max(..range(1, counter(page).final(loc).first()).map(p => {
      measure(strong[#sym.space.en#p], styles).width
    }))

    it.body
    box(width: 1fr, align(right, repeat(gap: 5pt)[.]))
    box(width: max-page-width, align(right, it.page))
  })) // to here

  // Outline Entries Settings
  show outline.entry.where(level: 1): it => {
    v(0.5em)
    strong(it.body) + h(1fr) + strong(it.page)
  }

  outline(title: title, indent: 2em)

}

/// Shows the body.
/// 
/// - body (content, string): Thesis' body.
/// 
/// -> function
#let show-body(body: none) = {

  // Body Settings
  set page(numbering: "1", number-align: center)
  counter(page).update(1)

  set heading(numbering: "1.1")
  set par(justify: true)

  body
}

/// Shows the abstract.
/// 
/// - abstract (content, string): Thesis' abstract.
/// 
/// -> function
#let show-abstract(abstract: none) = {

  // Abstract Settings
  // TODO may be in the outline? 
  if abstract != none {

    set page(header: none)
  
    align(center)[
      #heading(outlined: false, numbering: none)[
        #smallcaps[Abstract]
      ]

      #set text(style: "italic")
      #abstract
    ]
  }
}

/// Shows the acknowledgements.
/// 
/// - title (string): Acknowledgements' title.
/// - acknowledgements (content, string): Acknowledgements' content.
/// 
/// -> function
#let show-acknowledgements(title: none, acknowledgements: none) = {
  
  // Acknowledgements Settings
  set page(numbering: "1", number-align: center)
  set par(justify: true)

  if acknowledgements != none {
    heading(outlined: true)[
      #title
    ]
    acknowledgements
  }
}

/// Shows the bibliography.
/// 
/// - bibliography (content): The bibliography obtained calling ```typst #bibliography()```.
/// 
/// -> function
#let show-bibliography(bibliography: none) = {
  
  // Bibliography Settings
  set page(numbering: "1", number-align: center)

  if bibliography != none {
    bibliography
  }
}

