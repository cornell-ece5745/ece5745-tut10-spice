* Simple NAND2 simulation
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
M1 vdd  a    y     vdd  PMOS_VTL W=0.900um L=0.045um
M2 vdd  b    y     vdd  PMOS_VTL W=0.900um L=0.045um
M3 n0   a    y     gnd  NMOS_VTL W=0.900um L=0.045um
M4 gnd  b    n0    gnd  NMOS_VTL W=0.900um L=0.045um

* Output Load
* ------------------------------------------------------------------------

Cload y gnd 70fF

* Input Signals
* ------------------------------------------------------------------------

A1 [a_ b_] nand2_source
.model nand2_source d_source (input_file="nand2-source.txt")

Aa [a_] [a] dac_a
.model dac_a dac_bridge (out_low=0V out_high='VDD' t_rise=0.2ns t_fall=0.2ns)

Ab [b_] [b] dac_b
.model dac_b dac_bridge (out_low=0V out_high='VDD' t_rise=0.2ns t_fall=0.2ns)

* Analysis
* ------------------------------------------------------------------------

.ic   V(y)=VDD
.tran 0.01ns 4ns

.control
run
set color0=white
set color1=black
set xbrushwidth=2
plot V(a) V(b) V(y)
.endc

.end

