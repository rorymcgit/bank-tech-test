describe "Integration" do
  let(:account) { Account.new }
  let(:log) { Log.new }

  it "can initialize account" do
    expect(Account).to respond_to(:new)
  end

  it "can initialize log" do
    expect(Log).to respond_to(:new)
  end

  describe "storing data" do
    before(:each) do
      @date = Time.now
      Timecop.freeze(@date)
      account.deposit(200)
    end

    context "deposit" do
      it "stores deposit data" do
        expect(account.log.history[0]).to eq([@date, 200, 200])
      end
    end

    context "withdraw" do
      it "stores withdrawal data", :feat do
        account.withdraw(100)
        expect(account.log.history[1]).to eq([@date, -100, 100])
      end
    end


  end

end
