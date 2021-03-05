.data

.balign 4
message1: .asciz "Enter first string: "

.balign 4
message2: .asciz "Enter second string: "

.balign 4
message3: .asciz "Your string is '%s'.\n"

.balign 4
messageTooLong: .asciz "ERROR: Your message is too long.\n"

.balign 4
string1: .asciz "123456789012123456789012"

.balign 4
string2: .asciz "123456789012"

.balign 4
tmpStore: .word 0

.balign 4
return: .word 0

.text

address_of_return: .word return
address_of_message1: .word message1
address_of_message2: .word message2
address_of_message3: .word message3
address_of_string1: .word string1
address_of_string2: .word string2
address_of_tmpStore: .word tmpStore
address_of_messageTooLong: .word messageTooLong

.global printf
.global strcpy
.global getchar

.global main
main:
        // Print request for first string
        ldr r0, address_of_message1
        bl printf

        // Set up iterator to count number of characters given
        mov r0, #0
        ldr r1, address_of_tmpStore
        str r0, [r1]

read1:
        // Get a character
        bl getchar

        // If the character is linefeed, break from the loop
        cmp r0, #10
        beq end1

        // Find end of string in memory
        ldr r1, address_of_string1
        ldr r2, address_of_tmpStore
        ldr r2, [r2]
        add r1, r2, r1

        // append character to string
        str r0, [r1]

        // Increment counter
        ldr r1, address_of_tmpStore
        ldr r0, [r1]
        add r0, r0, #1
        str r0, [r1]

        // Check current character length
        cmp r0, #13
        blt read1

        // Typing more than 12 characters
        ldr r0, address_of_messageTooLong
        bl printf
        mov r0, #7
        ldr r1, address_of_return
        str r0, [r1]
        b end

end1:
        // Put length of string in address_of_return
        ldr r1, address_of_return
        ldr r2, address_of_tmpStore
        ldr r2, [r2]
        str r2, [r1]

        // Find end of string
        ldr r1, address_of_string1
        ldr r2, address_of_tmpStore
        ldr r2, [r2]
        add r1, r2, r1

        // Null terminate the string
        mov r0, #0
        str r0, [r1]

        // Begin second string input
        ldr r0, address_of_message2
        bl printf

        // Set up iterator to count the number of characters given
        mov r0, #0
        ldr r1, address_of_tmpStore
        str r0, [r1]
read2:
        // Get a character
        bl getchar

        // If the character is linefeed, break out of the loop
        cmp r0, #10
        beq end2

        // Find end of string
        ldr r1, address_of_string2
        ldr r2, address_of_tmpStore
        ldr r2, [r2]
        add r1, r2, r1
        
        // append character to string
        str r0, [r1]

        // Increment counter
        ldr r1, address_of_tmpStore
        ldr r0, [r1]
        add r0, r0, #1
        str r0, [r1]

        // Check current character length
        cmp r0, #13
        blt read2

        // Typing more than 12 characters
        ldr r0, address_of_messageTooLong
        bl printf
        mov r0, #8
        ldr r1, address_of_return
        str r0, [r1]
        b end

end2:
        // Find end of string
        ldr r1, address_of_string2
        ldr r2, address_of_tmpStore
        ldr r2, [r2]
        add r1, r2, r1

        // Null terminate the string
        mov r0, #0
        str r0, [r1]

        // Put the second string at the end of the first string
        ldr r0, address_of_string1
        ldr r1, address_of_return
        ldr r1, [r1]
        add r0, r0, r1
        ldr r1, address_of_string2
        bl strcpy

        // Add length of string to address_of_return
        ldr r1, address_of_return
        ldr r2, address_of_tmpStore
        ldr r2, [r2]
        ldr r3, [r1]
        add r3, r3, r2
        str r3, [r1]

        // Print out the concatenated message
        ldr r0, address_of_message3
        ldr r1, address_of_string1
        bl printf

end:
        // Load in the return code
        ldr r0, address_of_return
        ldr r0, [r0]
        // From https://azeria-labs.com/writing-arm-shellcode/
        // Exit
        mov r7, #1
        swi 0
