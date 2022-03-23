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
M1 vdd  in   out   vdd  PMOS_VTL W=0.625um L=0.045um
M2 gnd  in   out   gnd  NMOS_VTL W=0.450um L=0.045um

* Output Load
* ------------------------------------------------------------------------

Cload out gnd 7fF

* Input Signals
* ------------------------------------------------------------------------

Vin in gnd 0V

* Analysis
* ------------------------------------------------------------------------

.dc Vin 0 'VDD' 0.01

.control
run
set color0=white
set color1=black
set xbrushwidth=2
plot V(out) vs V(in)
.endc

.end

