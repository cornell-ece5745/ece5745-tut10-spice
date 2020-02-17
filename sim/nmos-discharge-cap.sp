* MMOS Discharging Capacitor
* ========================================================================

* Parameters and Models
* ------------------------------------------------------------------------

.param  VDD='1.1V'
.option scale=450nm
.temp   70
.inc "/classes/ece5745/install/adk-pkgs/freepdk-45nm/view-standard/pdk-models.sp"

* Supply Voltage Source
* ------------------------------------------------------------------------

Vdd vdd gnd VDD

* Transistors
* ------------------------------------------------------------------------

*  src   gate drain body type
M1 gnd   in   out   gnd  NMOS_VTL W=1 L=0.1

* Output Load
* ------------------------------------------------------------------------

CLoad out gnd 12fF

* Input Signals
* ------------------------------------------------------------------------

VIN_ in gnd pwl( 0ns 0V 0.5ns 0V 0.7ns 1.1V )

* Analysis
* ------------------------------------------------------------------------

.ic   V(out)=VDD
.tran 0.01ns 2.5ns

.control
run
set color0=white
set color1=black
set xbrushwidth=2
plot V(in) V(out)
.endc

.end
