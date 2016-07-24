require 'spec_helper'

describe AndOr do
  it 'has a version number' do
    expect(AndOr::VERSION).not_to be nil
  end

  describe 'prototyping test' do 
    it 'whole test'  do
      and_or = AndOr::RegExp.new("test1 test2, test3")
      and_or.classify
      and_or.check_single("test1 test2 test3")
      and_or.check_multi("test1 test2 test3")
      expect(and_or.result).to be true
    end
  end
end
