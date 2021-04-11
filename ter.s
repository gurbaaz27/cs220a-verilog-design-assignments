.data
arrayX: .space 40
msg: .asciiz "Sum of values: "
endmsg: .asciiz "\n"
prompt: .asciiz "Enter the length of vector \n"

.text
.globl main
main:
     la $a0 ,prompt       #get input length from user
     li $v0 ,4
     syscall

     li $v0,5    #Read the number(n)
     syscall

    addi $t0, $v0, 0 # i = n
    la $t1, arrayX # $t1 arrayX
    loop: li $v0, 5 # syscall 5 (read_int)
    syscall
    sw $v0, 0($t1) # *arrayX  $v0
    addi $t1, $t1, 4 # arrayX++
    addi $t0, $t0, -1 # i--
    bne $t0, $0, loop
    addi $t0, $0, 10 # i  10
    la $t1, arrayX # $t1  arrayX
    xor $t2, $t2, $t2 # sum  0

loop1: lw $v0, 0($t1) # $v0  *arrayX
    add $t2, $t2, $v0 # sum sum + $v0
    addi $t1, $t1, 4 # arrayX++
    addi $t0, $t0, -1 # i--
    bne $t0, $0, loop1
    li $v0, 4 # print_string
    la $a0, msg # argument: string
    syscall # print the string
    li $v0, 1 # print_int
    add $a0, $t2, $0 # int to print
    syscall
    li $v0, 4 # print_string
    la $a0, endmsg # argument: string
    syscall # print the string

    jr $ra # retrun to caller