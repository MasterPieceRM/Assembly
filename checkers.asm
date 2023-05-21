
section .data
    max_val dd 8
section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

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
    add byte [ecx + eax], 1

    ;; restore offset

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
    add byte [ecx + eax], 1

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
    add byte [ecx + eax], 1

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
    add byte [ecx + eax], 1

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