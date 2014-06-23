class CommuteSorter
  def initialize(input)
     @input = input
  end

  def by_name
    split_data = @input.split(',')
    { split_data.first => [{}] }
  end
end