class Page
  attr_reader :title
  attr_accessor :content

  def initialize(title)
    @title = title
  end

end

class PageFactory
  def self.find_or_create(title)
    Page.new(title)
  end

  def self.filename_for(title)
    title.gsub(/\s/, '_') + '.txt'
  end
end

module TestHelper
  def assert_equal(actual, expected)
    puts actual == expected
  end
end

class PageTest
  include TestHelper

  def creating_a_new_page_using_the_factory
    p = PageFactory.find_or_create('O HAI')
    assert_equal(p.title, 'O HAI')
  end

  def page_has_no_content_to_start_with
    p = PageFactory.find_or_create('No Content')
    assert_equal(p.content, nil)
  end

  def page_can_be_given_content
    p = PageFactory.find_or_create('With Content')
    p.content = 'Lorem ipsum'
    assert_equal(p.content, 'Lorem ipsum')
  end
end

class PageFactoryTest
  include TestHelper

  def figuring_out_filename_with_just_one_word
    filename = PageFactory.filename_for('First')
    assert_equal(filename, 'First.txt')
  end

  def figuring_out_filename_with_more_than_one_word
    filename = PageFactory.filename_for('Two Words')
    assert_equal(filename, 'Two_Words.txt')
  end

  def figuring_out_filename_with_more_than_one_space
    filename = PageFactory.filename_for('Three Little     Words')
    assert_equal(filename, 'Three_Little_Words.txt')
  end

end


test = PageTest.new
test.creating_a_new_page_using_the_factory
test.page_has_no_content_to_start_with
test.page_can_be_given_content

test = PageFactoryTest.new
test.figuring_out_filename_with_just_one_word
test.figuring_out_filename_with_more_than_one_word
test.figuring_out_filename_with_more_than_one_space
