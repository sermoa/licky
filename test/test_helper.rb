module TestHelper
  def assert_equal(actual, expected)
    puts result = (actual == expected)
    if !result
      puts "Expected ---> #{expected}"
      puts "Received ---> #{actual}"
    end
  end

  def assert_true(assertion)
    assert_equal(assertion, true)
  end
end