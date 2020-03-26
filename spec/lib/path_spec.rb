require 'spec_helper'
require 'rspec'

describe Path do
  subject { described_class.new('/path') }

  it 'has value attribute' do
    expect(subject.value).to eq('/path')
  end
end