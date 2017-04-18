describe Account do
  subject(:account) { described_class.new }

  it "has a starting balance of 0" do
    expect(account.balance).to eq(0)
  end

  it "#deposit adds to account balance" do
    expect{account.deposit(200)}.to change{account.balance}.by(200)
  end

  it "#withdraw subtracts from account balance" do
    account.deposit(200)
    expect{account.withdraw(100)}.to change{account.balance}.by(-100)
  end

  it "cannot withdraw more than account balance" do
    account.deposit(10)
    expect{account.withdraw(50)}.to raise_error("Insufficient funds")
  end
end
