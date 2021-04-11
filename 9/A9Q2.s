dotProduct:          
        addi     $sp, $sp, -16   # Create space on the stack          
        sw       $ra, 0($sp)     # Place values to be preserved         
        sw       $s0, 4($sp)     # on the stack.          
        sw       $s1, 8($sp)          
        sw       $s2, 12($sp)                                   
        
        # Read input arguments from the                                   
        # argument registers          
        move     $s0, $a0        # $s0 = address of x[ count ]         
        move     $s1, $a1        # $s1 = address of y[ count ]          
        move     $s2, $a2        # $s2 = size          
        
        move     $s3, $0         # count = 0          
        move     $s4, $0         # sum = 0 
        
loop:   slt      $t0, $s3, $s2   # if( count < size)
        beq      $t0, $0, exit1  # continue          
        lw       $t1, 0($s0)     # Read x[ count ] from memory          
        lw       $t2, 0($s1)     # Read y[ count ] from memory                                   
        
        # Call “product” and pass                                
        # parameters 
        # move     $a0, $t1          
        # move     $a1, $t2          
        # jal      product          
        # move     $t3, $v0
        mult	$t1, $t2			# $t0 * $t1 = Hi and Lo registers
        mflo	$t3					# copy Lo to $t2
        
        add      $s4, $s4, $t3    # sum = sum +                                     
                                  #       product (x[count],y[count])          
        addi     $s0, $s0, 4      # $s0 = $s0 + 4           
        addi     $s1, $s1, 4      # $s1 = $s1 + 4          
        addi     $s3, $s3, 1      # count++ 
        j  loop                    
        # 
        # Exit from dotProduct procedure 
        # 

exit1:  move     $v0, $s4        # Move sum to the return value                                           
                                 # register          
        lw       $ra, 0($sp)     # Restore the values of the           
        lw       $s0, 4($sp)     # preserved registers from the         
        lw       $s1, 8($sp)     # stack.          
        lw       $s2, 12($sp)          
        addi     $sp, $sp, 16    # Restore the stack pointer          
        
        jr $ra                   # Return to calling procedure

main:   la $s0, x            # x          
        la $s1, y            # y          
        la $s2, N            # size          
        lw $s2, 0($s2)                               
        # Call “dotproduct” and pass                                 
        # parameters (The registers to use                                
        # are listed at the beginning of the                       
        # program on page 8.) 
        move     $a0, $s0          
        move     $a1, $s1          
        move     $a2, $s2          
        jal      dotProduct       
        move     $s0, $v0        
        
        la $a0, Msg          # Print message          
        li $v0, 4          
        syscall         
        
        move $a0, $s0       # Print the value                               
                            # returned by the procedure “dotproduct”          
        li $v0, 1          
        syscall          
        
        li $v0, 10           # Quit program          
        syscall

# Sample data starts here          
        .data 
x:      .word 0 1 2 3 4 5 6 7 8 9
y:      .word 1 2 3 4 5 6 7 8 9 10 
N:      .word 10 
Msg:    .asciiz "The dot product is "