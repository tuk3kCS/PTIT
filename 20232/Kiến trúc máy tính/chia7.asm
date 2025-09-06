.model small
.stack 100h
.data
    sum   dw 0
    ten   dw 10
    seven dw 7
    space dw ' $'
    str   dw 100 dup('$')
    tmp   dw 0
    tmp2  dw 0
    tmp3  dw 0
    tb2   dw 13, 10, 'Nhap 10 so co hai chu so: $'
    tb3   dw 13, 10, 'Tong cac so chia het cho 7: $'
    
.code


main proc
    
    mov ax, @data
    mov ds, ax
    
    mov cx, 10
    mov ch, 0
    
    lea dx, tb2
    mov ah, 9
    int 21h
    
    
    lap:
    
        mov tmp, cx
        call input
        
        mov cx, tmp
        dec cx
        mov bx, sum
        
        mov tmp3, ax
        div seven
        cmp dx, 0
        jne continue
        
        mov ax, tmp3
        add ax, bx
        mov sum, ax
           
           
    continue:
        
        mov ah, 9
        lea dx, space
        int 21h
        
        cmp cx, 0
        jne lap
        call output
        
        mov ah, 4ch
        int 21h
              
              
    main endp

    input proc
        
        mov ah, 10
        lea dx, str
        int 21h
        
        lea si, str + 2
        mov cx, [str + 1]
        mov ch, 0
        mov ax, 0
        mov tmp2, ax
    
        
    lap2:
    
        mov bx, 0
        mov ax, tmp2
        mov bx, [SI]
        mov bh, 0
        sub bx, '0'
        
        mul ten
        add ax, bx
        mov tmp2, ax
        inc si
        loop lap2
        
    ret
    
input endp
    
output proc
    
    lea dx, tb3
    mov ah, 9
    int 21h
    
    mov ax, sum
    
    mov bx, 10
    mov cx, 0
    
    multi:
        mov dx, 0
        div bx
        push dx
        inc cx
        cmp ax, 0
        je print
        jmp multi
        
    print:
        pop dx
        add dl, 48
        mov ah, 2
        int 21h
        dec cx
        cmp cx, 0
        jne print
    ret
    
output endp

end main