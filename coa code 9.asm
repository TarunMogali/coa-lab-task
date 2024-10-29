ORG 100h               

MOV AH, 09h            
MOV DX, OFFSET msg_input1  
INT 21h                

MOV AH, 01h            
INT 21h                
SUB AL, '0'            
MOV BL, AL             

MOV AH, 09h            
MOV DX, OFFSET msg_input2  
INT 21h                

MOV AH, 01h            
INT 21h                
SUB AL, '0'            
MOV BH, AL             

CMP BL, BH             
JE numbers_equal       

MOV AH, 09h            
MOV DX, OFFSET msg_not_equal 
INT 21h                
JMP end_program        

numbers_equal:
MOV AH, 09h            
MOV DX, OFFSET msg_equal    
INT 21h                

end_program:
MOV AH, 4Ch            
INT 21h                

msg_input1     DB 0Dh, 0Ah, 'Enter the first digit: $'  
msg_input2     DB 0Dh, 0Ah, 'Enter the second digit: $' 
msg_equal      DB 0Dh, 0Ah, 'Equal$'                    
msg_not_equal  DB 0Dh, 0Ah, 'Not Equal$'




