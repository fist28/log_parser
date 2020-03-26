require 'spec_helper'
require 'rspec'

describe LogFile do
  describe 'check argument' do
    subject { described_class.new(argument).call }

    describe 'when argument is missing' do
      let(:argument) { nil }

      it 'return nil' do
        expect(subject).to be_nil
      end
    end

    describe 'when argument is present' do
      let(:argument) { 'file.log' }

      it 'not return nil if argument is present' do
        expect(subject).not_to be_nil
      end
    end
  end
end
