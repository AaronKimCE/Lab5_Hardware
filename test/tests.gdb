# Test file for Lab3_BitManipulation


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# Add tests below
test "PINA:2 => PORTC: 0x60"
setPINA 2
continue 5
expectPORTC 0x60
checkResult

test "PINA:4 => PORTC: 0x70"
setPINA 4
continue 5
expectPORTC 0x70
checkResult

test "PINA:6 => PORTC: 0x38"
setPINA 6
continue 5
expectPORTC 0x38
checkResult

test "PINA:9 => PORTC: 0x3C"
setPINA 9
continue 5
expectPORTC 0x3C
checkResult

test "PINA:12 => PORTC: 0x3E"
setPINA 12
continue 5
expectPORTC 0x3E
checkResult

test "PINA:15 => PORTC: 0x3F"
setPINA 15
continue 5
expectPORTC 0x3f
checkResult

test "PINA:0 => PORTC: 0x40"
setPINA 0
continue 5
expectPORTC 0x40
checkResult

test "PINA:0 & Key => PORTC: 0x40"
setPINA 0x10
continue 5
expectPORTC 0x40
checkResult

test "PINA:1 & Key + Seated => PORTC: 0xE0"
setPINA 0x31
continue 5
expectPORTC 0xe0
checkResult

test "PINA:15 & Key + Seated + Seatbelt => PORTC: 0x3F"
setPINA 0xFF
continue 5
expectPORTC 0x3F
checkResult

test "PINA:15 & Seated + Seatbelt => PORTC: 0x3F"
setPINA 0x6F
continue 5
expectPORTC 0x3F
checkResult

test "PINA:11 & Seated => PORTC: 0x3E"
setPINA 0x2B
continue 5
expectPORTC 0x3E
checkResult



# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
