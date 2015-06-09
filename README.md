# lzw_rb

A Lemple-Ziv-Welch compression algorithm implementation in Ruby


Lempel–Ziv–Welch (LZW) is a universal lossless data compression algorithm created by Abraham Lempel, Jacob Ziv, and Terry Welch. It was published by Welch in 1984 as an improved implementation of the LZ78 algorithm published by Lempel and Ziv in 1978. The algorithm is simple to implement, and has the potential for very high throughput in hardware implementations. It was the algorithm of the widely used Unix file compression utility compress, and is used in the GIF image format.

## Encoding

Buffer input characters in a sequence ω until ω + next character is not in the dictionary. Emit the code for ω, and add ω + next character to the dictionary. Start buffering again with the next character.

## Decoding

To decode an LZW-compressed archive, one needs to know in advance the initial dictionary used, but additional entries can be reconstructed as they are always simply concatenations of previous entries.


## References

[Lempel–Ziv–Welch - Wikipeddia](http://en.wikipedia.org/wiki/Lempel%E2%80%93Ziv%E2%80%93Welch)

## How to run

### First attempt

```
ruby lib/boot.rb
Compressing TOBEORNOTTOBEORTOBEORNOT:["T", "O", "B", "E", "O", "R", "N", "O", "T", 256, 258, 260, 265, 259, 261, 263]

decompressing ["T", "O", "B", "E", "O", "R", "N", "O", "T", 256, 258, 260, 265, 259, 261, 263]:
"TOBEORNOTTOBEORTOBEORNOT"
```


### Seccond attempt (not implemented yet)

### Encoding

```
ruby lzw_rb.encode <string_to_ecode>
```

ie.

```
ruby lzw_rb.encode 'TOBEORNOTTOBEORTOBEORNOT'

# output:

["T", "O", "B", "E", "O", "R", "N", "O", "T", 256, 258, 260, 265, 259, 261, 263]
```

### Decoding

```
ruby lzw_rb.encode <array_to_decode>
```

produces:

```
ruby lzw_rb.decode ["T", "O", "B", "E", "O", "R", "N", "O", "T", 256, 258, 260, 265, 259, 261, 263]

# it produces:

'TOBEORNOTTOBEORTOBEORNOT'
```