# BufferOverflow

How to Compile and Run the Server Side:
gcc secretServer.c
./a.out (port number) Password 'My favorite number is 42'

How to Run the Client Side:
nc localhost (port number)

# Task 1: Exploit the Vulnerability
A buffer overflow bug occurs when there is a set buffer boundary in the server side that can be overwritten. In this assignment, the server assumes all inputs for a password and buffer to be 32 bytes in size, and the secret to be 1024 bytes in size. With this information the client can send a password of more than 32 bytes and overwrite it.

# Task 2:Fix the Vulnerability
To fix the vulnerability you must check the data that is being written. A boundary
check is important because the struct in the server side has a certain size of bytes for
each component. This has been done in the function readLineFromFd where the
integer boundaryCheck keeps track of the number of characters, not allowing to
overflow.
