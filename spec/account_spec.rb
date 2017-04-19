describe Account do
  subject(:account) { described_class.new }

  it "has a starting balance of 0" do
    expect(account.balance).to eq(0)
  end

  it "initializes with an empty log" do
    expect(account.log).to be_an_instance_of(Log)
    expect(account.log.history).to eq([])
  end

  describe "functionality" do
    it "#deposit adds to account balance" do
      expect{account.deposit(200)}.to change{account.balance}.by(200)
    end

    it "#withdraw subtracts from account balance" do
      account.deposit(200)
      expect{account.withdraw(100)}.to change{account.balance}.by(-100)
    end

    context "withdrawing more than account balance" do
      it "alerts you to overdraft fee" do
        account.deposit(10)
        expect{account.withdraw(50)}.to output("Insufficient funds - you have been charged a 10% overdraft fee\n").to_stdout
      end

      it "applies overdraft fee", :od do
        account.deposit(10)
        account.withdraw(20)
        expect(account.balance).to eq(-11)
      end
    end
  end
end
