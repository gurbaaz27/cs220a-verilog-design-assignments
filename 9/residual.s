
        #move $t3 , $t2
        #add $t3 , $0 , $0  # sum register

        #lwc1 $f12 , 0($t3)


#print:  
#        li $v0, 2
#        lwc1 $f12 , 0($t3)
#        syscall
#
#        la $a0,Msg #Print '\n'
#        li $v0,4
#        syscall
#
#        addi $t4 ,1
#       addi $t3 ,4
#        bne $t4 , $s0 , print
        
#        jr $ra # retrun to caller
   #     li $v0, 10           # Quit program          
    #    syscall

# Sample data starts here          


#N:      .word 15 