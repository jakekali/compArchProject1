all: jag.out

jag.out: jag.s
	arm-linux-gnueabi-gcc jag.s -o jag.out -static
