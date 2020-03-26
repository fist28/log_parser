require 'spec_helper'
require 'rspec'

describe LogEntry do
  subject { described_class.new(path: '/foo', ip: '0.0.0.0') }

  it 'has path attribute' do
    expect(subject.path).to eq('/foo')
  end

  it 'has ip attribute' do
    expect(subject.ip).to eq('0.0.0.0')
  end
end