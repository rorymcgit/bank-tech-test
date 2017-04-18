describe Log do
  subject(:log) { described_class.new }
  let(:account) { double }

  it "starts with an empty history array" do
    expect(log.history).to eq([])
  end

  describe "storing data" do
    before(:each) do
      @date = Time.now
      Timecop.freeze(@date)
      allow(account).to receive(:balance) { 300 }
      log.store(@date, 200, account.balance)
      @first_log_entry = log.history[0]
    end

    after do
      Timecop.return
    end

    it "stores the date" do
      expect(@first_log_entry[0]).to eq(@date)
    end

    it "stores amount deposited" do
      expect(@first_log_entry[1]).to eq(200)
    end

    it "stores the running balance" do
      expect(@first_log_entry[2]).to eq(300)
    end
  end

end
