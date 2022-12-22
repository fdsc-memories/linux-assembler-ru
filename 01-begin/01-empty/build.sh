# Компилируем ассемблерный файл с помощью gcc
gcc empty.s -pie -fPIC -o empty

# Компилируем похожий файл, но без комментариев и лишних пробелов с помощью as
# Флаг -f используется, если этот код не нужно препроцессировать,
# в том смысле, что в нём нет лишних пробелов и комментариев
as empty-small.s -f -o empty-small.o
# Для компиляции с помощью as
# нам нужно вручную вызвать линковщик
# -l c - это импорт libc. К "c" добавляется "lib" автоматически
ld empty-small.o -o empty-small -pie --entry=main -l c


cp empty /inRam/empty
chmod +x /inRam/empty

cp empty /inRam/empty-small
chmod +x /inRam/empty-small
