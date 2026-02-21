#set page(margin: 1.5in)
#set par(leading: 0.45em, justify: true)
#set text(font: ("CMU Serif", "David CLM"))
#show raw: set text(font: "New Computer Modern Mono")
#show heading: set block(above: 1.4em, below: 1em)
#show heading: set text(weight: "semibold")
#show title: set align(center)
#show title: set text(size: 24pt, weight: "medium")
#set text(lang: "he")

#title[כותרת -- Title]


= פרק ראשון


העיר (Jerusalem) מקודשת לשלוש הדתות האברהמיות: היהדות, הנצרות והאסלאם. היא הייתה המרכז הדתי והמדיני של חיי העם היהודי בימי קדם: בה שכן בית המקדש, והיא הייתה בירת ממלכת יהודה תחת בית דוד ושוב בימי בית חשמונאי ובית הורדוס. העיר שימשה מושא כמיהתו וכיסופיו של העם היהודי בגלות, והיא מוזכרת בהבלטה בסידור התפילה היהודי, בתפילות הנאמרות מדי יום, כמו תפילת שמונה עשרה וברכת המזון. משום חשיבותה הדתית לשלוש הדתות המונותאיסטיות הייתה לאורך הדורות מוקד למאבקים ולסכסוכים.

*this is bold*
_italic_,
- this
  - is
    - a
      - fucking

#set text(lang: "en")
= English Section
#lorem(66)
\ \
$
  v_A <==> exists lambda in RR : A v = lambda v , \; vec(1, 2, 3) dot mat(
    x, y, z; x_2, y_2, z_2;
    x_3, y_3, z_3
  ) overline(x)
$
\

#set text(lang: "he")
#columns(2, gutter: 24pt)[


  == דוגמא לטבלה
  #table(
    stroke: (x: none),
    columns: 2,
    [*מושג*], [*נוסחא*],
    [אינטגרל של פונקציה], [ $ integral_a^(b) f(x) quad d x $],
    [נגזרת של פונקציה], [ $ lim_(h-> 0) (f(x+h) - f(x))/(h) $],
    [This is fucking enlgish], [],
  )

  #colbreak()
  #set text(lang: "en")
  == Table Example

  #table(
    stroke: (x: none),
    columns: 2,
    [*The thing*], [*Formula*],
    [The Integral], [$ integral_(a)^(b) f(x) quad d x $],
    [The Derivative], [$ lim_(h -> 0) (f(x+h) - f(x))/(h) $],
  )
]

```
def eat_ass(ass):
  ass.eat()

```
