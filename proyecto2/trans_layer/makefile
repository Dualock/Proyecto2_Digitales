#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas
TESTB = trans_layer_tb.v
SYNTH = trans_layer_synth.v
VCD = verificacion_trans_layer.vcd
EXE = verificacion_trans_layer.o

all: verificacion_trans_layer

verificacion_trans_layer : sintesis_trans_layer exe_trans_layer
#Simular:
	vvp $(EXE)
#Ver en gtkwave:
	gtkwave $(VCD)

sintesis_trans_layer :
	yosys -s  synth_trans_layer.ys
	sed -i 's/trans_layer/trans_layer_synth/g' $(SYNTH)
	sed -i 's/fsm/fsm_synth/g' $(SYNTH)
	sed -i 's/arbitro1/arbitro1_synth/g' $(SYNTH)
	sed -i 's/arbitro2/arbitro2_synth/g' $(SYNTH)
	sed -i 's/FIFO/FIFO_synth/g' $(SYNTH)
	sed -i 's/demux_4x1/demux_4x1_synth/g' $(SYNTH)
	sed -i 's/contador/contador_synth/g' $(SYNTH)
	sed -i 's/data_out0/data_out0_synth/g' $(SYNTH)
	sed -i 's/data_out1/data_out1_synth/g' $(SYNTH)
	sed -i 's/data_out2/data_out2_synth/g' $(SYNTH)
	sed -i 's/data_out3/data_out3_synth/g' $(SYNTH)
	sed -i 's/data_out_cont/data_out_cont_synth/g' $(SYNTH)
	sed -i 's/valid_cont/valid_cont_synth/g' $(SYNTH)
exe_trans_layer:
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
