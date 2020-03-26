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

  describe 'present results of parsing' do
    let(:file) { Pathname.new('spec/fixtures/webserver_mini.log') }
    subject { described_class.new(file) }

    before { subject.call }

    describe '#page_views' do
      it 'return array of page views' do
        expect(subject.views).to be_a(Array)
      end

      it 'return descending sorted array' do
        expected_result = [
          '/main 10 views',
          '/page 5 views'
        ]
        expect(subject.views).to eq(expected_result)
      end
    end

    describe '#uniq_page_views' do
      it 'return array of page views' do
        expect(subject.unique_views).to be_a(Array)
      end

      it 'return descending sorted array' do
        expected_result = [
          '/page 5 unique views',
          '/main 2 unique views'
        ]
        expect(subject.unique_views).to eq(expected_result)
      end
    end

    describe '#to_s' do
      it 'return block of string with results' do
        expect(subject.to_s).to eq("/main 10 views\n/page 5 views\n\n/page 5 unique views\n/main 2 unique views")
      end
    end
  end
end
