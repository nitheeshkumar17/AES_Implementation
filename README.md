# AES_Implementation
 
 This repository consists of the source files used for the implementation of Advanced Encryption Algorithm (AES). 
  
AES consists of four basic operations. They are :
                       1. Substitute Bytes (S-BOX)
                       2. Shift Rows
                       3. Mix Columns
                       4. Add Round Key

aes_top.v : Top module of the design
sub_bytes.v : Subtitute Bytes Operation
shift_rows.v : Shift Rows Operation
mix_columns.v : Mix Columns Operation
add_round_key.v : Add Round Key Operation
round.v : Key Expansion Block
g_function.v : Function used for randomness in Key Expansion Block
buf128.v : Input Buffer
buf_128.v : Intermediate Buffer
r_con.v : Storing Round Constants 
