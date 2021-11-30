#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas
TESTB = contador_tb.v
SYNTH = contador_synth.v
VCD = verificacion_contador.vcd
EXE = verificacion_contador.o

all: verificacion_contador

verificacion_contador : sintesis_contador exe_contador
#Simular:
	vvp $(EXE)
#Ver en gtkwave:
	gtkwave $(VCD)

sintesis_contador :
	emacs --batch contador.v -f verilog-batch-auto
	yosys -s  synth_contador.ys
	sed -i 's/contador/contador_synth/g' $(SYNTH)
	sed -i 's/data_out/data_out_synth/g' $(SYNTH)
	sed -i 's/valid/valid_synth/g' $(SYNTH)


	
exe_contador:
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
