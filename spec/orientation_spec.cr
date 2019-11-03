require "./spec_helper"
require "../src/*"

describe Orientation do
    it "creates a new orientation with a vector" do
        North.new.forward_vector.should eq({0, 1})
        West.new.forward_vector.should eq({-1, 0})
    end
end