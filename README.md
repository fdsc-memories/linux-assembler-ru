# linux-assembler-ru
Памятка по ассемблеру в Linux "as"

sourceware.org:
    [Документация по as в pdf](https://www.sourceware.org/binutils/docs/as.pdf)
    [Документация по as в html](https://sourceware.org/binutils/docs/as/)
linuxassembly.org:
    [Документация по GNU as](http://www.linuxassembly.org/assembly-intro.html)

[GNU lightning](https://www.gnu.org/software/lightning/)


01-begin
    01-empty/build.sh
        Компиляция пустого файла (только выводит сообщение)
        Мнемоника Intel


Это осуществляется парой системных вызовов dlopen и dlsym  == LoadLibrary и GetProcAddress


Полезные команды
ld; ldd; ar; nm; ldconfig;

вместо ld может быть использована команда
readelf -d executable_name | fgrep NEEDED;

У запущенного процесса можно посмотреть список загруженных библиотек
cat /proc/<PID>/maps

lsof;

strace -e trace=open,openat,creat myprogram
Например
strace -e trace=open,openat,creat date

Ещё
ltrace -S myprogram
