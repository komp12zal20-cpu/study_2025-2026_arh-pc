%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите значение x: ', 0
    rem: DB 'Результат: ', 0

SECTION .bss
    x: RESB 80

SECTION .text
    GLOBAL _start

_start:
    ; --- Ввод данных ---
    mov eax, msg
    call sprint
    
    mov ecx, x
    mov edx, 80
    call sread
    
    mov eax, x
    call atoi      ; теперь в eax лежит число x

    ; --- Вычисления (18 * (x + 1) / 6) ---
    ; Используем упрощенную формулу: 3 * (x + 1)
    add eax, 1     ; eax = x + 1
    mov ebx, 3
    mul ebx        ; eax = eax * 3 (результат: 3x + 3)

    ; --- Вывод результата ---
    mov edi, eax   ; сохраняем результат в edi
    mov eax, rem
    call sprint    ; выводим "Результат: "
    
    mov eax, edi   ; возвращаем результат в eax
    call iprintLF  ; выводим число и перевод строки

    ; --- Выход ---
    call quit
