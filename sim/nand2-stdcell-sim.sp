* Standard-cell NAND2 simulation
* ========================================================================

* Parameters and Models
* ------------------------------------------------------------------------

.param VDD='1.1V'
.temp  25
.inc   "/classes/ece5745/install/adk-pkgs/freepdk-45nm/stdview/pdk-models.sp"
.inc   "/classes/ece5745/install/adk-pkgs/freepdk-45nm/stdview/stdcells-lpe.spi"

* Supply Voltage Source
* ------------------------------------------------------------------------

Vdd vdd gnd VDD

* Instantiate Subcircuits
* ------------------------------------------------------------------------

X1 vdd gnd a y b NAND2_X1

* Output Load
* ------------------------------------------------------------------------

Cload y gnd 7fF

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

