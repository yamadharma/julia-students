# Утилиты

- `pandoc-minted.py`
    - A pandoc filter that has the LaTeX writer use minted for typesetting code.
    - Фильтр pandoc, который использует `minted` для экспорта в LaTeX.
    - Usage:

``` bash
pandoc --filter pandoc-minted.py myfile.ipynb -o myfile.tex
```



