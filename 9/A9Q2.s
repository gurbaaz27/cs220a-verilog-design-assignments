## CS220 Assignment #9
## Group #9
## Question 2
## Write a MIPS program to calculate \sum_{i=0}^n a_i b_i. 
## A and B are n-dimensional floating-point vectors.
.text
main:
        la $a0, input            # User prompt for length of vectors
        li $v0, 4
        syscall

        li $v0, 5                # Read the non-negative integer n
        syscall

        move $s0, $v0

        la $t1, arrayX           #Get address of arrayX
        la $t2, arrayY           #Get address of arrayX

        move $t3, $t1
        add $t4, $0, $0               

        la $a0, Xin             # Get input entries for vector X
        li $v0, 4
        syscall


read1:   
        li $v0, 6                #Get input float fo arrayX
        syscall
        swc1 $f0, 0($t3)
        addi $t3, $t3, 4
        addi $t4, $t4, 1
        bne $t4, $s0, read1

        add $t4, $0, $0
        move $t3, $t2

        la $a0, Yin             # Get input entries for vector Y
        li $v0,4
        syscall


read2:   
        li $v0, 6               #Get input float fo arrayY
        syscall
        swc1 $f0, 0($t3)
        addi $t3, $t3, 4
        addi $t4,$t4, 1
        bne $t4, $s0, read2

        add $t4, $0, $0
        sub.s $f4, $f4, $f4     


loop:       
        lwc1 $f1, 0($t1)
        lwc1 $f2, 0($t2)

        mul.s $f3, $f1, $f2
        add.s $f4, $f4, $f3             #Add product to sum
        addi  $t4, $t4, 1
        addi  $t1, $t1, 4
        addi  $t2, $t2, 4
        bne $t4, $s0, loop

        la $a0, Res         # Prints 'The result is \n'
        li $v0,4
        syscall

        mov.s $f12 , $f4
        li $v0, 2
        syscall
        la $a0, Msg         # Prints '\n'
        li $v0,4
        syscall
        jr $ra              # Return to caller


.data 
arrayX:           .space  60
arrayY:           .space  60
input:            .asciiz "Assignment 9 submission by Group #9\nQ2. The following MIPS program computes the dot-product of two n-dimenionsal floating-point vectors A and B.\nEnter the length of vector n (<=15): "
Xin:              .asciiz "Enter the n numbers of vector X:-\n"
Yin:              .asciiz "Enter the n numbers of vector Y:-\n"
Msg:              .asciiz "\n"
Res:              .asciiz "The result is: "