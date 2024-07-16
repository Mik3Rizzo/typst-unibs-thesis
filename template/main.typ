#import "@preview/unibs-thesis:0.1.0": thesis

#show: thesis.with(

  department: "Department of Information Engineering",  
  degree: (type: "Master's degree", name: "Computer Engineering"),
  title: "Design and Development of \na Tracking and Tracing application", 
  supervisor: "Prof. Barbara Rita Barricelli", 
  candidate: (name: "Michele Rizzo", id: "706252"), 
  academic-year: "2023/2024", 

  abstract: [#lorem(200)], 
  dedication: [#lorem(6) \ #lorem(10) \ #lorem(8)], 
  acknowledgements: [#lorem(300)],
  bibliography: bibliography("bib.yaml", full: true),
)


// Chapters
= Introduction
#lorem(40)

== Section
#lorem(40)

=== Subsection
#lorem(40)

==== Subsection
#lorem(40)

===== Subsection
#lorem(40)

== Section
#lorem(80)

#lorem(40)

=== Subsection
#lorem(40)

= Another Chapter
#lorem(300)