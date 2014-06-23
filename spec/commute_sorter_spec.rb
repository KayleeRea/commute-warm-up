require 'spec_helper'
require 'commute_sorter'

describe CommuteSorter do
  it 'sorts by name' do
    input = <<INPUT.chomp
Emily,4,Monday,Walk,12,15,0.65
INPUT
    expected =
      {
        "Emily" => [{}]
      };
    expect(CommuteSorter.new(input).by_name).to eq expected
  end
end