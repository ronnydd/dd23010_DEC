section .data
    num1 db 6
    num2 db 7
    result dw 0

    buffer db '00000', 10  ; buffer para imprimir (5 dígitos + newline)
    buffer_len equ 6       ; longitud del buffer (5 dígitos + salto de línea)

section .text
    global _start

_start:
    mov al, [num1]
    mov bl, [num2]
    mul bl               ; AL*BL -> AX (16 bits)
    mov [result], ax

    ; Convertir AX a decimal y guardar en buffer
    mov cx, 5            ; cantidad de dígitos para convertir
    lea rsi, [rel buffer + 4]   ; apuntar al último dígito del buffer (posición 4)
    mov ax, [result]

convert_loop:
    xor dx, dx
    mov bx, 10
    div bx               ; divide AX entre 10, cociente en AX, resto en DX
    add dl, '0'          ; resto -> dígito ASCII
    mov [rsi], dl
    dec rsi
    loop convert_loop

    ; imprimir buffer
    mov rax, 1           ; syscall write
    mov rdi, 1           ; stdout
    lea rsi, [rel buffer]
    mov rdx, buffer_len
    syscall

    ; salir
    mov rax, 60          ; syscall exit
    xor rdi, rdi
    syscall

