require 'stats'

describe Stats do

  context "total count of numbers" do
    it "can calculate the total count of numbers" do
      stats = Stats.new([
        [1, 2, 3],
        [-1, -2, -3]
      ])
      expect(stats.total_count).to eq 6 
    end

    it "can calculate the total count correctly with empty rows and columns" do
      stats = Stats.new([
        [1, nil, 3],
        []
      ])
      expect(stats.total_count).to eq 2
    end
  end

  context "mean" do
    it "can calculate the mean" do
      stats = Stats.new([
        [1, 2, 3]
      ])
      expect(stats.mean).to eq 2
    end

    it "can calculate the mean to 3 decimal places" do
      stats = Stats.new([
        [1, 2, 3],
        [9, 3, 4, 1]
      ])
      expect(stats.mean).to eq 3.286 # 23/7
    end
  end

  context "most numbers in a line" do
    it "can calculate the highest number of numbers in a line" do
      stats = Stats.new([
        [1, 2, 3],
        [1, 2, 3, 4, 5, 6]
      ])
      expect(stats.longest_line).to eq 6
    end

    it "ignores empty columns" do
      stats = Stats.new([
        [nil, nil, nil, nil],
        [1, 2, 3]
      ])
      expect(stats.longest_line).to eq 3
    end
  end

  context "mode" do
    it "can calculate the most common integer" do
      stats = Stats.new([
        [1, 2, 2, 3, 4, 5, 6],
        [1, 2, 3, 3, 3]
      ])
      expect(stats.mode).to eq 3
    end

    it "returns an array of numbers if more than one common integer exists (ordered)" do
      stats = Stats.new([
        [3, 3, 2, 1],
        [1, 2, 2, 3]
      ])
      expect(stats.mode).to eq [2, 3]
    end
  end

end
