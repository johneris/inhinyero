RSpec.describe "`inhinyero nuke` command", type: :cli do
  it "executes `inhinyero help nuke` command successfully" do
    output = `inhinyero help nuke`
    expected_output = <<-OUT
Usage:
  inhinyero nuke

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
