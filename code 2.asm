org 100h 
num1 dw 1234h  ; define first 16-bit number 
num2 dw 5678h  ; define second 16-bit number 
start: 
mov ax, num1  ; move num1 to ax register 
add ax, num2  ; add num2 to ax register (ax = num1 + num2) 
; convert result to ascii and display 
mov bx, ax    ; copy result to bx for further processing 
; process higher byte of the result 
mov ah, bh    ; move higher byte of result to ah 
shr ah, 4     ; shift right by 4 to get upper nibble 
add ah, 30h   ; convert to ascii 
cmp ah, 39h   ; compare if less than '9' 
jle print_high_nibble 
add ah, 7     
; convert to ascii letter if necessary 
print_high_nibble: 
mov dl, ah    ; move ah to dl for printing 
mov ah, 02h   ; bios interrupt to display character 
int 21h 
; process lower nibble of the higher byte 
mov ah, bh    ; move higher byte of result to ah 
and ah, 0fh   ; mask upper nibble 
add ah, 30h   ; convert to ascii 
cmp ah, 39h   ; compare if less than '9' 
jle print_low_nibble 
add ah, 7     
; convert to ascii letter if necessary 
print_low_nibble: 
mov dl, ah    ; move ah to dl for printing 
mov ah, 02h   ; bios interrupt to display character 
int 21h 
; process upper nibble of the lower byte 
mov ah, bl    ; move lower byte of result to ah 
shr ah, 4     ; shift right by 4 to get upper nibble 
add ah, 30h   ; convert to ascii 
cmp ah, 39h   ; compare if less than '9' 
jle print_high_nibble2 
add ah, 7     
; convert to ascii letter if necessary 
print_high_nibble2: 
mov dl, ah    ; move ah to dl for printing 
mov ah, 02h   ; bios interrupt to display character 
int 21h 
; process lower nibble of the lower byte 
mov ah, bl    ; move lower byte of result to ah 
and ah, 0fh   ; mask upper nibble 
add ah, 30h   ; convert to ascii 
cmp ah, 39h   ; compare if less than '9' 
jle print_low_nibble2 
add ah, 7     
; convert to ascii letter if necessary 
print_low_nibble2: 
mov dl, ah    ; move ah to dl for printing 
mov ah, 02h   ; bios interrupt to display character 
int 21h 
mov ah, 4ch   ; terminate program 
int 21h 