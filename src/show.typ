#import "utils.typ": repeat

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

    // TODO align supervisor and co-supervisor names

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

#let show-body(body: none) = {

  // Body Settings
  set page(numbering: "1", number-align: center)
  counter(page).update(1)

  set heading(numbering: "1.1")
  set par(justify: true)

  body
}

#let show-abstract(abstract: none) = {

  // Abstract Settings
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

#let show-acknowledgements(title: none, acknowledgements: none) = {
  
  // BUG page numbers missing
  if acknowledgements != none {
    heading(outlined: true)[
      #title
    ]
    acknowledgements
  }
}

#let show-bibliography(bibliography: none) = {
  // BUG page numbers missing
  if bibliography != none {
    bibliography
  }
}

