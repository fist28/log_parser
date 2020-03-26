require 'spec_helper'
require 'rspec'

describe LogEntry do
  let(:path) { Path.new('/foo') }
  let(:ip) { IP.new('0.0.0.0') }
  subject { described_class.new(path: path, ip: ip) }

  it 'has path attribute' do
    expect(subject.path).to eq(path)
  end

  it 'has ip attribute' do
    expect(subject.ip).to eq(ip)
  end
end