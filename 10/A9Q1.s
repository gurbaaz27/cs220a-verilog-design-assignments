## CS220 Assignment #9
## Group #9
## Question 1
## Write a recursive function to compute the nth Fibonacci number. 
## Write a main function that accepts an integer n as input (from keyboard) and 
## prints the first n Fibonacci numbers on the display as a comma separated series.

.text
main:   
        la $a0, input       # User prompt for a non-negative integer input 
        li $v0, 4
        syscall
        li $v0, 5           # Reads the integer n
        syscall
        
        move $t2, $v0       # Move n to $t2
        la $t0 , arrayX
        move $t1 , $t0
        la $a0, inputnum       # User prompt for a non-negative integer input 
        li $v0, 4
        syscall
        add $t4 ,  $0, $0
       

read:   li $v0 , 5
        syscall
        sw $v0 , 0($t1)

        addi $t1 , $t1 , 4
        addi $t4 , $t4 , 1
        bne  $t4 , $t2 , read

        la $a0, k       # User prompt for a non-negative integer input 
        li $v0, 4
        syscall

        li $v0, 5           # Reads the integer k
        syscall
        move $s1, $v0       # Move k to $s1

        move $t1 ,$t0
   #     addi $t3, $t3, 1    # Initialise starting variable to 1
        add $a0, $0 , $0
        move $a1, $t2
        move $a2, $s1
   #     move $v0, $t3
        jal binary             # Call function to get fib(n)
        move $t4, $v0       

        move $a0, $t4       # Prints the value of fib (n)
        li $v0, 1
        syscall

    #    slt $t5, $t3, $t2
    #    beq $t5, $0, jump




        la $a0, endl        # Print '\n'
        li $v0 ,4
        syscall

        # End program
        li $v0, 10
        syscall


binary:
        # Compute and return fibonacci number
      #  beqz $a0, zero      # if n==0 return 0
      #  beq $a0, 1, one     # if n==1 return 1

        add $t5 , $a0 , $a1
        sra $t5 , $t5 , 1
        sll $t6 , $t5 , 2
        la $t0 , arrayX
        add $t6 , $t6, $t0
        lw $t7 , 0($t6)
        bne $t7 , $a2 , conti
        move $v0 , $t5
        jr $ra           #return if value found


conti:  
        # Calling fib(n-1)------------------------------------
        sub $sp, $sp, 4     # Store return address on stack
        sw $ra, 0($sp)
        

        slt $t6 , $t7 , $a2
        bgtz $t6 , elsecond
        move $a1 , $t5
        j ifcond
elsecond:
        addi $t5 , $t5,1
        move $a0 ,$t5
       

ifcond: 
             # n-1
        jal binary             # fib(n-1)
        

        lw $ra, 0($sp)      # Restore return address from stack
        add $sp, $sp, 4


        jr $ra              # Decrement the stack



.data
arrayX:           .space  60
input:      .asciiz "Assignment 10 submission by Group #9\nQ1. The following MIPS program computes nth Fibonacci number recursively and prints the first n Fibonacci numbers.\nEnter a non-negative integer n: "

inputnum:      .asciiz "Number paa /n"
#sep:        .asciiz ", "
k:          .asciiz "enter k /n"
endl:       .asciiz "\n"