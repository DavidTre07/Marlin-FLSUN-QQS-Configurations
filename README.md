# 1. Marlin configuration files for FLSUN QQ-S

- [1. Marlin configuration files for FLSUN QQ-S](#1-marlin-configuration-files-for-flsun-qq-s)
  - [1.1. Purpose of this git](#11-purpose-of-this-git)
  - [1.2. How to use these files](#12-how-to-use-these-files)
  - [1.3. How to Flash](#13-how-to-flash)
  - [1.4. 1st startup after flashing a new firmware](#14-1st-startup-after-flashing-a-new-firmware)
  - [1.5. Hot End PID Tune](#15-hot-end-pid-tune)
  - [1.6. Bed PID Tune](#16-bed-pid-tune)
  - [1.7. Calibrate extruder E-Step](#17-calibrate-extruder-e-step)
  - [1.8. Calibrate dimensional print](#18-calibrate-dimensional-print)
  - [1.9. Temperature tower](#19-temperature-tower)
  - [1.10. References / Usefull Links](#110-references--usefull-links)

---

## 1.1. Purpose of this git

This is a repository for FLSUN QQ-S Marlin configuration files,  
The printer is a stock one (without mods).  
You will find also in this readme some How To for configuring / tuning your delta printer.  

---

## 1.2. How to use these files

1. Download Marlin source code (<https://marlinfw.org/>)  
2. Extract Zip file
3. Copy this repository files in the extracted Marlin zip folder  
4. Start VSCODE, install PlatformIO plugin  
5. Point VSCODE to Marlin folder  
6. Compile it !  

---

## 1.3. How to Flash

1. When compiled, copy .pio\build\mks_robin_mini\Robin_mini.bin on a MicroSD card  
2. Power off the printer
3. Insert MicroSD in the printer  
4. Power on the printer  
5. Printer will tell you the upgrade is in progress  

---

## 1.4. 1st startup after flashing a new firmware

1. Init EEPROM [*Configuration->Advanced Settings->Initialize EEPROM*]  
2. Mount the magnetic leveling switch  
3. Start Delta auto Calibration (Very long...) [*Configuration->Delta Calibration->Auto Calibration*]  
4. Heat up the hotend + Bed
5. Start Bed leveling [*Motion->Level Bed*]  
6. Now remove leveling switch  
7. Move Head to Z=0 (Be carefull, normally it will not touch the bed but you have to verify during the move)  
8. Configure Z probe offset with the paper test [*Configuration->Probe Z offset*]  
9. Save configuration in EEPROM [*Configuration->Store settings*]

---

## 1.5. Hot End PID Tune

For the following procedure I used Octoprint terminal tab:  

1. Start fan at max speed: **M106 S255**  
2. Execute auto-PID: **M303 E0 S200 C8**  
   Explanation: Hotend 0, Temp 200, 8 times  
3. Actual Firmware configuration: M301 P28.16 I3.38 D58.69  
   New value found : **M301 P16.90 I0.94 D75.85**  
   :warning: Warning: I installed a silicon protection around the heating block so don't use these values for your printer.
4. Save with : **M500**

---

## 1.6. Bed PID Tune

For the following procedure use Octoprint terminal tab:  

1. Execute auto-PID: **M303 E-1 S60 C8**  
   Explanation: Bed, Temp 60, 8 times  
2. Actual Firmware configuration: M304 P325.10 I63.35 D417.10  
   New value found: **M304 P79.68 I15.29 D276.77**
3. Save with: **M500**

---

## 1.7. Calibrate extruder E-Step

For the following procedure use Octoprint terminal tab:  

1. Remove the bowden on the extruder motor
2. Allow cold extrusion: **M302 P1**
3. Relative mode: **M83**
4. Extrude 30 cm at 200mm/min: **G1 E300 F500**
5. Check if the length is 30 cm
6. If not OK:
   - Check the current steps/mm: **M92** (Only the E value will be changed)
   - Calculate new E-Steps: *CurrentValue\*300/MesuredLength*
   - Configure the new steps/mm: **M92 E391**
   - Restart from step 3.
7. If OK then disallow cold extrusion: **M302 P0**
8. Save new value: **M500**

---

## 1.8. Calibrate dimensional print

Print a dice of the size of your choice.  You can found some in the stl folder.  
Recommended values of your slicer: 5% filling, speed 40mm/s.  
When done use a caliper to verify the dice size.  

If you face a difference in the size you have to adjust diagonal rod size:  

1. Print the curent configuration with: **M503**  
   Look for:  

   ```text
   Delta settings: L<diagonal rod> R<radius> H<height> S<segments per sec> XYZ<tower angle trim> ABC<rod trim>  
   M665 L280.00 R141.86 H359.31 S200.00 X-0.44 Y0.62 Z-0.18 A0.00 B0.00 C0.00
   ```

   You have to adjust *L\<diagonal rod\>*

2. Calculate the new value:  
For example if you printed a 100 mm dice but you find 99.8 mm:  
calculate the new value: *CurrentValue\*40/MesuredSize*  (280*100/99.8=280.56)  

3. Configure the new value: **M665 L280.56**

4. As you modfied the Diagonal Rod size, you have to redo:
   - Delta auto Calibration: **G33**  
   - Hot end and bed heating: **M104 S200** + **M190 S60**
   - Bed leveling: **G29**
   - Probe Z offset (paper test)
   - End of hot end and bed heating: **M104 S0; M140 S0**

Delta auto calibration + Bed leveling + ... take long time, so:

- print slowly the dice
- a small dice is nice because it print in a short time but a big dice would provide you better accuracy  
  I use a 1 cm dice for the first try then  
  2 cm dice for next adjustement  
  and finally a last 10 cm dice when close a final config (very long but accurate)  
- pay attention of the mesured size of your dice  
  (for example the first layer is usually larger so try to make mesurement without the first layer)  

---

## 1.9. Temperature tower

> TO WRITE

---

## 1.10. References / Usefull Links

|||
|:----|:---|
|Facebook group|<https://www.facebook.com/groups/120961628750040/>|
|Anders Sahlman Github|<https://github.com/AndersSahlman/Marlin>|
|Interresting Anders' post|<https://www.facebook.com/groups/120961628750040/permalink/593987384780793/>|
|Flsun QQ/QQS FAQ|<https://docs.google.com/document/d/1b_2N7NpQN2e96VPfVc_poLPOWwkM93tdAHZWOD4WEw8/edit?usp=sharing>|
|WIFI upgrade|<https://www.facebook.com/groups/120961628750040/?post_id=623723315140533><BR><https://github.com/luc-github/ESP3D>|
|Extruder calibration|<https://mattshub.com/blog/2017/04/19/extruder-calibration>|
|Calibration Hexagon|<https://www.thingiverse.com/thing:1274733>|
