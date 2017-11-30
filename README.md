# BufferOverflow
A buffer overflow bug occurs when there is a set buffer boundary in the server side that can be overwritten. In this assignment, the server assumes all inputs for a password and buffer to be 32 bytes in size, and the secret to be 1024 bytes in size. With this information the client can send a password of more than 32 bytes and overwrite it.
