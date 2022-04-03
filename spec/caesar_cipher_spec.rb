require './lib/code'

describe 'Caesar Cipher' do
  describe "#all lowercase" do
    it 'Works for an all lowercase word' do
      expect(caesar_cipher('hello', 5).eql?('mjqqt'))
    end
  end

  describe '#all uppercase' do
    it 'Works for an all uppercase word' do
      expect(caesar_cipher('WORLD', 6).eql?('CUXRJ'))
    end
  end

  describe '#mixcase' do
    it 'Works for mixcase' do
      expect(caesar_cipher('Eric', 8).eql?('Mzqk'))
    end
  end

  describe '#negative' do
    it 'Shifts left with a negative number' do
      expect(caesar_cipher('Hello', -7).eql?('Axeeh'))
    end
  end
end