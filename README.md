# Brasil Fokus-Trainer

Eine eigenst�ndige Lern-Webseite f�r brasilianisches Portugiesisch mit:

- Pareto-Vokabeltrainer und Spaced Repetition
- Aussprachetraining und Sprachausgabe
- Fortschrittsanzeige mit Lernzielen
- eigenen W�rtern, Kategorien sowie JSON-Import und -Export
- optionalen Gemini-Funktionen f�r neue Vokabeln, Dialoge und Auswertungen

## Lokal starten

`index.html` per Doppelklick im Browser �ffnen. Es ist keine Installation und kein Build-Schritt n�tig.

## Speicherung

Lernstand und Einstellungen werden im `localStorage` des jeweiligen Browsers gespeichert. �ber die Backup-Funktion in der App l�sst sich der Stand als JSON sichern und wiederherstellen.

## KI-Funktionen

Die Kern-App l�uft ohne API-Key. F�r die optionalen KI-Funktionen kann in den Einstellungen ein eigener Google-Gemini-Key hinterlegt werden. Der Key wird nur im lokalen Browserspeicher gespeichert und direkt an die Gemini API gesendet; im Repository befindet sich kein Key.

F�r eine �ffentliche Nutzung empfiehlt sich sp�ter eine Supabase Edge Function als gesch�tzter Proxy. Dadurch bleibt der Gemini-Key serverseitig und kann nicht im Browser ausgelesen werden.

## GitHub Pages

Das Repository enth�lt einen fertigen Pages-Workflow. In GitHub unter **Settings  Pages  Source** einmalig **GitHub Actions** w�hlen. Danach ver�ffentlicht jeder Push auf `main` automatisch die aktuelle Webseite.

