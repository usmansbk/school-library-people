require_relative 'spec_helper'

describe Corrector do
  before :each do
    @corrector = Corrector.new
  end

  describe '#correct_name' do
    context "with downcase name" do
      it "returns a capitalized name" do
        expect(@corrector.correct_name "usman").to eq "Usman" 
      end
    end

    context "with more than 10 characters" do
      it "returns a capitalized name" do
        expect(@corrector.correct_name "usman suleiman").to eq "Usman sule" 
      end
    end
  end
end