.MODEL SMALL													
.STACK										
.DATA
mes1 db 'bit0=1$', 'bit1=1$','bit2=1$','bit3=1$','bit4=1$','bit5=1$','bit6=1$','bit7=1$'
mes0 db 'bit0=0$', 'bit1=0$','bit2=0$','bit3=0$','bit4=0$','bit5=0$','bit6=0$','bit7=0$'										
.CODE
start:
mov ax, @data
mov ds, ax
mov bx, 00040h	
mov es, bx
mov bx, 00017h

mov bl,byte ptr es:[bx]		;pun in bl continutul de la adresa 00040:00017
xor cx, cx   

  bucla:
    ror bl, 1       ;rotire la dreapta
    mov al, bl
    shr al, 7    	;shiftare la dreapta
    
    cmp al, 1   
    je tasta_on    	;daca al=1 sare la afisare mes1
    jne tasta_off 	;daca al=0 sare la afisare mes0

  tasta_on:
    mov ah, 09h     
    lea dx, mes1	;funct pt afisare
    add dx, cx		;trec la urmatorul text si tot asa
    int 21h
        
    add cx, 7	;adun cu 7 pt ca textul are 7 litere 

jmp bucla          
   
  tasta_off:
    mov ah, 09h     
    lea dx, mes0
    add dx, cx
    int 21h
        
    add cx, 7
          
jmp bucla
   	
mov ax,4C00H						
int 21h				 
end start