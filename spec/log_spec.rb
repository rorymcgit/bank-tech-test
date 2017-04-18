describe Log do
  subject(:log) { described_class.new }

  it "stores the date when a deposit is made" do
    date = Date.new
    log.store_date(Date.new)
    expect(log.history).to eq([date])
  end

end
