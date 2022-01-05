.MODEL SMALL 
.STACK 100  
.DATA 
    sir DB 'Sistemul de operare are versiunea: $' 
.CODE
        MOV AX, @data
        MOV DS,AX  
        
        LEA DX, sir          ;incarcam adresa efectiva
        MOV AH, 09h          ;afisam sirul folosindu-ne de functia 09h
        INT 21h 
        
        XOR AX, AX

        MOV AH, 30H
        INT 21H        ;ax=00 05  
        
        MOV CL, AH     ;mutam val din ah
        ADD CL, 30h    ;adunam cu 30 pt cod ascii al caracterului
        ADD AL, 30h    ;adunam cu 30 pt cod ascii
         
        MOV AH, 02H
        MOV DL, AL     ;afisez 5 
        INT 21H
        
        MOV AH, 02H
        MOV DL, 2Eh    ;afisez .
        INT 21H
        
        MOV AH, 02H
        MOV DL, CL     ;afisez  0
        INT 21H     
       
        MOV AH,4CH
        INT 21H