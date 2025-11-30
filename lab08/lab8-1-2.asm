%include 'in_out.asm'

SECTION .text
global _start
_start:

pop ecx ;извлекаем из стека в 'ecx' количество аргументов

pop edx ;извлекаем из стека в 'edx' имя программы
	;
sub ecx, 1 ;уменьшаем 'ecx'  на 1 

next:

cmp ecx, 0 ;проверяем есть ли аргументы,если нет выходим из цикла
jz _end ;переходит на метку  _end

pop eax ; иначе извлекаем аргумент из стека
call sprintLF ; вызываем функцию печати
loop next ;переход к обработке следующего аргумента  next

_end:
call quit
