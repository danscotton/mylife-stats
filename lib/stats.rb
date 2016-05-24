class Stats
  attr_reader :data

  def initialize(data)
    @data = clean(data)
  end

  def total_count
    data.flatten.size
  end

  def mean
    (data.flatten.reduce(&:+).to_f / data.flatten.size).round(3)
  end

  def longest_line
    data.map(&:size).max
  end

  def mode
    frequency = data.flatten.reduce(Hash.new(0)) { |h, n| h[n] += 1; h }
    common = frequency.select { |k, v| v == frequency.values.max }.keys

    # return number itself rather than array
    # if only one mode exists
    common.size === 1 ? common.shift : common.sort
  end

  private

  def clean(data)
    data.map do |row|
      row.compact.map(&:to_i)
    end
  end
end
