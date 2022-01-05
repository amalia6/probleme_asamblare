.MODEL SMALL
.STACK 100H  
.DATA
mesaj db 'acestaesteuntextfaraspatiu$' 
len equ $-mesaj
vector db 0h
.CODE
start:
    
    mov ax, @data
    mov ds, ax 
    
    mov cx, len			;lungimea mesajului (pe ex asta e 14! cx=14)
    mov bx, offset mesaj	
    
bucla: 
    xor bl, bl	

    add bl, vector 		;trec la urmatoarea litera		
    mov al, mesaj[bx] 		;imi pun in al cate o litera pe rand 
    
    SUB al, 20H			;am in al codul ascii pt litera mica si scad 20 ca sa am cod ascii litera mare
    
    MOV AH, 05H			;funct pt afisare litera cu cod ascii
    MOV DL, AL			; in dl trb sa am codu ascii de la litera ca sa mi o afiseze
    INT 21H
     
    inc vector		;incrementez vector ca sa parcurg siru

    
loop bucla		;intra in bucla de 14 ori pt ca asa am pus in contor

end start   