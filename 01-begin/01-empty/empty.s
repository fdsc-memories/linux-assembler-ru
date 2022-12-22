# Используем интеловский синтаксис
# https://www.sourceware.org/binutils/docs/as/i386_002dOptions.html
# https://www.sourceware.org/binutils/docs/as/i386_002dVariations.html

.intel_mnemonic
.intel_syntax noprefix


# --------------------------------
# Секция неизменяемых данных
# https://www.sourceware.org/binutils/docs/as/Section.html
# Линковщик понимает, что секция не изменяемая по названию
# (похоже, это зависит от компоновщика)

.section .rodata             # read-only static data

.global empty
empty:
  .string "Text for output to console"    # zero-terminated C string



# --------------------------------
# Секция неинициализированных данных
# https://www.sourceware.org/binutils/docs/as/bss.html
# Данные при загрузке программы будут инициализированны нулями
.bss


# --------------------------------
# Секция данных
.data


# --------------------------------
# Секция кода
.text

.global main

# Здесь мы выравниваем начало функции по началу линии кеша
# https://www.sourceware.org/binutils/docs/as/Balign.html
# .balign n, pad, max_pad
# Выравнивание происходит на границу, кратную n байтам, с выравнивающим значением pad и не более max_pad байтов
# Здесь выравнивание осуществляется с помощью символа 0x37 (это - invalid opcode в AMD64)
.balign 64, 0x37

main:
    push    rbp
    mov     rbp, rsp                    # Создаём фрейм в стеке

    # Используем Position Independent Code
    lea     rdi, [empty+rip]
    call    puts

    # Используем функцию puts: man puts
    # https://man7.org/linux/man-pages/man3/puts.3.html

    xor     eax, eax                    # Возвращаем код успешного завершения

    leave                               # Фрейм в стеке выталкиваем

    ret
