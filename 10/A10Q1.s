## CS220 Assignment #10
## Group #9
## Question 1
## Write a recursive function to do binary search for a given element. 
## Write a main function that accepts an integer n and n element of sorted array and key k to search in sorted array. 
## Prints “Found element at index N” if key k is found else “Element was not found”.

.text
main:
        li $v0, 4            
        la $a0, input_num    # User prompt for a non-negative integer input n
        syscall

        li $v0, 5            # Reads the integer n
        syscall

        add $s0, $v0, $0     # Move n to $s0
        add $t0, $s0, $0
        la $s1, arrayA       
        add $t1, $s1, $0
        li $v0, 4
        la $a0, input_arr   # User prompt for sorted array elements
        syscall


read:
        li $v0, 5
        syscall
        sw $v0, 0($t1)

        addi $t1, $t1, 4
        addi $t0, $t0, -1
        bne $t0, $0, read   # Read the elements of array iteratively n times

        li $v0, 4
        la $a0, input_key   # User prompt for the key to be searched k
        syscall

        li $v0, 5           # Reads the integer k
        syscall

        add $a0, $s1, $0
        xor $a1, $a1, $a1
        addi $a2, $s0, -1
        add $a3, $v0, $0    # Move k to $a3

        addi $sp, $sp, -4
        sw $ra, 0($sp)

        jal binary_search   # Calls the recursive binary search function

        lw $ra, 0($sp)
        addi $sp, $sp, 4

        addi $t0,$0,-1
        bne $v0,$t0,else
        li $v0, 4
        la $a0, error404    # Failure message
        syscall
        li $v0, 4
        la $a0, endl
        syscall
        j end


else:
        addi $sp,$sp,-4
        sw $v0,0($sp)
        li $v0, 4
        la $a0, findsuccess     # Success message
        syscall
        lw $v0,0($sp)
        addi $sp,$sp,4
        addi $a0, $v0, 0
        li $v0,1                # Prints the index of key
        syscall
        li $v0, 4
        la $a0, note            # Prints indexing assumption
        syscall
        li $v0, 4
        la $a0, endl            # Prints '\n'
        syscall

end:
        jr $ra


binary_search:
        slt $t0, $a2, $a1
        beq $t0, $0, label1     # Checking if l > r
        addi $v0, $0, -1
        jr $ra


label1:
        sub $t1,$a2,$a1         
        srl $t1,$t1,1           
        add $t0, $a1, $t1       

        sll $t1, $t0, 2
        add $t1, $a0, $t1
        lw $t1, 0($t1)

        bne $t1, $a3, label2
        add $v0, $t0, $0
        jr $ra


label2:
        slt $t1, $a3, $t1
        beq $t1, $0, label3
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        addi $a2, $t0, -1
        jal binary_search
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra


label3:
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        addi $a1, $t0, 1
        jal binary_search
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra


.data
arrayA: 	.space 48
input_num: 	.asciiz "Assignment 10 submission by Group #9\nQ1. The following MIPS program performs a recursive binary search on a given sorted array for a given element.\nEnter the size of sorted array n (n <= 12): \n"
input_arr:      .asciiz "Enter the n elements of sorted array (ascending order):-\n"
input_key:      .asciiz "Enter the key to search in array k: \n"
findsuccess:    .asciiz "Found element at index "
error404:       .asciiz "Element was not found"
note:           .asciiz " (assuming 0-based indexing)"
endl:           .asciiz "\n"