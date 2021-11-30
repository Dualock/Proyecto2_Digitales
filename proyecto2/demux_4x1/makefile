#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas
TESTB = demux_4x1_tb.v
SYNTH = demux_4x1_synth.v
VCD = verificacion_demux_4x1.vcd
EXE = verificacion_demux_4x1.o

all: verificacion_demux_4x1

verificacion_demux_4x1 : sintesis_demux_4x1 exe_demux_4x1
#Simular:
	vvp $(EXE)
#Ver en gtkwave:
	gtkwave $(VCD)

sintesis_demux_4x1 :
	yosys -s  synth_demux_4x1.ys
	sed -i 's/demux_4x1/demux_4x1_synth/g' $(SYNTH)
	sed -i 's/data_out/data_out_synth/g' $(SYNTH)


exe_demux_4x1:
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
