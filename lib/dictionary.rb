class Dictionary
  INITIAL_SIZE = 256

  def initialize
    @size = INITIAL_SIZE
    @dictionary = Hash[ Array.new(INITIAL_SIZE) {|i| [i.chr, i.chr]} ]
  end

  def has_key?(wc)
    @dictionary.has_key?(wc)
  end

  def find(w)
    @dictionary[w]
  end

  def push(wc)
    @dictionary[wc] = increase_size
  end

  def size
    @size
  end

  def increase_size
    size_was = @size
    @size += 1
    size_was
  end
end
