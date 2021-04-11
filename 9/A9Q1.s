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

        move $t3, $0                                    


loop:   
        addi $t3, $t3, 1    # Initialise starting variable to 1
        move $a0, $t3
        move $v0, $t3
        jal fib             # Call function to get fib(n)
        move $t4, $v0       

        move $a0, $t4       # Prints the value of fib (n)
        li $v0, 1
        syscall

        slt $t5, $t3, $t2
        beq $t5, $0, jump
        la $a0, sep         # Prints the separator ', '
        li $v0,4
        syscall


jump:   
        bne $t3, $t2, loop

        la $a0, endl        # Print '\n'
        li $v0 ,4
        syscall

        # End program
        li $v0, 10
        syscall


fib:
        # Compute and return fibonacci number
        beqz $a0, zero      # if n==0 return 0
        beq $a0, 1, one     # if n==1 return 1

        # Calling fib(n-1)------------------------------------
        sub $sp, $sp, 4     # Store return address on stack
        sw $ra, 0($sp)

        sub $a0, $a0, 1     # n-1
        jal fib             # fib(n-1)
        add $a0, $a0, 1

        lw $ra, 0($sp)      # Restore return address from stack
        add $sp, $sp, 4


        sub $sp, $sp, 4     # Push return value to stack
        sw $v0, 0($sp)
        #------------------------------------------------------

        # Calling fib(n-2)-------------------------------------
        sub $sp, $sp, 4     # Store return address on stack
        sw $ra, 0($sp)

        sub $a0, $a0,2      # n-2
        jal fib             # fib(n-2)
        add $a0, $a0,2

        lw $ra, 0($sp)      # Restore return address from stack
        add $sp, $sp,4

        lw $s7, 0($sp)      # Pop return value from stack
        add $sp, $sp, 4
        #------------------------------------------------------

        add $v0, $v0, $s7   # Compute fib(n) = fib(n-2) + fib(n-1)
        jr $ra              # Decrement the stack


zero:   
        li $v0, 0
        jr $ra  


one:    
        li $v0, 1
        jr $ra


.data
input:      .asciiz "Assignment 9 submission by Group #9\nQ1. The following MIPS program computes nth Fibonacci number recursively and prints the first n Fibonacci numbers.\nEnter a non-negative integer n: "
sep:        .asciiz ", "
endl:       .asciiz "\n"