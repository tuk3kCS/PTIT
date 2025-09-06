.MODEL LARGE
.STACK 1000H
.DATA

M1 DB 10, 13, 10, 13, '****He thong Hoa don Nha hang PTIT****$', 10, 13 
M2 DB 10, 13, 10, 13, 'Moi nhap lua chon cua ban: $'

M3 DB 10, 13, '  1. Thuc don bua sang$' 
M4 DB 10, 13, '  2. Thuc don bua trua va bua toi$'  
                              
M8 DB 10, 13, 10, 13, 'Moi nhap lua chon mon an cua ban trong thuc don$'
  
;Bua sang  
M9 DB 10, 13, '  1. Pho chin        40k$' 
M10 DB 10, 13, '  2. Pho tai         40k$'
M11 DB 10, 13, '  3. Pho tai chin    40k$'
M12 DB 10, 13, '  4. Pho tai nam     40k$'
M13 DB 10, 13, '  5. Pho tai gau     40k$'
M14 DB 10, 13, '  6. Pho tai bap     40k$'
M15 DB 10, 13, '  7. Pho tai gan     40k$'
M16 DB 10, 13, '  8. Pho tai lan     40k$'
M17 DB 10, 13, '  9. Pho bo dac biet 60k$' 

;Bua trua va bua toi
M25 DB 10, 13, '  1. Com rang dua bo   40k$' 
M26 DB 10, 13, '  2. Com rang cai bo   40k$' 
M27 DB 10, 13, '  3. Com rang thap cam 50k$' 
M28 DB 10, 13, '  4. Com ga xoi mam    40k$'
M29 DB 10, 13, '  5. Pho xao           40k$'
M30 DB 10, 13, '  6. My xao            40k$'
M31 DB 10, 13, '  7. Bo ap chao        40k$'
M32 DB 10, 13, '  8. Bo xao gion       60k$'
M33 DB 10, 13, '  9. Lau bo            90k$'

;Khong hop le
M55 DB 10, 13, 10, 13, 'Lua chon khong hop le$'
M56 DB 10, 13, 'Xin hay khoi dong lai phan mem$'

M57 DB 10, 13, 10, 13, 'Moi nhap lua chon cua ban: $'
M58 DB 10, 13, 'Moi nhap so luong: $'
M59 DB 10, 13, 'Thanh tien: $'

DRINK DB ?
QUANTITY DB ?

M60 DB 10, 13, 10, 13, '  1. Quay tro lai menu chinh$'
M61 DB 10, 13, '  2. Thoat phan mem$'

SEJ DB 10, 13, 10, 13, ' $'


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

TOP:

    LEA DX, M1
    MOV AH, 9
    INT 21H
    
    LEA DX, M3
    MOV AH, 9
    INT 21H
    
    LEA DX, M4
    MOV AH, 9
    INT 21H
    
    LEA DX, M2
    MOV AH, 9
    INT 21H
     
    MOV AH, 1
    INT 21H
    MOV BH, AL
    SUB BH, 48
    
    CMP BH, 1
    JE BREAKFAST
    
    CMP BH, 2
    JE LD
    
    JMP INVALID
    
    JMP EXIT


BREAKFAST:

    ;Hien thi menu bua sang
    LEA DX, M8
    MOV AH, 9
    INT 21H
    
    ;Mon 1
    LEA DX, M9
    MOV AH, 9
    INT 21H 
    
    ;Mon 2
    LEA DX, M10
    MOV AH, 9
    INT 21H
    
    ;Mon 3
    LEA DX, M11
    MOV AH, 9
    INT 21H 
    
    ;Mon 4
    LEA DX, M12
    MOV AH, 9           
    INT 21H
    
    ;Mon 5
    LEA DX, M13         
    MOV AH, 9
    INT 21H
    
    ;Mon 6
    LEA DX, M14     
    MOV AH, 9
    INT 21H
            
    ;Mon 7
    LEA DX, M15
    MOV AH, 9           
    INT 21H
            
    ;Mon 8        
    LEA DX, M16        
    MOV AH, 9
    INT 21H 
    
    ;Mon 9
    LEA DX, M17         
    MOV AH, 9
    INT 21H
    
    LEA DX, M57              
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    SUB BL, 48 
    
    CMP BL, 1
    JE FOURTY
    
    CMP BL,2
    JE FOURTY
    
    CMP BL,3
    JE FOURTY 
    
    CMP BL,4
    JE FOURTY
    
    CMP BL,5
    JE FOURTY
    
    CMP BL,6
    JE FOURTY
    
    CMP BL,7
    JE FOURTY
    
    CMP BL,8
    JE FOURTY 
    
    CMP BL,9
    JE SIXTY
    
    JMP INVALID 
        
    JMP EXIT
    
    
LD:
    
    ;Hien thi menu bua trua va bua toi
    LEA DX, M8
    MOV AH, 9
    INT 21H
    
    ;Mon 1
    LEA DX, M25               
    MOV AH, 9
    INT 21H 
    
    ;Mon 2
    LEA DX, M26               
    MOV AH, 9
    INT 21H
    
    ;Mon 3
    LEA DX, M27               
    MOV AH, 9
    INT 21H  
    
    ;Mon 4
    LEA DX ,M28               
    MOV AH, 9
    INT 21H 
    
    ;Mon 5
    LEA DX, M29               
    MOV AH, 9
    INT 21H                        
    
    ;Mon 6
    LEA DX, M30               
    MOV AH, 9
    INT 21H 
    
    ;Mon 7
    LEA DX, M31               
    MOV AH, 9
    INT 21H 
    
    ;Mon 8
    LEA DX,M32               
    MOV AH,9
    INT 21H  
    
    ;Mon 9
    LEA DX,M33               
    MOV AH,9
    INT 21H
    
    LEA DX, M57              
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    SUB BL, 48 
    
    CMP BL, 1
    JE FOURTY
    
    CMP BL, 2
    JE FOURTY
    
    CMP BL, 3
    JE FIFTY
    
    CMP BL, 4
    JE FOURTY
    
    CMP BL, 5
    JE FOURTY
    
    CMP BL, 6
    JE FOURTY
    
    CMP BL, 7
    JE FOURTY
    
    CMP BL, 8
    JE SIXTY 
    
    CMP BL, 9
    JE NINETY
    
    JMP INVALID
    
    JMP EXIT

    
FOURTY:

    MOV BL, 4
    LEA DX, M58              
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
     
    MUL BL 
    AAM 
 
    MOV CX, AX 
    ADD CH, 48
    ADD CL, 48
   
    LEA DX, M59              
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
  
    MOV DL, CL
    INT 21H
    
    MOV DL, '0'
    INT 21H
    
    MOV DL, 'k'
    INT 21H
    
    LEA DX, M60
    MOV AH, 9
    INT 21H
    
    LEA DX, M61
    MOV AH, 9
    INT 21H

    LEA DX, M2
    MOV AH, 9
    INT 21H            
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    CMP AL, 1
    JE TOP
    
    CMP AL, 2
    JE EXIT
    
    JMP INVALID

             
FIFTY:

    MOV BL, 4
    LEA DX, M58              
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    MUL BL 
    AAM 
 
    MOV CX, AX 
    ADD CH, 48
    ADD CL, 48
     
    LEA DX, M59              
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    
    MOV DL, CL
    INT 21H
    
    MOV DL, '0'
    INT 21H
    
    MOV DL, 'k'
    INT 21H 

    LEA DX, M60
    MOV AH, 9
    INT 21H
            
    LEA DX, M61
    MOV AH, 9
    INT 21H
    
    LEA DX, M2
    MOV AH, 9
    INT 21H 

    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    CMP AL, 1
    JE TOP
    
    CMP AL, 2
    JE EXIT
    
    JMP INVALID


SIXTY: 
   
    MOV BL, 6
   
    LEA DX, M58              
    MOV AH, 9
    INT 21H 
     
    MOV AH, 1
    INT 21H
    SUB AL, 48

    MUL BL 
    AAM 
 
    MOV CX, AX 
    ADD CH, 48
    ADD CL, 48

    LEA DX, M59              
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    
    
    MOV DL, CL
    INT 21H
    
    MOV DL, '0'
    INT 21H
    
    MOV DL, 'k'
    INT 21H 

    LEA DX, M60
    MOV AH, 9
    INT 21H

    LEA DX, M61
    MOV AH, 9
    INT 21H             
    
    LEA DX ,M2
    MOV AH ,9
    INT 21H 
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
            
    CMP AL, 1
    JE TOP
    
    CMP AL, 2
    JE EXIT
    
    JMP INVALID
    
      
NINETY:
   
    MOV BL, 9
    
    LEA DX, M58              
    MOV AH, 9
    INT 21H 
            
    MOV AH, 1
    INT 21H
    SUB AL, 48
         
    MUL BL 
    AAM 
 
    MOV CX, AX 
    ADD CH, 48
    ADD CL, 48
        
    LEA DX, M59              
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
        
    MOV DL, CL
    INT 21H
    
    MOV DL, '0'
    INT 21H
    
    MOV DL, 'k'
    INT 21H

    LEA DX, M60
    MOV AH, 9
    INT 21H

    LEA DX, M61
    MOV AH, 9
    INT 21H
    
    LEA DX, M2
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    CMP AL, 1
    JE TOP
    
    CMP AL, 2
    JE EXIT
    
    JMP INVALID 
    
    
INVALID:
   
    LEA DX, M55
    MOV AH, 9
    INT 21H 
    
    LEA DX, M56 
    MOV AH, 9
    INT 21H 

    JMP EXIT
    
    
EXIT:
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
    
END MAIN