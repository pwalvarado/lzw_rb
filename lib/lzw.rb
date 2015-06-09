require 'dictionary'


class LZW
  INITIAL_SIZE = 256

  def self.set_dictionary
    Hash[ Array.new(INITIAL_SIZE) {|i| [i.chr, i.chr]} ]
  end

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
    dict_size = INITIAL_SIZE
    dictionary = self.set_dictionary

    result = compressed.shift
    w = result
    for k in compressed
      if dictionary.has_key?(k)
        entry = dictionary[k]
      elsif k.eql? dict_size
        entry = w + w[0,1]
      else
        raise 'Bad compressed k: %s' % k
      end
      result += entry

      # Add w+entry[0] to the dictionary.
      dictionary[dict_size] = w + entry[0,1 ]
      dict_size += 1

      w = entry
    end
    result
  end
end
