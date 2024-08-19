org 100h

num1 db 24h
num2 db 29h

start:
    mov al, num1   ; Move number1 value to AL register 
    add al, num2   ; Add number2 value to the value in AL register 
    mov bl, al     ; Store the result in BL for later use 

    ; Convert upper nibble (4 bits) of AL to a character 
    mov ah, al     ; Copy AL to AH 
    and ah, 0F0h   ; Mask the lower nibble (all lower bits become 0's)  
    shr ah, 4      ; Shift right by 4 to get upper nibble 
    add ah, 30h    ; Convert to ASCII digits (0-9) 
    cmp ah, 39h    ; Compare AH value, if AH is less than 39h 
    jle print_first_digit 
    add ah, 7      ; Convert to ASCII letter (A-F) if AH > 39h  

print_first_digit: 
    mov dl, ah     ; Move first digit to DL for printing 
    mov ah, 02h    ; BIOS interrupt to display character 
    int 21h 

    ; Convert lower nibble (4 bits) of AL to a character 
    mov ah, bl     ; Move the original result back to AH
    and ah, 0Fh    ; Mask the upper nibble (all upper nibbles become 0's) 
    add ah, 30h    ; Convert to ASCII digits (0-9) 
    cmp ah, 39h    ; Compare AH value, if AH is less than 39h 
    jle print_second_digit 
    add ah, 7      ; Convert to ASCII letter (A-F) if AH > 39h  

print_second_digit: 
    mov dl, ah     ; Move second digit to DL for printing 
    mov ah, 02h    ; BIOS interrupt to display character 
    int 21h 

    ; End the program 
    mov ah, 4Ch    ; Terminate the program 
    int 21h
