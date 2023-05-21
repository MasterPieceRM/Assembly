%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor ebx, ebx
string:
    push edx
    mov al, [esi + ebx]
    cmp edx, 0
    je zero
cipher:
    cmp al, 'Z'
    jne NotendAlph
    mov al, 'A'
    dec edx
    cmp edx, 0
    je zero
    jmp cipher
NotendAlph:
    add al, 1
    dec edx
    cmp edx, 0
    jne cipher
    
zero:
    pop edx
    mov [edi + ebx], al
    inc ebx
    cmp ebx, ecx
    jne string
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
