.model small
.stack 100h
.data
    str  dw 100 dup('$')
    ms1  dw '  Nhap chuoi can kiem tra: $'
    crtf dw 13, 10, '$'
    ms2  dw 'So lan xuat hien cua chuoi con "ktmt": $'
    cnt  dw 0
     
     
.code

main proc
    
    mov ax, @data
    mov ds, ax
    
    lea dx, ms1
    mov ah, 9
    int 21h
    
    mov ah, 10
    lea dx, str
    int 21h
    
    mov cx, [str + 1]
    xor ch, ch
    lea si, str + 2
    
    
    lap:
        
        mov dl, [si]
        cmp dl, 'k'
        jne continue
        inc si
        dec cx
        cmp cx, 0
        je stop
        
        mov dl, [si]
        cmp dl, 't'
        jne continue
        inc si
        dec cx
        cmp cx, 0
        je stop
        
        mov dl, [si]
        cmp dl, 'm'
        jne continue
        inc si
        dec cx
        cmp cx, 0
        je stop
        
        mov dl, [si]
        cmp dl, 't'
        jne continue
        inc si
        dec cx
        cmp cx, 0
        je cong
        
        mov dl, [si]
        cmp dl, ' '
        jne continue
         
         
    cong:
    
        mov ax, 1
        add cnt, ax
        cmp cx, 0
        je stop
        
   
    continue:
    
        inc si
        dec cx
        cmp cx, 0
        jne lap
        
        
    stop:
    
        call output  
    
    mov ah, 4ch
    int 21h
    
output proc
      
    lea dx, crtf
    mov ah, 9
    int 21h
    
    lea dx, ms2
    mov ah, 9
    int 21h
    
    mov ax, cnt
    
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
    
end main