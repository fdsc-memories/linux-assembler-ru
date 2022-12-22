.intel_mnemonic
.intel_syntax noprefix

.section .rodata

empty:
.string "Text for output to console"

.bss

.data

.text

.global main

.balign 64, 0x37

main:
push rbp
mov rbp, rsp

lea rdi, [empty+rip]
call puts

xor eax, eax

leave

ret
