# gcc empty.s -pie -fPIC -o empty
gcc empty.s -pie -fPIC -o empty

# gcc empty-small.s -pie -fPIC -o empty
as empty-small.s -f -o empty-small.o
# ld empty-small.o -o empty-small -pie --entry=main /lib/x86_64-linux-gnu/libc.so.6
# -l c - это импорт libc. К "c" добавляется "lib" автоматически
ld empty-small.o -o empty-small -pie --entry=main -l c


cp empty /inRam/empty
chmod +x /inRam/empty

cp empty /inRam/empty-small
chmod +x /inRam/empty-small
