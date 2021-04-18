        addi $t8, $a1, -1
        sub $t5, $a0, $t8
        bltz $t5, notfound
        
        
notfound:
        la $a0, error404         # Failure message
        li $v0, 4
        syscall