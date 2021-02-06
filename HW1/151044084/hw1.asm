 #                                       #
 #      Muhammed ÖZKAN    151044084      #
 #        Min Set Cover Problem          #
 #                                       #
 
 
 .data		
 setu:    .word -9, 1, 2, 3, 4, 5, 6, 7, 8, 9
	
 arr0:    .word -3, 1, 2, 4, -1
 arr1:    .word -2, 2, 3, -1
 arr2:    .word -4, 3, 4, 5, 6, -1
 arr3:    .word -3, 6, 7, 8, -1
 arr4:    .word -3, 3, 5, 7, -1
 arr5:    .word -3, 4, 6, 8, -1
 arr6:    .word -4, 1, 2, 8, 9, -1
 arr7:    .word -3, 3, 4, 5, -1
 arr8:    .word -3, 9, 3, 1, -1
 arr9:    .word -6, 7, 3, 4, 5, 6, 2, -1
	
 arr:     .word arr0, arr1, arr2, arr3, arr4, arr5, arr6, arr7, arr8, arr9
		
 newline: .asciiz "\n"
 space:   .asciiz " "
 begin:   .asciiz "\n--------Min Set Cover Program Begin--------\n"
 end:     .asciiz "---------Min Set Cover Program End---------\n\n"
 u:       .asciiz "U= "


.text
main:
 la      $a0,begin
 jal     printstring

 la      $a0,u
 jal     printstring
 
 la      $a0,setu
 jal     printarr
 
 la      $a0,newline
 jal     printstring



 addiu   $sp,$sp,-144
 sw      $ra,140($sp)
 sw      $s7,136($sp)
 move    $s7,$sp

 sw      $zero,28($s7)
 j       mainpart1

mainpart2:
 la      $v0,arr
 lw      $v1,28($s7)
 sll     $v1,$v1,0x2
 addiu   $v0,$v0,0
 addu    $v0,$v1,$v0
 lw      $v1,0($v0)
 la      $v0,setu
 addiu   $a1,$v0,0
 move    $a0,$v1
 jal     intersection
 
 lw      $v0,28($s7)
 addiu   $v0,$v0,1
 sw      $v0,28($s7)
 
mainpart1:
 lw      $v0,28($s7)
 slti    $v0,$v0,10
 bnez    $v0,mainpart2 

 la      $v0,arr
 addiu   $a0,$v0,0
 jal     sort

 sw      $zero,32($s7)
 sw      $zero,36($s7)
 sw      $zero,40($s7)
 j       mainpart3
  
mainpart12:
 li      $v0,1
 sw      $v0,44($s7)
 j       mainpart4
  
mainpart9:
 la      $v0,setu
 lw      $v0,0($v0)
 li      $v1,1
 subu    $v0,$v1,$v0
 lw      $v1,32($s7)
 beq     $v1,$v0,mainpart10
 
 li      $v0,1
 sw      $v0,48($s7)
 j       mainpart6
 
mainpart8:
 la      $v0,arr
 lw      $v1,40($s7)
 sll     $v1,$v1,0x2
 addiu   $v0,$v0,0
 addu    $v0,$v1,$v0
 lw      $v1,0($v0)
 lw      $v0,44($s7)
 sll     $v0,$v0,0x2
 addu    $v0,$v1,$v0
 lw      $v1,0($v0)
 la      $v0,setu
 lw      $a0,48($s7)
 sll     $a0,$a0,0x2
 addiu   $v0,$v0,0
 addu    $v0,$a0,$v0
 lw      $v0,0($v0)
 bne     $v1,$v0,mainpart7
        		   
 la      $v0,arr
 lw      $v1,40($s7)
 sll     $v1,$v1,0x2
 addiu   $v0,$v0,0
 addu    $v0,$v1,$v0
 lw      $v1,0($v0)
 lw      $v0,44($s7)
 sll     $v0,$v0,0x2
 addu    $v0,$v1,$v0
 lw      $v1,0($v0)
 lw      $v0,32($s7)
 sll     $v0,$v0,0x2
 addiu   $a0,$s7,136
 addu    $v0,$a0,$v0
 sw      $v1,-84($v0)                    
					  
 lw      $v0,32($s7)
 addiu   $v0,$v0,1
 sw      $v0,32($s7)                     
					  
 la      $v0,setu
 lw      $v1,48($s7)
 sll     $v1,$v1,0x2
 addiu   $v0,$v0,0
 addu    $v0,$v1,$v0
 lw      $v0,0($v0)
 negu    $v1,$v0
 la      $v0,setu
 lw      $a0,48($s7)
 sll     $a0,$a0,0x2
 addiu   $v0,$v0,0
 addu    $v0,$a0,$v0
 sw      $v1,0($v0)                     
					  
 li      $v0,1
 sw      $v0,36($s7)                     
		                                  
mainpart7:
 lw      $v0,48($s7)
 addiu   $v0,$v0,1
 sw      $v0,48($s7)
 
mainpart6:
 la      $v0,setu
 lw      $v0,0($v0)
 li      $v1,1
 subu    $v0,$v1,$v0
 lw      $v1,48($s7)
 slt     $v0,$v1,$v0
 bnez    $v0,mainpart8         
                
 lw      $v0,44($s7)
 addiu   $v0,$v0,1
 sw      $v0,44($s7)
 
mainpart4:
 la      $v0,arr
 lw      $v1,40($s7)
 sll     $v1,$v1,0x2
 addiu   $v0,$v0,0
 addu    $v0,$v1,$v0
 lw      $v0,0($v0)
 lw      $v0,0($v0)
 li      $v1,1
 subu    $v0,$v1,$v0
 lw      $v1,44($s7)
 slt     $v0,$v1,$v0
 bnez    $v0,mainpart9
 
 j       mainpart10
                                                                                                                                                 
mainpart10:
 lw      $v1,36($s7)
 li      $v0,1
 bne     $v1,$v0,mainpart11
 
 la      $v0,arr
 lw      $v1,40($s7)
 sll     $v1,$v1,0x2
 addiu   $v0,$v0,0
 addu    $v0,$v1,$v0
 lw      $v0,0($v0)
 move    $a0,$v0
 jal     printarr
   
 sw      $zero,36($s7)

mainpart11:
 lw      $v0,40($s7)
 addiu   $v0,$v0,1
 sw      $v0,40($s7)
 
mainpart3:
 lw      $v0,40($s7)
 slti    $v0,$v0,10
 bnez    $v0,mainpart12
 
 move    $v0,$zero              
               
mainpart13:  
 move    $sp,$s7
 lw      $ra,140($sp)
 lw      $s7,136($sp)
 addiu   $sp,$sp,144

 la      $a0, end
 jal     printstring
 
 li      $v0, 10   	
 syscall

intersection:
 addiu   $sp,$sp,-24
 sw      $s7,20($sp)
 move    $s7,$sp
 sw      $a0,24($s7)
 sw      $a1,28($s7)     
 sw      $zero,4($s7)

 li      $v0,1
 sw      $v0,8($s7)
 j       intersectionpart1
        
intersectionpart5:
 li      $v0,1
 sw      $v0,12($s7)
 j       intersectionpart2
               
intersectionpart4:
 lw      $v0,8($s7)
 sll     $v0,$v0,0x2
 lw      $v1,28($s7)
 addu    $v0,$v1,$v0
 lw      $v1,0($v0)
 lw      $v0,12($s7)
 sll     $v0,$v0,0x2
 lw      $a0,24($s7)
 addu    $v0,$a0,$v0
 lw      $v0,0($v0)
 bne     $v1,$v0,intersectionpart3
                          
 lw      $v0,4($s7)
 addiu   $v0,$v0,1
 sw      $v0,4($s7)
               
intersectionpart3:
 lw      $v0,12($s7)
 addiu   $v0,$v0,1
 sw      $v0,12($s7)
 
intersectionpart2:
 lw      $v0,24($s7)
 lw      $v0,0($v0)
 negu    $v0,$v0
 lw      $v1,12($s7)
 slt     $v0,$v0,$v1
 beqz    $v0,intersectionpart4
     
 lw      $v0,8($s7)
 addiu   $v0,$v0,1
 sw      $v0,8($s7)
 
intersectionpart1:
 lw      $v0,28($s7)
 lw      $v0,0($v0)
 negu    $v0,$v0
 lw      $v1,8($s7)
 slt     $v0,$v0,$v1
 beqz    $v0,intersectionpart5
 
 lw      $v0,24($s7)
 lw      $v1,0($v0)
 move    $v0,$zero
 subu    $v0,$v0,$v1
 sll     $v0,$v0,0x2
 addiu   $v0,$v0,4
 lw      $v1,24($s7)
 addu    $v0,$v1,$v0
 lw      $v1,4($s7)
 sw      $v1,0($v0)

 move    $sp,$s7
 lw      $s7,20($sp)
 addiu   $sp,$sp,24
 jr      $ra
 
sort:
 addiu   $sp,$sp,-24
 sw      $s7,20($sp)
 move    $s7,$sp
 sw      $a0,24($s7)

 sw      $zero,4($s7)
 j       sortpart1
 
sortpart5: 
 sw      $zero,8($s7)
 j       sortpart2
 
sortpart4: 
 lw      $v0,8($s7)
 sll     $v0,$v0,0x2
 lw      $v1,24($s7)
 addu    $v0,$v1,$v0
 lw      $v1,0($v0)
 lw      $v0,8($s7)
 sll     $v0,$v0,0x2
 lw      $a0,24($s7)
 addu    $v0,$a0,$v0
 lw      $v0,0($v0)
 lw      $a0,0($v0)
 move    $v0,$zero
 subu    $v0,$v0,$a0
 sll     $v0,$v0,0x2
 addiu   $v0,$v0,4
 addu    $v0,$v1,$v0
 lw      $v1,0($v0)
 lw      $v0,8($s7)
 addiu   $v0,$v0,1
 sll     $v0,$v0,0x2
 lw      $a0,24($s7)
 addu    $v0,$a0,$v0
 lw      $a0,0($v0)
 lw      $v0,8($s7)
 addiu   $v0,$v0,1
 sll     $v0,$v0,0x2
 lw      $a1,24($s7)
 addu    $v0,$a1,$v0
 lw      $v0,0($v0)
 lw      $a1,0($v0)
 move    $v0,$zero
 subu    $v0,$v0,$a1
 sll     $v0,$v0,0x2
 addiu   $v0,$v0,4
 addu    $v0,$a0,$v0
 lw      $v0,0($v0)
 slt     $v0,$v1,$v0
 beqz    $v0,sortpart3
                 
 lw      $v0,8($s7)
 sll     $v0,$v0,0x2
 lw      $v1,24($s7)
 addu    $v0,$v1,$v0
 lw      $v0,0($v0)
 sw      $v0,12($s7)
                                
 lw      $v0,8($s7)
 addiu   $v0,$v0,1
 sll     $v0,$v0,0x2
 lw      $v1,24($s7)
 addu    $v1,$v1,$v0
 lw      $v0,8($s7)
 sll     $v0,$v0,0x2
 lw      $a0,24($s7)
 addu    $v0,$a0,$v0
 lw      $v1,0($v1)
 sw      $v1,0($v0)
                                
 lw      $v0,8($s7)
 addiu   $v0,$v0,1
 sll     $v0,$v0,0x2
 lw      $v1,24($s7)
 addu    $v0,$v1,$v0
 lw      $v1,12($s7)
 sw      $v1,0($v0)
      
sortpart3: 
 lw      $v0,8($s7)
 addiu   $v0,$v0,1
 sw      $v0,8($s7)
 
sortpart2: 
 li      $v1,9
 lw      $v0,4($s7)
 subu    $v0,$v1,$v0
 lw      $v1,8($s7)
 slt     $v0,$v1,$v0
 bnez    $v0,sortpart4
 
 lw      $v0,4($s7)
 addiu   $v0,$v0,1
 sw      $v0,4($s7)
 
sortpart1: 
 lw      $v0,4($s7)
 slti    $v0,$v0,9
 bnez    $v0,sortpart5
 
 move    $sp,$s7
 lw      $s7,20($sp)
 addiu   $sp,$sp,24
 jr      $ra
 
printarr:
 addiu   $sp,$sp,-40
 sw      $ra,36($sp)
 sw      $s7,32($sp)
 move    $s7,$sp
 sw      $a0,40($s7)

 li      $v0,1
 sw      $v0,28($s7)
 j       printarrpart1
 
printarrpart2: 
 lw      $v0,28($s7)
 sll     $v0,$v0,0x2
 lw      $v1,40($s7)
 addu    $v0,$v1,$v0
 lw      $v0,0($v0)
 
 move    $a0,$v0
 jal     printint
        
 lw      $v0,28($s7)
 addiu   $v0,$v0,1
 sw      $v0,28($s7)
 
printarrpart1: 
 lw      $v0,40($s7)
 lw      $v0,0($v0)
 li      $v1,1
 subu    $v0,$v1,$v0
 lw      $v1,28($s7)
 slt     $v0,$v1,$v0
 bnez    $v0,printarrpart2
 
 la      $a0, newline
 jal     printstring
 
 move    $sp,$s7
 lw      $ra,36($sp)
 lw      $s7,32($sp)
 addiu   $sp,$sp,40
 jr      $ra
 
printint:
 addiu   $sp,$sp,-8
 sw      $s7,4($sp)
 move    $s7,$sp
 sw      $a0,8($s7)
 
 move    $t1,$v0
 move    $t2,$a0
 li      $v0, 1
 syscall
 
 li      $v0, 4
 la      $a0, space
 syscall
 move    $a0,$t2
 move    $v0,$t1
 
 move    $sp,$s7
 lw      $s7,4($sp)
 addiu   $sp,$sp,8
 jr      $ra
 
printstring:
 addiu   $sp,$sp,-8
 sw      $s7,4($sp)
 move    $s7,$sp
 sw      $a0,8($s7)
 
 move    $t1,$v0
 li      $v0, 4
 syscall
 move    $v0,$t1
   
 move    $sp,$s7
 lw      $s7,4($sp)
 addiu   $sp,$sp,8
 jr      $ra
