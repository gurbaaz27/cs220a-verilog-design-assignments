.text




main:   la $a0 ,prompt       #get input length from user
        li $v0 ,4
        syscall

        li $v0,5    #Read the number(n)
        syscall

        move $s0 , $v0

        la $t1 ,arrayX
        la $t2 ,arrayY

        move $t3 , $t1
        add $t4 , $0 , $0

        la $a0 ,Xin       #get input length from user
        li $v0 ,4
        syscall
read:   
        li $v0, 6
        syscall
        swc1 $f0 , 0($t3)
        addi $t3 , $t3 , 4
        addi $t4 , $t4 , 1
        bne $t4 , $s0 , read

        add $t4 , $0 , $0
        move $t3 , $t2

        la $a0 ,Yin       #get input length from user
        li $v0 ,4
        syscall

read2:   
        li $v0, 6
        syscall
        swc1 $f0 , 0($t3)
        addi $t3, $t3 , 4
        addi $t4 ,$t4 , 1
        bne $t4 , $s0 , read2

        add $t4 , $0 , $0
        #move $t3 , $t2
        #add $t3 , $0 , $0  # sum register
        sub.s $f4, $f4, $f4

loop:       
        lwc1 $f1 , 0($t1)
        lwc1 $f2 , 0($t2)

        mul.s $f3 , $f1 ,$f2
        add.s $f4 , $f4 , $f3
        addi  $t4 , $t4 , 1
        addi  $t1 , $t1 , 4
        addi  $t2 , $t2 , 4
        bne $t4 , $s0 , loop


        la $a0,Res #Print 'The result is \n'
        li $v0,4
        syscall

        mov.s $f12 , $f4
        li $v0, 2
        #lwc1 $f12 , 0($t3)
        syscall
        la $a0,Msg #Print '\n'
        li $v0,4
        syscall
        jr $ra # retrun to caller

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
.data 

#N:      .word 15 
arrayX:  .space 60
arrayY:  .space 60
prompt:  .asciiz "Enter the length of vector \n"
Xin:  .asciiz "Enter the n numbers of vector X \n"
Yin:  .asciiz "Enter the n numbers of vector Y \n"
Msg:    .asciiz "\n"
Res:    .asciiz"The result is \n"