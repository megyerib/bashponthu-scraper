# bash.hu scraper script

Egyszer valahol elterjedt, hogy megszűnt a [bash.hu](http://bash.hu/top). A nagy ijedelem után kiderült, hogy mégsem, ekkor írtam meg ezt a scrapert, ami letölti és két standalone HTML fájlba rendezi a posztokat, az egyiket idő, a másikat népszerűség szerint. A generált fájlokat feltöltöttem a release-ek közé.

## Használat

```bash
make          # Letöltés, HTML-ek generálása
make release  # zip
make clean
```

## Kimenet

- **out/sorban.html**: Az összes poszt időbeli sorrendben
- **out/top.html**: Az összes poszt szavazat szerint csökkenő sorrendben
- **out/bashponthu-\*.zip**: Az 2 HTML összezipelve
