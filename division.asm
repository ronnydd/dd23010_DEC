section .data
    dividend dd 100
    divisor  dd 7
    quotient dd 0
    remainder dd 0

    msg_quotient db "Cociente: ", 10
    msg_remainder db "Residuo: ", 10
    newline db 10

section .bss
    buffer resb 12      ; buffer para conversión decimal (max 11 dígitos + null)

section .text
    global _start

_start:
    mov eax, [dividend]
    cdq                 ; extiende eax a edx:eax para división con signo
    mov ecx, [divisor]

    div ecx             ; eax = cociente, edx = residuo

    mov [quotient], eax
    mov [remainder], edx

    ; Imprimir "Cociente: \n"
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_quotient
    mov rdx, 10
    syscall

    ; Imprimir cociente
    mov eax, [quotient]
    call print_number

    ; Imprimir salto de línea
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Imprimir "Residuo: \n"
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_remainder
    mov rdx, 9
    syscall

    ; Imprimir residuo
    mov eax, [remainder]
    call print_number

    ; Imprimir salto de línea
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Salir
    mov rax, 60
    xor rdi, rdi
    syscall

; --------------------------------------------
; print_number:
; Convierte eax a decimal y lo imprime
; Usa buffer de 12 bytes
; --------------------------------------------
print_number:
    mov rdi, buffer + 11
    mov byte [rdi], 0
    dec rdi

    cmp eax, 0
    jne .print_loop
    mov byte [rdi], '0'
    jmp .print_done

.print_loop:
    xor edx, edx
    mov ebx, 10
    div ebx              ; eax = eax / 10, edx = eax % 10
    add dl, '0'
    mov [rdi], dl
    dec rdi
    cmp eax, 0
    jne .print_loop

.print_done:
    inc rdi              ; apunta al primer dígito válido

    mov rsi, rdi
    mov rdx, buffer + 11
    sub rdx, rsi

    mov rax, 1
    mov rdi, 1
    syscall

    ret

