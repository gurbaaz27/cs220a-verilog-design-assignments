## CS220 Assignment #10
## Group #9
## Question 1
## Write a recursive function to do binary search for a given element. 
## Write a main function that accepts an integer n and n element of sorted array and key k to search in sorted array. 
## Prints “Found element at index N” if key k is found else “Element was not found”.

.text
main:   
        la $a0, input           # User prompt for a non-negative integer input n
        li $v0, 4
        syscall
        li $v0, 5               # Reads the integer n
        syscall
        
        move $t2, $v0           # Move n to $t2
        la $t0, arrayX
        move $t1, $t0
        la $a0, inputnum        # User prompt for sorted array elements
        li $v0, 4
        syscall
        add $t4, $0, $0
       

read:   
        li $v0 , 5
        syscall
        sw $v0, 0($t1)

        addi $t1, $t1, 4
        addi $t4, $t4, 1
        bne  $t4, $t2, read     # Read the elements of array iteratively n times

        la $a0, inputk          # User prompt for the key to be searched k
        li $v0, 4
        syscall

        li $v0, 5               # Reads the integer k
        syscall
        move $s1, $v0           # Move k to $s1

        move $t1, $t0
        add $a0, $0, $0
        move $a1, $t2
        move $a2, $s1
        jal binary             # Call recursive function binary 
        move $t4, $v0

        la $a0, findsuccess     # Success message
        li $v0, 4
        syscall       

        move $a0, $t4          # Prints the value of index
        li $v0, 1
        syscall

        la $a0, note           # Indexing message
        li $v0, 4
        syscall   

        la $a0, endl            # Print '\n'
        li $v0, 4
        syscall

        # End program
        li $v0, 10
        syscall


binary:
        add $t5, $a0, $a1
        sra $t5, $t5, 1
        sll $t6, $t5, 2
        la $t0, arrayX
        add $t6, $t6, $t0
        lw $t7, 0($t6)
        bne $t7, $a2, conti
        move $v0, $t5

        jr $ra                  # Return if value found


conti:  
        sub $sp, $sp, 4         # Store return address on stack
        sw $ra, 0($sp)        

        slt $t6, $t7, $a2
        bgtz $t6, elsecond
        move $a1, $t5
        j ifcond


elsecond:
        addi $t5 , $t5,1
        move $a0 ,$t5
       

ifcond: 
        jal binary       

        lw $ra, 0($sp)          # Restore return address from stack
        add $sp, $sp, 4

        jr $ra                  


.data
arrayX:      .space  48
input:       .asciiz "Assignment 10 submission by Group #9\nQ1. The following MIPS program performs a recursive binary search on a given sorted array for a given element.\nEnter the size of sorted array n (n <= 12): "
inputnum:    .asciiz "Enter the n elements of sorted array:-\n"
inputk:      .asciiz "Enter the key to search in array k: "
findsuccess: .asciiz "Found element at index "
error404:    .asciiz "Element was not found"
note:        .asciiz " (assuming 0-based indexing)"
endl:        .asciiz "\n"