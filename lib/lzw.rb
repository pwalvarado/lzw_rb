require 'dictionary'

class LZW
  # Compress a string to a list of output symbols.
  def self.compress(uncompressed)
    dictionary = Dictionary.new
    w = ""
    result = []
    for c in uncompressed.split('')
      wc = w + c
      if dictionary.has_key?(wc)
        w = wc
      else
        result << dictionary.find(w)
        dictionary.push(wc)
        w = c
      end
    end

    # Output the code for w.
    result << dictionary.find(w) unless w.empty?
    result
  end

  # Decompress a collection of output symbols to a string.
  def self.decompress(compressed)
    dictionary = Dictionary.new

    result = compressed.shift
    w = result
    for k in compressed
      if dictionary.has_key?(k)
        entry = dictionary.find(k)
      elsif k.eql? dictionary.size
        entry = w + w[0,1]
      else
        raise 'Bad compressed k: %s' % k
      end
      result += entry
      dictionary.push_deco(w + entry[0,1])
      w = entry
    end
    result
  end
end
