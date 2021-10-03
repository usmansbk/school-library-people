require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new("Lord of the rings", "Tolkien")
  end

  describe "#new" do
    it "takes two parameters and returns a Book object" do
      @book.should be_an_instance_of Book
    end
  end
end