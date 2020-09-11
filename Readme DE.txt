====================
USB Write Protection
====================

USB Write Protection ist eine Batchdatei, die den USB-Schreibschutz des
Betriebssystems einschalten, ausschalten und anzeigen kann.


USB Write Protection vom Windows Desktop aus verwenden:
=======================================================

1. Erstellen Sie eine Verknüpfung zur gewünschten Datei:

   USB Write Protection SHOW.cmd
      Zeigt den Status des USB Schreibschutzes an.

   USB Write Protection CHANGE.cmd
      Ändert den Status des USB Schreibschutzes.
      Wenn der Schreibschutz aktiviert ist, wird er deaktiviert und umgekehrt.

   USB Write Protection ON.cmd
      Aktiviert den USB Schreibschutz.

   USB Write Protection OFF.cmd
      Deaktiviert den USB Schreibschutz.


2. Wählen Sie in den Eigenschaften der Verknüpfung die Registerkarte
   "Verknüpfung" und dann die Schaltfläche "Erweitert...".
   Aktivieren Sie dort die Option "Als Administrator ausführen".

   HINWEIS: Änderungen an den USB Schreibschutzeinstellungen können nur mit
   Administratorrechten vorgenommen werden. Die Änderungen wirken sich nur auf
	 neu angeschlossene USB-Datenträger aus.


3. Die Datei "USBWP.ico" kann als Icon für die Verknüpfung verwendet werden.


Alternativ dazu kann in einer Verknüpfung die Datei "USBWP.cmd" auch direkt
mit den gewünschten Parametern aufgerufen werden.

Informationen zu den Aufrufparametern erhalten Sie in der Konsole mit
"USBWP.cmd HILFE".

____________________________________
Copyright (c) 2020 Werner Rumpeltesz
E-Mail:   info@gaijin.at
Webseite: https://www.gaijin.at/
