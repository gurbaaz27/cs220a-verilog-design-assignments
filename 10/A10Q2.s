## CS220 Assignment #10
## Group #9
## Question 2
## Write a MIPS program to calculate \sum_{i=0}^n (-1)^n a_i. 
## A = (a_n−1, a_n−2, . . . , a_0) is n-dimensional single-precision floating-point vector.

.text
main:
        la $a0, input            # User prompt for length of vector
        li $v0, 4
        syscall

        li $v0, 5                # Read the non-negative integer n
        syscall

        move $s0, $v0

        la $t1, arrayX           # Get address of arrayX

        move $t3, $t1
        add $t4, $0, $0               

        la $a0, Xin              
        li $v0, 4
        syscall


read:   
        li $v0, 6                # Get input float for arrayX
        syscall
        swc1 $f0, 0($t3)
        addi $t3, $t3, 4
        addi $t4, $t4, 1
        bne $t4, $s0, read

        add $t4, $0, $0
        sub.s $f4, $f4, $f4


loop:       
        lwc1 $f1, 0($t1)

        andi  $t5, $t4, 1
        bgtz  $t5, label1
        add.s $f4, $f4, $f1  
        j label2


label1: 
        sub.s $f4, $f4, $f1


label2:
        addi  $t4, $t4, 1
        addi  $t1, $t1, 4
        bne $t4, $s0, loop

        la $a0, Res             # Prints 'The result is \n'
        li $v0, 4
        syscall

        mov.s $f12, $f4
        li $v0, 2
        syscall
        la $a0, Msg             # Prints '\n'
        li $v0, 4
        syscall
        jr $ra                  # Return to caller


.data 
arrayX:           .space  60
input:            .asciiz "Assignment 10 submission by Group #9\nQ2. The following MIPS program calculates the alternate sum of elements of single-precision floating-point vector A.\nEnter the size of array n: \n"
Xin:              .asciiz "Enter the n numbers of vector A:-\n"
Msg:              .asciiz "\n"
Res:              .asciiz "The result is: "