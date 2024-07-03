# Notizen Busdisplay

## Was bisher geschah
- Alles raus gebaut was raus geht, aber das Display läuft noch
    - Modem und Funkding
- Serial Console auf Displaycontroller
    - Bottom: Seite an der das Display offen ist
    - Pinout bottom to top: GND TX RX 3.3V
    - Baud: 115200 (vmtl)
    - Konsole, Username Passwort unbekannt
- RS485
    - Pinout Bottom to top: SIG+, GND, SIG- 
    - Siehe Paketdump Capture_Uhrzeit.sal (Saleae Logic 2)
    - Pakete gecapturet und decoded

## Protokoll Reversing
- Begonnen RS45 Protokoll zu reversen. 
- Einzelne Pakete erkennbar. Jupyter Notebook kann diese zerlegen

### Bisherige grobe Erkenntnisse
- Protokoll scheint Frage -> Antwort basiert zu sein
- Irgendwo wird das komplette (?) ASCII Alphabet übertragen
    - Pbly "Wie sieht n A aus?" "So sieht n A aus 'blablabla' "
- Jede 30 Sekunden ein Signal
- Jede Minute Zeitupdate erkennbar
- Scheinbar 2 Paketarten 
    - Eins mit 'U' eins mit '0x01'
    - ggf. Frage Antwort?
