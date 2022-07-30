# frozen_string_literal: true

# Interface for a counter strategy
class CountingStrategy
  def count_characters(string, char)
    raise NotImplementedError
  end
end

# Counts instances of a character in a string using String.scan()
class CounterWithScan < CountingStrategy
  def count_characters(string, char)
    {
      strategy: 'scan',
      count: string.scan(/#{char}/).length
    }
  end
end

# Counts instances of a character in a string using String.count()
class CounterWithCount < CountingStrategy
  def count_characters(string, char)
    {
      strategy: 'count',
      count: string.count(char)
    }
  end
end
