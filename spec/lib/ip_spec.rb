require 'spec_helper'
require 'rspec'

describe IP do
  subject { described_class.new('0.0.0.0') }

  it 'has value attribute' do
    expect(subject.value).to eq('0.0.0.0')
  end

  it 'return true for compare the the same IP value' do
    ip = described_class.new('0.0.0.0')
    expect(ip == subject).to be_truthy
  end

  it 'return false for compare the the different IP value' do
    ip = described_class.new('1.2.3.4')
    expect(ip == subject).not_to be_truthy
  end
end