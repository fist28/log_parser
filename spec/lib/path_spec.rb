require 'spec_helper'
require 'rspec'

describe Path do
  subject { described_class.new('/path') }

  it 'has value attribute' do
    expect(subject.value).to eq('/path')
  end

  it 'return true for compare the the same Path value' do
    ip = described_class.new('/path')
    expect(ip == subject).to be_truthy
  end

  it 'return false for compare the the different Path value' do
    ip = described_class.new('/another-path')
    expect(ip == subject).not_to be_truthy
  end
end