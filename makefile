all: jag.out

jag.out: jag.S
	arm-linux-gnueabi-gcc jag.s -o jag.out -static
