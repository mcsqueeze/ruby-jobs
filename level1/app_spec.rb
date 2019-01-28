# rspec app_spec.rb

require 'rspec'

require_relative './app.rb'

RSpec.describe 'Prices calculator', type: :model do
  let(:data)          { JSON.parse(File.read('data.json')) }
  let(:output)        { JSON.parse(File.read('output.json')) }

  it 'computes daily turnover' do
    expect(prices_calculator(data)).to eq(output)
  end

  it 'returns a Hash' do
    expect(prices_calculator(data)).to be_a(Hash)
  end

  it 'returns unique dates' do
    array = []
    prices_calculator(data)['totals'].each do |total|
      array << total['sent_on']
    end
    expect(array.uniq.length == array.length).to be_truthy
  end
end
