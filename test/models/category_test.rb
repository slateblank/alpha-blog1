require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    def setup
        @category = Category.new(name: "sports")
    end

    test "category should be valid" do
        assert @category.valid?    #active record assertion
    end
    
    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end
    
    test "name should be unique" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid? #we already created category 'sports' spo assertion should fail 
    end
    
    test "name should not be too long" do
        @category.name = "a" * 26 #a sting of 26 as should fail
        assert_not @category.valid?
    end
    
    test "name should not be too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end
    
end