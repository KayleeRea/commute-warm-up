require 'spec_helper'
require 'commute_sorter'

describe CommuteSorter do
  it 'can group the csv rows by person' do
    input = [
      ["Nate", 1, "Tuesday", "Bus", 100, 110, 40],
      ["Jenny", 4, "Tuesday", "Bike", 14, 11, 2.5],
    ]
    expected =
      {
        "Nate" => [
          {
            :week => 1,
            :day => "Tuesday",
            :mode => "Bus",
            :inbound => 100,
            :outbound => 110,
            :distance => 40,
          }
        ],
        "Jenny" => [
          {
            :week => 4,
            :day => "Tuesday",
            :mode => "Bike",
            :inbound => 14,
            :outbound => 11,
            :distance => 2.5,
          }
        ],
      }

        commuter = CommuteSorter.new
    expect(commuter.group_by_name(input)).to eq expected
  end

  it 'can sort the data by weekday and day' do
    input = [
      ["Elsa", 2, "Wednesday", "Drive", 30, 50, 24],
      ["Elsa", 1, "Wednesday", "Bike", 10, 20, 14],
      ["Elsa", 1, "Tuesday", "Bike", 10, 20, 14],
      ["Elsa", 1, "Monday", "Bike", 10, 20, 14],
      ["Elsa", 1, "Friday", "Bike", 10, 20, 14],
      ["Elsa", 1, "Thursday", "Bike", 10, 20, 14],
    ]

    expected = {
      "Elsa" => [
        {
          week: 1,
          day: "Monday",
          mode: "Bike",
          inbound: 10,
          outbound: 20,
          distance: 14
        },
        {
          week: 1,
          day: "Tuesday",
          mode: "Bike",
          inbound: 10,
          outbound: 20,
          distance: 14
        },
        {
          week: 1,
          day: "Wednesday",
          mode: "Bike",
          inbound: 10,
          outbound: 20,
          distance: 14
        },
        {
          week: 1,
          day: "Thursday",
          mode: "Bike",
          inbound: 10,
          outbound: 20,
          distance: 14
        },
        {
          week: 1,
          day: "Friday",
          mode: "Bike",
          inbound: 10,
          outbound: 20,
          distance: 14
        },
        {
          week: 2,
          day: "Wednesday",
          mode: "Drive",
          inbound: 30,
          outbound: 50,
          distance: 24
        },
      ]
    }
    commuter = CommuteSorter.new
    expect(commuter.group_by_name(input)).to eq expected
  end
end