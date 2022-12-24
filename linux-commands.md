
Это осуществляется парой системных вызовов dlopen и dlsym  == LoadLibrary и GetProcAddress


Полезные команды
ld; ldd; ar; nm; ldconfig; pgrep; pmap;
find; locate

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
