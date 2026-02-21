# LaTeX ו-Typst בעברית

ברירות מחדל, תבניות ודוגמאות לעבודה עם LaTeX ו-Typst בעברית — כולל פתרונות לבעיות נפוצות בטיפוגרפיה דו-כיוונית.

---

## דרישות

### LaTeX

| מערכת הפעלה | התקנה |
|-------------|--------|
| macOS | [MacTeX](https://www.tug.org/mactex/) — מכיל את TeX Live, latexmk ועוד |
| Linux | [TeX Live](https://www.tug.org/texlive/) |
| Windows | [MiKTeX](https://miktex.org/) או [TeX Live](https://www.tug.org/texlive/) |

### Typst

```bash
brew install typst          # macOS עם Homebrew
```

או הורדה ישירה מ-[typst.app](https://typst.app/) / [GitHub](https://github.com/typst/typst/releases).

### פונטים עבריים

המסמכים משתמשים בפונטים מחבילת [Culmus](http://culmus.sourceforge.net/):

- **David CLM** — פונט serif עברי
- **Miriam Mono CLM** — פונט monospace עברי

פונטים אלה כלולים ב-MacTeX/TeX Live לצורכי pdfLaTeX. עבור **XeLaTeX ו-LuaLaTeX** (שמשתמשים בפונטי מערכת), יש להתקין אותם גם כפונטי מערכת:

```bash
# macOS — הורדה מאתר Culmus והתקנה ידנית, או:
brew install --cask font-culmus   # אם קיים ב-homebrew-cask-fonts
```

לחלופין, אפשר להשתמש ב-**Times New Roman** (מותקן כברירת מחדל ב-macOS) כפי שמודגם בחלק מהדוגמאות.

---

## מבנה הפרויקט

```
.
├── defaults/                        # תבניות בסיסיות — נקודת התחלה לכל מנוע
├── engines/                         # קבצי ייחוס לכל מנוע
│   ├── pdftex/
│   │   ├── pdftex-example.tex       # דוגמה כללית
│   │   └── pdftex-overview.tex      # סקירת המנוע, יתרונות/חסרונות
│   ├── xetex/
│   │   ├── xetex-example.tex
│   │   └── xetex-overview.tex
│   ├── luatex/
│   │   ├── luatex.tex               # תבנית מודרנית קנונית
│   │   ├── luatex-overview.tex      # סקירת המנוע
│   │   └── migration-from-luabidi.tex  # מעבר מ-luabidi ל-bidi=basic
│   └── typst/
│       ├── example.typ
│       └── typst-overview.typ
└── examples/                        # אותו מסמך במנועים שונים
    └── math-hebrew-article/         # מאמר מתמטי — pdf / xetex / lua / typst
```

קבצי פלט (PDF) מיוצרים לתיקיית `out/` בכל תיקייה (מוגדר ב-`.latexmkrc`).

---

## מנועים

### pdfLaTeX — מנוע ברירת המחדל

המנוע הוותיק, הנפוץ והמהיר ביותר. תמיכה בסיסית בעברית דרך [Babel](https://ctan.org/pkg/babel).

```latex
\usepackage[english,hebrew]{babel}
```

**יתרונות:** מהיר, מינימום boilerplate, נתמך בכל מקום.
**חסרונות:** כל מילה באנגלית בתוך טקסט עברי חייבת לעטוף ידנית (`\L{word}`), טבלאות מסובכות לעיצוב, אין גמישות בפונטים.

---

### XeLaTeX

תומך בפונטי מערכת ו-BiDi חלקי-אוטומטי.

```latex
\usepackage[english, hebrew, provide=*, bidi=default, layout=tabular]{babel}
```

**יתרונות:** פונטי מערכת (David CLM וכד׳), מילים בודדות באנגלית עוברות אוטומטית.
**חסרונות:** רשימות ממוספרות מתנהגות לא תקין, BiDi לא מלא.

---

### LuaLaTeX — מומלץ (2025+)

המנוע המודרני ביותר. BiDi אוטומטי מלא עם `bidi=basic`.

```latex
\usepackage[bidi=basic, layout=tabular]{babel}
\babelprovide[main, import]{hebrew}
\babelfont[hebrew]{rm}[Renderer=Harfbuzz]{David CLM}
```

**יתרונות:** BiDi אוטומטי, פונטי מערכת, טבלאות תקינות, מתוחזק באופן פעיל.
**חסרונות:** זמן קומפילציה ארוך יותר, בחירת טקסט מה-PDF עלולה להתנהג לא תקין.

> **שים לב:** **אין** להשתמש בחבילת `luabidi` יחד עם `bidi=basic` — הן מתנגשות. ראה [`engines/luatex/migration-from-luabidi.tex`](engines/luatex/migration-from-luabidi.tex) לדוגמה של המעבר.

---

### Typst

כלי עיצוב מסמכים מודרני, שונה לחלוטין מ-TeX. תחביר דומה ל-Markdown, מנוע כתוב ב-Rust.

```typst
#import "@preview/rubber-article:0.5.1": *
#show: article.with(font: ("CMU Serif", "David CLM"), lang: "he")
```

**יתרונות:** תחביר נוח, מהיר, RTL מובנה.
**חסרונות:** לא מוכר אקדמית, פחות חבילות מ-LaTeX, תחביר מתמטיקה שונה.

---

## תבניות ברירת מחדל (`defaults/`)

| קובץ | מנוע | תיאור |
|------|-------|--------|
| [`pdftex.tex`](defaults/pdftex.tex) | pdfLaTeX | הגדרה מינימלית |
| [`basic.tex`](defaults/basic.tex) | pdfLaTeX | הגדרה מורחבת עם פונטים ומקרואים |
| [`xetex.tex`](defaults/xetex.tex) | XeLaTeX | עם David CLM ו-Harfbuzz |
| [`luatex.tex`](defaults/luatex.tex) | LuaLaTeX | הגדרה מודרנית עם `bidi=basic` |
| [`typst.typ`](defaults/typst.typ) | Typst | עם `rubber-article` |

---

## קומפילציה עם latexmk

קבצי `.latexmkrc` בכל תיקייה מגדירים את המנוע ותיקיית הפלט:

```bash
latexmk file.tex        # קומפילציה לפי ה-.latexmkrc המקומי
latexmk -c file.tex     # ניקוי קבצי עזר
```

קומפילציה ישירה:

```bash
lualatex file.tex
xelatex  file.tex
pdflatex file.tex
typst compile file.typ
```

---

## מקרואים שימושיים

מוגדרים בכל התבניות:

```latex
\newcommand{\LR}[1]{\textenglish{#1}}      % טקסט באנגלית בתוך עברית
\newcommand{\RL}[1]{\texthebrew{#1}}       % טקסט בעברית בתוך אנגלית
\newcommand{\EN}{\selectlanguage{english}}  % מעבר לאנגלית
\newcommand{\HE}{\selectlanguage{hebrew}}   % מעבר לעברית
```

---

## קישורים שימושיים

- [MacTeX](https://www.tug.org/mactex/) — התקנת LaTeX ל-macOS
- [TeX Live](https://www.tug.org/texlive/) — התקנת LaTeX ל-Linux/Windows
- [Typst](https://typst.app/) — אתר Typst
- [Babel — תיעוד](https://ctan.org/pkg/babel) — חבילת הרב-לשוניות הראשית
- [Culmus](http://culmus.sourceforge.net/) — פונטים עבריים חופשיים
- [latexmk](https://ctan.org/pkg/latexmk) — אוטומציה לקומפילציה
- [rubber-article (Typst)](https://typst.app/universe/package/rubber-article) — תבנית Typst בסגנון LaTeX
