; GUARDAR EL PRIMER ARREGLO EN [200h] Y EL SEGUNDO EN [210h]
; MAIN
        org     100h

        section .text
        
        mov     BP, arrByte     ; BP = puntero a arrByte
        mov     BL, 02
        call    StoreArr        ; llama función

       ; mov     BP, arrWord     ; BP = puntero a arrWord
        ;mov     BX, 210h        ; BX = dirección de guardado
        ;call    StoreArr        ; llama función

        int     20h

        section .data

arrByte db      01,02,03,04,05,06,07,08,09,10    
len equ $ - arrByte
         ; arreglo de numeros byte empezando en dirección arrByte
;arrWord dw      0128h,0256h,0512h,1024h,0xA     ; arreglo de numeros word empezando en dirección arrWord

; FUNCIONES

; función para guardar un arreglo
; BP: puntero a arreglo         BX: dirección de guardado
StoreArr:
        xor     SI, SI          ; SI = 0
        xor     DI, DI          ; SI = 0
while:  
        xor     AX,AX
        mov     AL, [BP + SI]     ; AL = [puntero a arreglo + SI]
        inc     SI
        mov     CL, AL
        cmp     AL, len         ; verifica si AL == 0xA
        je      end             ; salta a end si AL == 0xA

        div     BL

        cmp     AH, 0
        ja     par

        je     impar
       
       
end:    
        ret                     ; regresa a MAIN

par:
        mov     byte [300h + DI], CL     ; [direccion de guardado + SI] = AL
        inc     DI              ; SI++
        jmp     while           ; salta incondicionalente a while

impar:
        mov     byte [310h + DI], CL     ; [direccion de guardado + SI] = AL
        inc     DI              ; SI++
        jmp     while           ; salta incondicionalente a while


        

