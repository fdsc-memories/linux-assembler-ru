
Это осуществляется парой системных вызовов dlopen и dlsym  == LoadLibrary и GetProcAddress


Полезные команды
ld; ldd; ar; nm; ldconfig; pgrep; pmap;
find; locate

вместо ld может быть использована команда
readelf -d executable_name | fgrep NEEDED;

У запущенного процесса можно посмотреть список загруженных библиотек
cat /proc/<PID>/maps

lsof;

# man strace
strace -fe trace=open,openat,creat -o out.log myprogram
Например
strace -fe trace=open,openat,creat -o out.log date

# file process net signal memory %creds
strace -fe trace=%file,%proces -o /inRam/out.log date

Ещё
ltrace -S myprogram
