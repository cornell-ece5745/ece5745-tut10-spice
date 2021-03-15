* Simple inverter simulation
* ========================================================================

* Parameters and Models
* ------------------------------------------------------------------------

.param VDD='1.1V'
.temp  25
.inc   "/classes/ece5745/install/adk-pkgs/freepdk-45nm/stdview/pdk-models.sp"

* Supply Voltage Source
* ------------------------------------------------------------------------

Vdd vdd gnd VDD

* Transistors
* ------------------------------------------------------------------------

*  src  gate drain body type
M1 vdd  in   out   vdd  PMOS_VTL W=0.900um L=0.045um
M2 gnd  in   out   gnd  NMOS_VTL W=0.450um L=0.045um

* Output Load
* ------------------------------------------------------------------------

Cload out gnd 7fF

* Input Signals
* ------------------------------------------------------------------------

Vin in gnd pwl
+ (
+   0.0ns  0V
+   0.9ns  0V
+   1.1ns VDD
+   1.9ns VDD
+   2.1ns  0V
+   2.9ns  0V
+ )

* Analysis
* ------------------------------------------------------------------------

.ic   V(out)=VDD
.tran 0.01ns 3ns

.control
run
set color0=white
set color1=black
set xbrushwidth=2
plot V(in) V(out)
.endc

.measure tran tpdr trig v(in) val='VDD/2' fall=1 targ v(out) val='VDD/2' rise=1
.measure tran tpdf trig v(in) val='VDD/2' rise=1 targ v(out) val='VDD/2' fall=1
.measure tran tpd param='(tpdr+tpdf)/2'

.end

