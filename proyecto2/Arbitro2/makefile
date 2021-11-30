#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas
TESTB = arbitro2_tb.v
SYNTH = arbitro2_synth.v
VCD = verificacion_arbitro2.vcd
EXE = verificacion_arbitro2.o

all: verificacion_arbitro2

verificacion_arbitro2 : sintesis_arbitro2 exe_arbitro2
#Simular:
	vvp $(EXE)
#Ver en gtkwave:
	gtkwave $(VCD)

sintesis_arbitro2 :
	yosys -s  synth_arbitro2.ys
	sed -i 's/arbitro2/arbitro2_synth/g' $(SYNTH)
	sed -i 's/data_out/data_out_synth/g' $(SYNTH)
	sed -i 's/pop/pop_synth/g' $(SYNTH)
	sed -i 's/push0/push0_synth/g' $(SYNTH)
	sed -i 's/push1/push1_synth/g' $(SYNTH)
	sed -i 's/push2/push2_synth/g' $(SYNTH)
	sed -i 's/push3/push3_synth/g' $(SYNTH)
	sed -i 's/cont4/cont4_synth/g' $(SYNTH)

exe_arbitro2:
#Compilar:
#	@echo "Realizando auto-instanciación..."
	emacs --batch $(TESTB) -f verilog-batch-auto
#	@echo "Compilando..."
	$(CC) $(TESTB) cmos_cells.v -o $(EXE)

.PHONY: all clean help
clean:
	rm -f *.o *.vcd
	rm -f $(SYNTH)	
help:
	cat README
