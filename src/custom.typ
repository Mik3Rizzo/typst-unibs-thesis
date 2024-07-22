/// Custom heading.
/// 
/// - it (content): Content.
/// 
/// -> function
#let custom-heading(it) = {
  block([
    #set text(fill: gray, weight: "bold")
    #counter(heading).display()
    #h(5pt)
    #set text(fill: black)
    #it.body
  ], above: 1.5em, below: 1em)
}

/// Custom level 1 heading.
/// 
/// - it (content): Content.
/// - chapter-string (string): The prefix to the chapter's number.
/// 
/// -> function
#let custom-heading-level-1(it, chapter-string: "") = {

  block([

    #v(2.75em)

    #if it.numbering != none {

      let heading-number = counter(heading).display()
      set text(fill: gray, weight: "bold")
      
      block([
        #chapter-string #heading-number
      ], below: 1.5em)

    }

    #set text(fill: black, weight: "bold")
    #it.body

  ], below: 2em)

}