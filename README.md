# 1. Marlin configuration files for FLSUN QQ-S

- [1. Marlin configuration files for FLSUN QQ-S](#1-marlin-configuration-files-for-flsun-qq-s)
  - [1.1. What is this ?](#11-what-is-this-)
  - [1.2. How to use these files](#12-how-to-use-these-files)
  - [1.3. How to Flash](#13-how-to-flash)
  - [1.4. 1st startup after flashing a new firmware](#14-1st-startup-after-flashing-a-new-firmware)
  - [1.5. Hot End PID Tune](#15-hot-end-pid-tune)
  - [1.6. Bed PID Tune](#16-bed-pid-tune)
  - [1.7. Calibrate Bowden E-Step](#17-calibrate-bowden-e-step)
  - [1.8. Calibrate dimensional print](#18-calibrate-dimensional-print)
  - [1.9. References / Usefull Links](#19-references--usefull-links)

## 1.1. What is this ?

This is my repository for Marlin configuration files for the FLSUN QQ-S stock (without mods) 3D printer.  

## 1.2. How to use these files

1. Download Marlin source code (<https://marlinfw.org/>)  
2. Extract Zip file
3. Copy the files in the extracted Marlin zip folder  
4. Start VSCODE, install PlatformIO plugin  
5. Point VSCODE to Marlin folder  
6. Compile it !  

## 1.3. How to Flash

1. When compiled, copy .pio\build\mks_robin_mini\Robin_mini.bin on a MicroSD card  
2. Power off the printer
3. Insert MicroSD in the printer  
4. Power on the printer  
5. Printer will tell you the upgrade is in progress  

## 1.4. 1st startup after flashing a new firmware

1. Init EEPROM [*Configuration->Advanced Settings->Initialize EEPROM*]  
2. Mount the magnetic leveling switch  
3. Start Delta auto Calibration (Very long...) [*Configuration->Delta Calibration->Auto Calibration*]  
4. Start Bed leveling [*Motion->Level Bed*]  
5. Now remove leveling switch  
6. Move Head to Z=0 (Be carefull, normally it will not touch the bed but you have to verify during the move)  
7. Configure Z probe offset with the paper test [*Configuration->Probe Z offset*]  
8. Save configuration in EEPROM [*Configuration->Store settings*]

## 1.5. Hot End PID Tune

For the following procedure I used Octoprint (terminal tab):  

1. Start fan at max speed: **M106 S255**  
2. Execute auto-PID: **M303 E0 S200 C8**  
   Explanation: Hotend 0, Temp 200, 8 times  
3. Actual Firmware configuration: M301 P28.16 I3.38 D58.69  
   New value found : **M301 P16.90 I0.94 D75.85**
   :warning: I installed a silicon protection around the heating block so don't use these values for your printer.
4. Save with : **M500**

## 1.6. Bed PID Tune

For the following procedure I used Octoprint (terminal tab):  

1. Execute auto-PID: **M303 E-1 S60 C8**  
   Explanation: Bed, Temp 60, 8 times  
2. Actual Firmware configuration: M304 P325.10 I63.35 D417.10  
   New value found: **M304 P79.68 I15.29 D276.77**
3. Save with: **M500**

## 1.7. Calibrate Bowden E-Step

> TO WRITE

## 1.8. Calibrate dimensional print

> TO WRITE

## 1.9. References / Usefull Links

|||
|:----|:---|
|Facebook group|<https://www.facebook.com/groups/120961628750040/>|
|Anders Sahlman Github|<https://github.com/AndersSahlman/Marlin>|
|Interresting Anders' post|<https://www.facebook.com/groups/120961628750040/permalink/593987384780793/>|
|Flsun QQ/QQS FAQ|<https://docs.google.com/document/d/1b_2N7NpQN2e96VPfVc_poLPOWwkM93tdAHZWOD4WEw8/edit?usp=sharing>|
|WIFI upgrade|<https://www.facebook.com/groups/120961628750040/?post_id=623723315140533>|
