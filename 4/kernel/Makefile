# $^ is substituted with all of the target ’s dependancy files
kernel.bin : kernel_entry.o kernel.o
	gcc -m32 -o kernel.bin -ffreestanding -nostdlib $^

# $< is the first dependancy and $@ is the target file
kernel.o : kernel.c
	gcc -m32 -o $@ -ffreestanding -nostdlib $<

# Same as the above rule .
kernel_entry.o : kernel_entry.asm
	nasm $< -f elf -o $@