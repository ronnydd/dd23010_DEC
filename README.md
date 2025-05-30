#  Práctica de Aritmética en Ensamblador NASM

Este repositorio contiene tres ejercicios prácticos en lenguaje ensamblador (NASM) diseñados para trabajar con operaciones aritméticas básicas utilizando diferentes tamaños de registros (8, 16 y 32 bits) en arquitectura x86-64.

---

## Descripción de los ejercicios

### 1. ➖ Resta de tres enteros

**Archivo:** `resta.asm`  
**Descripción:**  
Este programa realiza la **resta de tres números enteros** utilizando **únicamente registros de 16 bits** (`AX`, `BX`, `CX`).  

 **Operación realizada:**  
resultado = num1 - num2 - num3

markdown
Copiar
Editar

**Registros usados:**  
- `AX`: primer número  
- `BX`: segundo número  
- `CX`: tercer número  
- El resultado queda en `AX`

 **Compilación y ejecución:**

```bash
nasm -f elf64 resta.asm -o resta.o
ld resta.o -o resta
./resta
2. Multiplicación de dos enteros
Archivo: multiplicacion.asm
 Descripción:
Este programa multiplica dos números enteros utilizando registros de 8 bits.

 Operación realizada:

ini
Copiar
Editar
resultado = num1 * num2
 Registros usados:

AL: primer número

BL: segundo número

El resultado se almacena en AX (producto de 8 bits × 8 bits = 16 bits)

Compilación y ejecución:

bash
Copiar
Editar
nasm -f elf64 multiplicacion.asm -o multiplicacion.o
ld multiplicacion.o -o multiplicacion
./multiplicacion

3. División de dos enteros
 Archivo: division.asm
Descripción:
Este programa divide dos números enteros utilizando registros de 32 bits. También muestra en pantalla el cociente y el residuo.

 Operación realizada:

ini
Copiar
Editar
cociente = dividendo / divisor
residuo = dividendo % divisor
 Registros usados:

EAX: dividendo

ECX: divisor

EDX: contiene el residuo después de la división

El cociente queda en EAX

 Compilación y ejecución:

bash
Copiar
Editar
nasm -f elf64 division.asm -o division.o
ld division.o -o division
./division
