====================
USB Write Protection
====================

USB Write Protection is a batch file that can switch on, switch off and display
the state of the USB write protection of the operating system.


Use USB Write Protection from Windows Desktop:
==============================================

1. Create a Shortcut to the files you want to use:

   USB Write Protection SHOW.cmd
      Display the state of the USB write protection.
   
   USB Write Protection CHANGE.cmd
      Change the state of the USB write protection.
      If the write protection is enabled, it will be disabled and vice versa.
   
   USB Write Protection ON.cmd
      Enables the USB write protection.
   
   USB Write Protection OFF.cmd
      Disables the the USB write protection.


2. Open the properties of the shortcut, select the tab "Shortcut" and click
   the button "Advanced...". Check to option "Run as administrator".
	 
   NOTE: The script can change the USB write protection only if it runs as
	 administrator. The changes affect newly connected USB devices only.


3. The file "USBWP.ico" can be set as icon for to the shortcut.


As an alternative, you can call the file "USBWP.cmd" in a shortcut directly
with the desired parameters.

More details about the parameter you can get in the console with
"USBWP.cmd HELP".

____________________________________
Copyright (c) 2020 Werner Rumpeltesz
E-mail:  info@gaijin.at
Website: https://www.gaijin.at/
