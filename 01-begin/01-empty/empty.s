# Используем интеловский синтаксис
# https://www.sourceware.org/binutils/docs/as/i386_002dOptions.html
# https://www.sourceware.org/binutils/docs/as/i386_002dVariations.html

.intel_mnemonic
.intel_syntax noprefix

.section .rodata             # read-only static data

.global empty
empty:
  .string "Text for output to console"    # zero-terminated C string

.text

.global main

main:
    push    rbp
    mov     rbp, rsp                    # create a stack frame

    # Используем Position Independent Code
    lea     rdi, [empty+rip]
    call    puts                        # as the first arg for puts

    mov     eax, 0                      # return value = 0.  Normally xor %eax,%eax

    leave                               # tear down the stack frame

    ret                                 # pop the return address off the stack into RIP
