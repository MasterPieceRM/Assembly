%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

sort_procs:
    ;; DO NOT MODIFY
    enter 0, 0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here

    xor ecx, ecx                ; Initialize outer loop counter (i = 0)
outer_loop:
    mov ebx, ecx           ; Initialize inner loop counter (j = i)
inner_loop:

    push eax
    push ebx
    push ecx
    xor eax, eax

    mov eax, ecx
    add eax, ecx
    add eax, ecx
    add eax, ecx
    add eax, ecx

    mov edi, eax

    mov eax, ebx
    add eax, ebx
    add eax, ebx
    add eax, ebx
    add eax, ebx

    ;; check prio

    xor ebx, ebx
    mov bh, byte [edx + edi + proc.prio]
    mov bl, byte [edx + eax + proc.prio]

    cmp bh, bl
    jg swap
    jl no_swap
    ;; check time

    xor ecx, ecx
    xor ebx, ebx

    mov bx, word [edx + edi + proc.time]
    mov cx, word [edx + eax + proc.time]

    cmp bx, cx
    jg swap
    jl no_swap

    ;; check id

    xor ecx, ecx
    xor ebx, ebx

    mov bx, word [edx + edi + proc.pid]
    mov cx, word [edx + eax + proc.pid]

    cmp bx, cx
    jl no_swap

swap:

    xor ebx, ebx

    ;; Swap prio[i] with prio[i+1]
    mov bl, byte [edx + edi + proc.prio]   ; Store prio[i] in bl
    mov bh, byte [edx + eax + proc.prio]   ; Store prio[i+1] in bh
    mov byte [edx + edi + proc.prio], bh   ; Copy prio[i+1] to prio[i]
    mov byte [edx + eax + proc.prio], bl   ; Copy prio[i] to prio[i+1]

    xor ecx, ecx
    xor ebx, ebx

    ;; Swap pid[i] with pid[i+1]
    mov cx, word [edx + edi + proc.pid]    ; Store pid[i] in cx
    mov bx, word [edx + eax + proc.pid]    ; Store pid[i+1] in bx
    mov word [edx + edi + proc.pid], bx    ; Copy pid[i+1] to pid[i]
    mov word [edx + eax + proc.pid], cx    ; Copy pid[i] to pid[i+1]

    xor ecx, ecx
    xor ebx, ebx    

    ;; Swap time[i] with time[i+1]
    mov cx, word [edx + edi + proc.time]   ; Store time[i] in cx
    mov bx, word [edx + eax + proc.time]   ; Store time[i+1] in bx
    mov word [edx + edi + proc.time], bx   ; Copy time[i+1] to time[i]
    mov word [edx + eax + proc.time], cx   ; Copy time[i] to time[i+1]

no_swap:

    ;;restore values

    pop ecx
    pop ebx
    pop eax

    inc ebx            ; Increment inner loop counter (j++)
    cmp ebx, eax         ; Compare with procs number
    jl inner_loop      ; Jump to inner_loop if j < procs number
    inc ecx                ; Increment outer loop counter (i++)
    cmp ecx, eax             ; Compare with procs number
    jl outer_loop          ; Jump to outer_loop if i < procs number

    ;; Your code ends here

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY