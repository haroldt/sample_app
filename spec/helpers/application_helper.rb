require File.expand_path('spec/spec_helper')

describe ApplicationHelper do

  describe "full title" do
    it "should include the page title" do
      full_title("foo").should =~ /foo/
    end

    it "Should include the base title" do
      full_title("foo").should =~ /^Ruby on Rails Tutorial Sample App/
    end

    it "should not include a bar for the home page" do
      full_title("").should_not =~ /\|/
    end

  end

end
