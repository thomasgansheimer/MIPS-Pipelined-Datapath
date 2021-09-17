#####################################################################
### vbsme
#####################################################################
.text
.globl  vbsme

# initialize registers
vbsme:    addi $v0, $zero, 0              
    	  addi $v1, $zero, 0
		  lw $s0, 0($a0)          
		  lw $s1, 4($a0)          
		  lw $s2, 8($a0)          
		  lw $s3, 12($a0)         
		  addi $t1, $zero, 0               
		  addi $t2, $zero, 0               
		  addi $t3, $zero, 0               
		  addi $t4, $zero, 0              
		  addi $s4, $zero, 1               
		  addi $s5, $zero, 1000           
		  addi $s6, $zero, 0              
		  addi $s7, $zero, 0               

while: 	  j findSAD	

# load current frame and window data 	
next:	  lw $s2, 8($a0)         
		  lw $s3, 12($a0)        
		  sub $t5, $t0, $s5
		  bgez $t5, right
		  add $s6, $zero, $t3     
		  add $s7, $zero, $t4     
		  add $s5, $zero, $t0    

# traverse right in frame
right: 	  slti $t5, $s4, 2        
		  beq $t5, $zero, down    
		  addi $t4, $t4, 1       
		  add $t6, $t4, $s3      
		  sub $t5, $t6, $s1
		  blez $t5, check
		  addi $s4, $zero, 2     
		  addi $s1, $s1, -1      
		  addi $t4, $t4, -1    
		  j check                

# traverse down in frame
down:	  slti $t5, $s4, 3       
		  beq $t5, $zero, left    
		  addi $t3, $t3, 1       
		  add $t6, $t3, $s2     
		  sub $t5, $t6, $s0
		  blez $t5, check
		  addi $s4, $zero, 3    
		  addi $s0, $s0, -1     
		  addi $t3, $t3, -1     
		  j check               

# traverse left in frame
left:	  slti $t5, $s4, 4       
		  beq $t5, $zero, up    
		  addi $t4, $t4, -1      
		  sub $t5, $t4, $t1
		  bgez $t5, check
		  addi $s4, $zero, 4      
		  addi $t1, $t1, 1     
		  addi $t4, $t4, 1   
		  j check             

# traverse up in frame
up:		  addi $t3, $t3, -1     
		  sub $t5, $t3, $t2
		  bgez $t5, check
		  addi $s4, $zero, 1    
		  addi $t3, $t3, 1     
		  addi $t2, $t2, 1   

# check if end of spiral pattern has been reached	 
check:	  sub $t5, $s0, $t2      
		  slt $t6, $t5, $s2    
		  sub $t5, $s1, $t1      
		  slt $t7, $t5, $s3
		  and $t7, $t6, $t7
		  bne $t7, $zero, Exit
		  j while	           

# nested for loops used to find Sum of Absolute Difference for current window	
findSAD:  addi $t8, $zero, -1                
		  addi $t9, $zero, 0                
		  addi $t0, $zero, 0            
		  add $t6, $zero, $a2   
	
outerFor: addi $t8,$t8, 1      
		  lw $s2, 8($a0)       
	      sub $t5, $t8, $s2
	      bgez $t5, out
	      addi $t9, $zero, 0         
	      sll $s2, $t4, 2    
	      lw $s3, 4($a0)     
	      sll $s3, $s3, 2    
	      mult $s3, $t3      
	      mflo $t5           
	      add $t5, $t5, $s2     
	      mult $s3, $t8          
	      mflo $s2             
	      add $t5, $t5, $s2      
	      add $t5, $t5, $a1     
         
innerFor: lw $s3, 12($a0)       
		  sub $t7, $t9, $s3
	      bgez $t7, outerFor
	      lw $s2, 0($t6)        
	      lw $s3, 0($t5)        
	      sub $s2, $s2, $s3    
	      bgez $s2, nextSum 
	      sub $s2, $zero, $s2 

nextSum:  add $t0, $s2, $t0       
	      addi $t9, $t9, 1     
	      addi $t6, $t6, 4   
	      addi $t5, $t5, 4    
	      j innerFor 
         	
out:	  j next          

# update return registers with row and column 
Exit:	  add $v0, $zero, $s6  
	      add $v1, $zero, $s7  
	      jr $ra               