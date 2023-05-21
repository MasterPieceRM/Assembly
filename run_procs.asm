 %include "../include/io.mac"

struc avg 
    .quo: resw 1
    .remain resw 1
endstruc

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0
    prios db 1
    index dd 0

section .text
    global run_procs
    extern printf

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    push eax                ; store eax value
    xor edi, edi            ; Initialize outer loop counter (i = 0)
    xor esi, esi
    xor edx, edx
    push ebx
    xor ebx, ebx
    mov bh, byte [ecx + proc.prio]
    mov byte [prios], bh
    sub bh, 1
    mov byte [index], bh
    mov byte [index + 1], 0
    add bh, 1
    pop ebx

outer_loop:

    mov eax, edi
    add eax, edi
    add eax, edi
    add eax, edi
    add eax, edi ; offset

    push ebx
    push edi

    xor ebx, ebx
    mov bh, byte [ecx + eax + proc.prio]
    cmp bh, byte [prios]
    je same_prio

    push eax
    mov eax, dword [index]
    mov word [time_result + 4 * eax], si
    mov word [prio_result + 4 * eax], dx
    pop eax

    xor edx, edx            ; reset same prio counter
    xor esi, esi            ; reset sum

    sub bh, 1
    mov byte [index], bh
    mov byte [index + 1], 0
    add bh, 1
    mov byte [prios], bh


same_prio:

    add dx, 1
    add si, word [ecx + eax + proc.time]

    pop edi
    pop ebx
    inc edi                ; Increment outer loop counter (i++)
    cmp edi, ebx            ; Compare with procs number
    jl outer_loop          ; Jump to outer_loop if i < procs number

    push eax
    xor eax, eax
    mov eax, dword [index]
    mov word [time_result + 4 * eax], si
    mov word [prio_result + 4 * eax], dx
    pop eax

    pop eax ; restore eax value
    push ecx
    xor ebx, ebx
    xor esi, esi
    xor edi, edi
    
final_loop:

    push eax
    xor eax, eax
    xor edx, edx
    xor ecx, ecx

    mov ax, word [time_result + 4 * edi]
    mov cx, word [prio_result + 4 * edi]
    cmp cx, 0
    je not_div
    
    div cx

not_div:
    mov si, ax
    pop eax

    mov word [eax + 4 * edi + avg.quo], si
    mov word [eax + 4 * edi + avg.remain], dx
    inc edi
    cmp edi, 5
    jl final_loop

    pop ecx

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY