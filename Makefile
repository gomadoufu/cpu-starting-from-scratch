test:
	vvp a.out
	gtkwave wave.vcd

clean:
	rm -f a.out wave.vcd

.PHONY: test clean
