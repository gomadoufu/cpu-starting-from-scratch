Z16:
	iverilog Z16CPU_tb.v Z16ALU.v Z16CPU.v Z16DataMemory.v Z16Decoder.v Z16InstrMemory.v Z16RegisterFile.v

test:
	vvp a.out
	gtkwave wave.vcd

clean:
	rm -f a.out wave.vcd

.PHONY: test clean
