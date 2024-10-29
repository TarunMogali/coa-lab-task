 ORG 100h               

MOV AH, 09h            
MOV DX, OFFSET msg_input  
INT 21h                

MOV AH, 01h            
INT 21h                
SUB AL, '0'            

MOV BL, AL             
AND BL, 1              
JZ even_number         

MOV AH, 09h            
MOV DX, OFFSET msg_odd     
INT 21h                
JMP end_program        

even_number:
MOV AH, 09h            
MOV DX, OFFSET msg_even    
INT 21h                

end_program:
MOV AH, 4Ch            
INT 21h                

msg_input     DB 0Dh, 0Ah, 'Enter a digit: $'   
msg_even      DB 0Dh, 0Ah, 'Even$'              
msg_odd       DB 0Dh, 0Ah, 'Odd$'



