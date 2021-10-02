class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_s
    "Title: \"#{@title}\", Author: #{author}"
  end

  def to_json(*args)
    {
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end
end
