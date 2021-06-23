org 100h

    sección .text
    xor AX , AX  
    xor SI , SI  
    xor BX , BX  
    XOR CX , CX  
    xor DX , DX  

    MOV SI , 0  
    MOV DI , 0d 

    MOV DH , 10               
    MOV DL , 20                
    Byte MOV [ 200h ], 12       
    Byte MOV [ 201h ], 14      
    Byte MOV [ 202h ], 16      

  
        MOV CL , [ cadena + SI ]    
       ;
        INC SI                 
        INC DL                
        INC DI               
        CMP DI , 6d            
        JB Iteracion1          
        MOV DI , 0              
        MOV DL , 20            
        jmp Iteracion2        

    Iteracion2:
        MOV DH , [ 200 h ]          
        llamar a movercursor       
        MOV CL , [ cadena + SI ]    
        llamar escribir ;   escribir
        INC SI                 
        INC DL                 
        INC DI                 
        CMP DI , 7d             
        JB Iteracion2         
        MOV DI , 0              
        MOV DL , 20             
        jmp Iteracion3        
     Iteracion3:
        MOV DH , [ 201 h ]        
        llamar a movercursor       
        MOV CL , [ cadena + SI ]   
        llamar escribir ;  escribir
        INC SI                
        INC DL                
        INC DI                
        CMP DI , 6d          
        JB Iteracion3        
        MOV DI , 0             
        MOV DL , 20           
        jmp Iteracion4       

    Iteracion4:
        MOV DH , [ 202 h ]  
        llamar a movercursor      ; llamar a mover cursor
        MOV CL , [ cadena + SI ]   
        llamar escribir  
        INC SI                 
        INC DL                 
        INC DI              
        CMP DI , 8d             
        JB Iteracion4         
        MOV DI , 0              
        MOV DL , 20             
        jmp esperar         

     modotexto: 
        MOV AH , 0 h            ; activa modo texto  
        MOV AL , 03h           
        INT 10h 
        RETIRADO

    movercursor:
        MOV AH , 02h           ; posiciona  de pantalla.  
        MOV BH , 0 h   
        INT 10h 
        RETIRADO

    escribir:
        MOV AH , 0Ah           
        MOV AL , CL             
        MOV BH , 0 h            
        MOV CX , 1h            ; número de veces a escribir el caracter  
        INT 10h 
        RETIRADO

    esperar:
        MOV AH , 00h           
        INT 16h 

    Salida:
        int 20h 


    sección .data

    cadena DB 'Arnold Alexis Cornejo Ayala'
    