section .data
    max_val dd 8
section .text
    global bonus

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]     ; x
    mov ebx, [ebp + 12]    ; y
    mov ecx, [ebp + 16]    ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

up_right:
    cmp eax, 7
    je exit_1
    cmp ebx, 7
    je exit_1

    ;; prepare the offset

    push eax
    push ebx

    inc eax
    inc ebx
    mov esi, dword [max_val]
    mul esi
    add eax, ebx
    cmp eax, 31
    jle number_2
    mov esi, dword [ecx]
    xor edx, edx
    xor ebx, ebx
    mov edx, 64
    sub edx, eax
    mov eax, 32
    sub eax, edx
    mov ebx, 1
    push ecx
    xor ecx, ecx
    mov ecx, eax
    shl ebx, cl
    or esi, ebx
    pop ecx
    mov dword [ecx], esi
    jmp exit_11
number_2:

    mov esi, dword [ecx + 4]
    xor ebx, ebx
    mov ebx, 1
    push ecx
    xor ecx, ecx
    mov ecx, eax
    shl ebx, cl
    or esi, ebx
    pop ecx
    mov dword [ecx + 4], esi
    ;; restore offset
exit_11:
    pop ebx
    pop eax

exit_1:

up_left:

    cmp eax, 7
    je exit_2
    cmp ebx, 0
    je exit_2

    ;; prepare the offset
    
    push eax
    push ebx

    inc eax
    dec ebx
    mov esi, dword [max_val]
    mul esi
    add eax, ebx
    cmp eax, 31
    jle number_3
    mov esi, dword [ecx]
    xor edx, edx
    xor ebx, ebx
    mov edx, 64
    sub edx, eax
    mov eax, 32
    sub eax, edx
    mov ebx, 1
    push ecx
    xor ecx, ecx
    mov ecx, eax
    shl ebx, cl
    or esi, ebx
    pop ecx
    mov dword [ecx], esi
    jmp exit_22
number_3:

    mov esi, dword [ecx + 4]
    xor ebx, ebx
    mov ebx, 1
    push ecx
    xor ecx, ecx
    mov ecx, eax
    shl ebx, cl
    or esi, ebx
    pop ecx
    mov dword [ecx + 4], esi

exit_22:
    ;; restore offset

    pop ebx
    pop eax

exit_2:

down_right:

    cmp eax, 0
    je exit_3
    cmp ebx, 7
    je exit_3

    ;; prepare the offset
    
    push eax
    push ebx

    dec eax
    inc ebx
    mov esi, dword [max_val]
    mul esi
    add eax, ebx
    cmp eax, 31
    jle number_4
    mov esi, dword [ecx]
    xor edx, edx
    xor ebx, ebx
    mov edx, 64
    sub edx, eax
    mov eax, 32
    sub eax, edx
    mov ebx, 1
    push ecx
    xor ecx, ecx
    mov ecx, eax
    shl ebx, cl
    or esi, ebx
    pop ecx
    mov dword [ecx], esi
    jmp exit_33
number_4:

    mov esi, dword [ecx + 4]
    xor ebx, ebx
    mov ebx, 1
    push ecx
    xor ecx, ecx
    mov ecx, eax
    shl ebx, cl
    or esi, ebx
    pop ecx
    mov dword [ecx + 4], esi

exit_33:

    ;; restore offset

    pop ebx
    pop eax

exit_3:

down_left:

    cmp eax, 0
    je exit_4
    cmp ebx, 0
    je exit_4

    ;; prepare the offset
    
    push eax
    push ebx

    dec eax
    dec ebx
    mov esi, dword [max_val]
    mul esi
    add eax, ebx
    cmp eax, 31
    jle number_5
    mov esi, dword [ecx]
    xor edx, edx
    xor ebx, ebx
    mov edx, 64
    sub edx, eax
    mov eax, 32
    sub eax, edx
    mov ebx, 1
    push ecx
    xor ecx, ecx
    mov ecx, eax
    shl ebx, cl
    or esi, ebx
    pop ecx
    mov dword [ecx], esi
    jmp exit_44
number_5:

    mov esi, dword [ecx + 4]
    xor ebx, ebx
    mov ebx, 1
    push ecx
    xor ecx, ecx
    mov ecx, eax
    shl ebx, cl
    or esi, ebx
    pop ecx
    mov dword [ecx + 4], esi

exit_44:

    ;; restore offset

    pop ebx
    pop eax

exit_4:


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
