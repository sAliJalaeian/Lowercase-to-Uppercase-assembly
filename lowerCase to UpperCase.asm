        .model small
        .stack  64
        .data
        
array   db "This IS a sample.$"

        .code
main    proc far
        mov ax, @data
        mov ds, ax
        
        lea si, array
        
        mov cx, 17
l1:     cmp [si], 'a'
        jb l2
        cmp [si], 'z'
        jg l2
        mov bh, [si]
        sub bh, 32
        mov [si], bh
        
l2:     inc si
        loop l1
        
        lea dx, array
        mov ah, 09h
        int 21h
        
        mov ax, 4c00h
        int 21h
        
        end main                              