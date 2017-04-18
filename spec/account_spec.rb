describe Account do
  let(:account) { described_class.new }

  it "has starting balance of 0" do
    expect(account.balance).to eq(0)
  end
end
