#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas
TESTB = arbitro1_tb.v
SYNTH = arbitro1_synth.v
VCD = verificacion_arbitro1.vcd
EXE = verificacion_arbitro1.o

all: verificacion_arbitro1

verificacion_arbitro1 : sintesis_arbitro1 exe_arbitro1
#Simular:
	vvp $(EXE)
#Ver en gtkwave:
	gtkwave $(VCD)

sintesis_arbitro1 :
	yosys -s  synth_arbitro1.ys
	sed -i 's/arbitro1/arbitro1_synth/g' $(SYNTH)
	sed -i 's/data_out/data_out_synth/g' $(SYNTH)
	sed -i 's/pop0/pop0_synth/g' $(SYNTH)
	sed -i 's/pop1/pop1_synth/g' $(SYNTH)
	sed -i 's/pop2/pop2_synth/g' $(SYNTH)
	sed -i 's/pop3/pop3_synth/g' $(SYNTH)
	sed -i 's/push0/push0_synth/g' $(SYNTH)
	sed -i 's/push1/push1_synth/g' $(SYNTH)
	sed -i 's/push2/push2_synth/g' $(SYNTH)
	sed -i 's/push3/push3_synth/g' $(SYNTH)
	sed -i 's/cont0/cont0_synth/g' $(SYNTH)
	sed -i 's/cont1/cont1_synth/g' $(SYNTH)
	sed -i 's/cont2/cont2_synth/g' $(SYNTH)
	sed -i 's/cont3/cont3_synth/g' $(SYNTH)

exe_arbitro1:
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
