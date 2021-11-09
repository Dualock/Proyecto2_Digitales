#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas
TESTB = FIFO_tb.v
SYNTH = FIFO_synth.v
VCD = verificacion_FIFO.vcd
EXE = verificacion_FIFO.o

all: verificacion_FIFO

verificacion_FIFO : sintesis_FIFO exe_FIFO
#Simular:
	vvp $(EXE)
#Ver en gtkwave:
	gtkwave $(VCD)

sintesis_FIFO :
	emacs --batch FIFO.v -f verilog-batch-auto
	yosys -s  synth_FIFO.ys
	sed -i 's/FIFO/FIFO_synth/g' $(SYNTH)
	sed -i 's/fifo_data_out/fifo_data_out_synth/g' $(SYNTH)
	sed -i 's/fifo_empty/fifo_empty_synth/g' $(SYNTH)
	sed -i 's/fifo_pause/fifo_pause_synth/g' $(SYNTH)
	sed -i 's/fifo_error/fifo_error_synth/g' $(SYNTH)
exe_FIFO:
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
