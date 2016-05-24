require 'csv'

describe "Stats", type: :aruba do

  it "can compute a set of statistics from numbers in a csv file" do
    # create fake csv data
    data = <<-DATA
      1,1,2,,3,4,4
      -1,-1,-2,,,5

      6,7,8
    DATA

    # stub a csv file
    write_file('test.csv', data)

    # run application
    run 'stats test.csv'
    stop_all_commands # from aruba api: required to grab command output

    # assert output
    expect(last_command_started.output).to include "Total numbers: 13"
    expect(last_command_started.output).to include "Mean: 2.846"
    expect(last_command_started.output).to include "Most numbers in a line: 6"
    expect(last_command_started.output).to include "Mode: [-1, 1, 4]"
  end
end
