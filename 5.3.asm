.model small
.stack
.data 
     sir1 db 'IMR:$' 
	 sir2 db 13, 10, 'IRR:$'
	 sir3 db 13, 10, 'ISR:$' 
.code


afisare proc near 
    
    mov cx, 8h  
    mov bl, al

    bucla:
        rol bl, 1     
        mov dl, bl

        and dl, 1 
        add dl, 30h     

        mov ah, 02h      ;funct pt afisare ascii
        int 21h
  
    loop bucla  
 							
ret
afisare endp



start:  
	mov   ax,@data       
	mov  ds,ax
	         
;IMR 
	mov   ah,09h    
	lea  dx,sir1 
	int  21h 
			
	in al, 21h      ;citeste stare de la port 21h
	call afisare
			
;IRR
	mov   ah, 09h    
	lea  dx, sir2 
	int  21h 
			 
	mov al, 0ah     ;RR=1 RIS=0
	out 20h, al     ;scrie la adresa de port 20h
	in al, 20h      ;citire 
	call afisare
	
;ISR
	mov   ah,09h    
	lea  dx,sir3 
	int  21h 
			            
	mov al,0bh       ;RR=1 RIS=1
	out 20h,al
	in al,20h
	call afisare			
			
		
	mov   ax,4C00h        
	int  21h 
end   start 