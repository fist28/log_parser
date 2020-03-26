require 'spec_helper'
require 'rspec'

describe IP do
  subject { described_class.new('0.0.0.0') }

  it 'has value attribute' do
    expect(subject.value).to eq('0.0.0.0')
  end
end