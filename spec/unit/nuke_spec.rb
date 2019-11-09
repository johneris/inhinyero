require 'inhinyero/commands/nuke'

RSpec.describe Inhinyero::Commands::Nuke do
  it "executes `nuke` command successfully" do
    output = StringIO.new
    options = {}
    command = Inhinyero::Commands::Nuke.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
