describe Account do
  subject(:account) { described_class.new }

  it "has a starting balance of 0" do
    expect(account.balance).to eq(0)
  end

  it "#deposit adds to account balance" do
    expect{account.deposit(200)}.to change{account.balance}.by(200)
  end
end
