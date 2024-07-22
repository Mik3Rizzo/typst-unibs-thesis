/// Repeats the given content to fill the full space.
/// 
/// - gap (length, ratio): The gap between repeated items.
/// - justify (boolean): Whether to increase the gap to justify the items.
/// 
/// -> function
#let repeat(
  gap: none,
  justify: false,
  body
) = layout(size => style(styles => {
  let pt(length) = measure(h(length), styles).width
  let width = measure(body, styles).width
  let amount = calc.floor(pt(size.width + gap) / pt(width + gap))

  let gap = if not justify { gap } else {
    (size.width - amount * width) / (amount - 1)
  }
  
  let items = ((box(body),) * amount)
  if type(gap) == length and gap != 0pt {
    items = items.intersperse(h(gap))
  }

  items.join()
}))