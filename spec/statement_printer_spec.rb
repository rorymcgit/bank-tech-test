describe Statement do
  subject(:statement) { described_class.new }
  let(:account) { double }
  let(:log) { double }

  before(:each) do
    @date = Time.now
    Timecop.freeze(@date)
    allow(log).to receive(:history) { [[@date, 50, 50]] }
  end

  it "responds to initialize" do
    expect(Statement).to respond_to(:new)
  end

  it "prints a dummy statement" do
    expect{statement.view(log)}.to output("Date\t\t\t\t\t Amount\t\t Balance\n#{@date}\t\t50\t\t50\t\t\n\n").to_stdout
  end


end
