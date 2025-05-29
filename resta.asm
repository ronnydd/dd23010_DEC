section .data
    num1 dw 30
    num2 dw 10
    num3 dw 5

    buffer db "Resultado: ", 0    ; mensaje base
    result db "00", 10            ; espacio para resultado en ASCII + salto de línea

section .bss
    ; no usamos variables dinámicas en este ejemplo

section .text
    global _start

_start:
    ; Realizar la resta
    mov ax, [num1]
    sub ax, [num2]
    sub ax, [num3]

    ; Convertir AX (resultado) a ASCII
    mov cx, 10         ; divisor (base 10)
    xor dx, dx
    mov bx, ax         ; copiar resultado
    xor si, si         ; índice del resultado en memoria

    ; Extraer decenas
    xor dx, dx
    div cx             ; AX / 10 → AL = decenas, AH = unidades (en AL y DL)
    add al, '0'
    mov [result], al

    ; Extraer unidades (DL)
    add dl, '0'
    mov [result + 1], dl

    ; Imprimir "Resultado: 15"
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, buffer     ; mensaje base
    mov rdx, 10         ; longitud del texto "Resultado: "
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, result     ; número en texto + salto de línea
    mov rdx, 3
    syscall

    ; Salir del programa
    mov rax, 60
    xor edi, edi
    syscall

