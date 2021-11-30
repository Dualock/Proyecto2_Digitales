#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas
TESTB = fsm_tb.v
SYNTH = fsm_synth.v
VCD = verificacion_fsm.vcd
EXE = verificacion_fsm.o

all: verificacion_fsm

verificacion_fsm : sintesis_fsm exe_fsm
#Simular:
	vvp $(EXE)
#Ver en gtkwave:
	gtkwave $(VCD)

sintesis_fsm :
	yosys -s  synth_fsm.ys
	sed -i 's/fsm/fsm_synth/g' $(SYNTH)
	sed -i 's/idle/idle_synth/g' $(SYNTH)
	sed -i 's/th_fifos_almost_empty/th_fifos_almost_empty_synth/g' $(SYNTH)
	sed -i 's/th_fifos_almost_full/th_fifos_almost_full_synth/g' $(SYNTH)

exe_fsm:
#Compilar:
	@echo "Realizando auto-instanciación..."
	emacs --batch $(TESTB) -f verilog-batch-auto
	@echo "Compilando..."
	$(CC) $(TESTB) cmos_cells.v -o $(EXE)

.PHONY: all clean help
clean:
	rm -f *.o *.vcd
	rm -f $(SYNTH)	
help:
	cat README
