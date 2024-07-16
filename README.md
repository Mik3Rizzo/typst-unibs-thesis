# Unibs Thesis Template - 0.1.0

Typst thesis template for the University of Brescia (UniBS).

## Getting Started

To use the template in your project:

```typ
#import "@preview/unibs-thesis:0.1.0": thesis
```

Please note that, as suggested by the University of Brescia, the template uses _Avenir_ and _Avenir Book_ fonts, which can be obtained [here](https://globalfonts.pro/global_files/5c30d7d12872184070bc871e/avenir.zip).

## Usage

A very basic usage:

```typ
#show: thesis.with(
  department: "Department of Information Engineering",  
  degree: (type: "Master's degree", name: "Computer Engineering"),
  title: "Thesis Title", 
  supervisor: "Prof. Mario Rossi", 
  candidate: (name: "Ilaria Bianchi", id: "706252"), 
  academic-year: "2023/2024", 

  abstract: #lorem(100), 
  bibliography: bibliography("bib.yaml", full: true)
)

= Introduction
#lorem(300)
```

A manual will be added in the future.
