.data
    header_msg:      .asciiz "\nPrograma de Raiz Quadrada Newton-Raphson\n"
    dev_msg:         .asciiz "Desenvolvedor: Daniel Scheuermann\n"
    prompt_x:        .asciiz "\nDigite o parâmetro x para calcular sqrt_nr (x, i) ou -1 para abortar a execução: "
    prompt_i:        .asciiz "Digite o parâmetro i para calcular sqrt_nr (x, i) ou -1 para abortar a execução: "
    msg_abort:       .asciiz "Execução abortada.\n"
    msg_error:       .asciiz "Por favor, insira um inteiro positivo para x e um inteiro não negativo para i.\n"
    
    res_start:       .asciiz "sqrt("
    res_comma:       .asciiz ", "
    res_paren:       .asciiz ") = "
    res_newline:     .asciiz "\n"

.text

.macro print_string(%label)
    li $v0, 4
    la $a0, %label
    syscall
.end_macro

.macro print_int(%reg)
    move $a0, %reg
    li $v0, 1
    syscall
.end_macro

.globl main
main:
    print_string(header_msg)
    print_string(dev_msg)

loop:
    print_string(prompt_x)
    li $v0, 5           
    syscall
    move $s0, $v0

    li $t0, -1
    beq $s0, $t0, abort

    print_string(prompt_i)
    li $v0, 5           
    syscall
    move $s1, $v0

    beq $s1, $t0, abort

    ble $s0, $zero, error_input
    blt $s1, $zero, error_input

    move $a0, $s0
    move $a1, $s1
    jal sqrt_nr         
    move $s2, $v0

    print_string(res_start)
    print_int($s0)      
    print_string(res_comma)
    print_int($s1)      
    print_string(res_paren)
    print_int($s2)      
    print_string(res_newline)

    j loop              

error_input:
    print_string(msg_error)
    j loop

abort:
    print_string(msg_abort)
    li $v0, 10          
    syscall

sqrt_nr:
    addi $sp, $sp, -16
    sw $ra, 12($sp)
    sw $s0, 8($sp)
    sw $s1, 4($sp)
    sw $s2, 0($sp)

    move $s0, $a0
    move $s1, $a1

    beq $s1, $zero, base_case

    addi $a1, $s1, -1
    move $a0, $s0
    jal sqrt_nr
    
    move $s2, $s2
    move $s2, $v0
    
    div $s0, $s2        
    mflo $t0
    
    add $t1, $s2, $t0
    
    li $t2, 2
    div $t1, $t2
    mflo $v0
    
    j end_recursion

base_case:
    move $v0, $s0

end_recursion:
    lw $s2, 0($sp)
    lw $s1, 4($sp)
    lw $s0, 8($sp)
    lw $ra, 12($sp)
    addi $sp, $sp, 16
    jr $ra
