require 'spec_helper'

describe Developer do
	#before :each do
	#	@developer = DeveloperTest.new(:experience => 1)
	#end

	it "takes three parameters and returns a Book object" do
		@developer = DeveloperTest.new(:id => 1)
		@developer.should be_an_instance_of DeveloperTest
	end

	it "has the same experience" do
		@developer = DeveloperTest.new(:id => 1)
		@developer.experience = 1
		@developer.experience.should eq(1)
	end
end