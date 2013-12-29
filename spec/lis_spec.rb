$:.unshift(__dir__)
require 'spec_helper'

describe Lis do
  let(:hash) { {
    'a' => {
      'a_1' => [
        'a_1_1',
        'a_1_2',
      ],
      'a_2' => [
        'a_2_1',
      ],
    },
    'b' => [
      'b_1',
      'b_2',
    ],
  } }
  let(:text) {
    <<-TXT
a
-a_1
--a_1_1
--a_1_2
-a_2
--a_2_1
b
-b_1
-b_2
    TXT
  }
  let(:flat_array) { %w(a b c) }
  let(:flat_text) {
    <<-TXT
a
b
c
    TXT
  }
  let(:invalid_text) {
    <<-TXT
a
--a_1
    TXT
  }

  describe '.parse' do
    describe 'valid text' do
      describe 'hash' do
        subject { Lis.parse(text) }
        it { subject.must_equal hash }
      end

      describe 'flat array' do
        subject { Lis.parse(flat_text) }
        it { subject.must_equal flat_array }
      end
    end

    describe 'invalid text' do
      subject { Lis.parse(invalid_text) }
      it { ->{ subject }.must_raise Lis::ParseError }
    end
  end

  describe '.serialize' do
    describe 'hash' do
      subject { Lis.serialize(hash) }
      it { subject.must_equal text }
    end

    describe 'flat array' do
      subject { Lis.serialize(flat_array) }
      it { subject.must_equal flat_text }
    end
  end
end
