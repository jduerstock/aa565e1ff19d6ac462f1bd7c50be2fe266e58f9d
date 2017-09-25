#!/bin/bash
M68KAS=m68k-linux-gnu-as
M68KLD=m68k-linux-gnu-ld
$M68KAS -g -o cfm_0000.o cfm_0000.s || exit
$M68KLD --oformat=binary -Ttext=0x10000000 -e 0x10000000 -o cfm_0000.bin cfm_0000.o || exit
sha1sum -c cfm_0000.sha1
