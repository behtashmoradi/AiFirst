# Design Rules

## Tokens (`:root`)
- Colors: `--color-blue #0071e3` (accent), `--color-offBlack #0f1012`, `--color-greyDark #1d1e20`, `--color-greyLight #efefef`, `--color-greyLighter #f8f8f8`, `--color-offWhite #f2f2f4`, `--color-white #fff`, `--color-green #00b982`, `--color-orange #ff5102`, `--color-yellow #fca311`.
- Grid: 5 columns, `--grid-gutter: 2.3980815348vw`, `--grid-outerGutter: 4.7961630695vw`.
- Base type: `font-weight: 350`, antialiased, slight negative letter-spacing (-.01em body, -.025em headings).

## Layout
- Align content to the 5-column grid. At 1226px the columns start at 59 / 286 / 514 / 742 / 969px.
- Section labels sit in column 2; body copy starts in column 3.
- Light and dark sections alternate. Sections have fixed heights taken from the reference.

## Components
- **Label**: a small grey number or kicker above a 15px title (e.g. `0.1 / Our Mission`).
- **Pill**: 30px tall, fully rounded, 1px blue outline with blue text; fills blue on hover or when primary.
- **Arrow pill**: 28×17px outlined capsule holding a small → arrow.
- **Nav**: a 57px round logo button beside a 56px-tall, 12px-radius `#efefef` bar of 120px links.
- **Accent marks**: blue brackets `[ ]`, a blue dash above fact labels, blue highlight phrases.

## Responsive
- Below 800px: 16px gutters, everything stacks into one column, secondary nav links are hidden, and fixed section heights become auto.
