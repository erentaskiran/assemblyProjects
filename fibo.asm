ORG 100h
               
mov AX, 1000h       ;
mov DS, AX          ;
mov SI, 10          ; 
mov AX, 0           ; 

mov [0200h], 0      ; 
mov [0250h], 1      ; 
mov [0300h], 0      ; 

fibo:
    mov BL, [0200h] ; 
    mov BH, [0250h] ;
    
    sub SI, 1       ;
    cmp SI, 0       ;
    je end          ;
    
    cmp [0300h], 0  ; 
    je addfirst     ; 
    ja addsecond    ;

    add [0250h], BL ; 

    cmp [0300h], 1  ; 
    jb setone       ; 
    je setzero      ;
    
    
    loop fibo       ; 

addfirst:
    add [0200h], BH ; 
    
   cmp [0300h], 1   ; 
    jb setone       ; 
    je setzero      ;
             
addsecond:
    add [0250h], BL ; 
    
   cmp [0300h], 1   ; 
    jb setone       ; 
    je setzero      ;

setone:
    mov [0300h], 1  ; 
    loop fibo       ; 
setzero:
    mov [0300h], 0  ; 
    loop fibo       ;  
end:
    ret