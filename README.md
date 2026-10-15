# Vokalo

Lern-Web-App für brasilianisches Portugiesisch mit Vokabelkarten, Aussprache-Coach, Lernzielen und optionalen Gemini-Funktionen.

## Benutzung

https://nomedia14.github.io/vokalo/

Ein Konto mit E-Mail und Passwort erstellen und die E-Mail bestätigen. Auf PC und Handy dasselbe Konto verwenden.

## Zentrale Speicherung

Vokabeln, Wiederholungsintervalle, Aussprache-Ergebnisse, Kategorien, Lernziele und Einstellungen werden in Supabase gespeichert. Neue Lerndaten werden nicht in localStorage geschrieben. Nur die Anmeldung wird dauerhaft im lokalen Gerätespeicher gehalten, damit Nutzer nach dem Schließen angemeldet bleiben. Lerndaten bleiben zentral in Supabase. Abmelden beendet nur die Sitzung des aktuellen Geräts.

Beim ersten Anmelden in ein noch leeres Konto übernimmt die App vorhandene Vokalo-/Trainer-Daten aus diesem Browser. Bei bestehenden Konten ist ausschließlich der Cloud-Stand maßgeblich. Falls die Daten noch im alten Browser liegen, zuerst dort anmelden. Backups können weiterhin als JSON exportiert und importiert werden.

In den Einstellungen wird der Speicherstatus angezeigt. Vor dem Wechsel auf ein anderes Gerät auf die Bestätigung warten. Mit „Stand neu laden“ kann ein bereits geöffnetes Gerät den neuesten Stand laden. Gleichzeitige veraltete Änderungen werden abgelehnt; in diesem Fall zuerst ein JSON-Backup sichern.

## Datenbank

public.vokalo_user_state enthält einen versionierten privaten Zustand pro Nutzer. RLS beschränkt sämtliche Zugriffe auf die eigene Nutzer-ID. Die RPC-Funktion vokalo_save_state prüft die erwartete Version und verhindert unbemerkte Überschreibungen.

supabase/schema.sql dokumentiert das bereits eingerichtete Datenbankschema. Das Frontend enthält nur einen öffentlichen Publishable-Key, keinen Service-Role-Key.

## Gemini

Der persönliche Gemini-Key wird privat im jeweiligen Konto gespeichert. Er wird nur für die KI-Anfragen dieses Nutzers an Google verwendet. Kein persönlicher Gemini-Key liegt im Repository.

## Veröffentlichung

GitHub Pages veröffentlicht den Branch main aus dem Stammverzeichnis.
