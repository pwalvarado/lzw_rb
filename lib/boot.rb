$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '.', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'lzw'

lzw = LZW
print "Compressing TOBEORNOTTOBEORTOBEORNOT:"
print compressed = lzw.compress('TOBEORNOTTOBEORTOBEORNOT')

print "\n\ndecompressing #{compressed}:\n"
p lzw.decompress(compressed)