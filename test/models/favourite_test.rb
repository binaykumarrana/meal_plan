require "test_helper"

describe Favourite do
  let(:favourite) { Favourite.new }

  it "must be valid" do
    value(favourite).must_be :valid?
  end
end
