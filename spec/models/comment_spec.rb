require 'spec_helper'

describe Comment do
  describe "creation" do
    context "when is not valid(empty)" do
      subject { FactoryGirl.build :empty_comment}
      
      it { should_not be_valid }
    end

    context "when email has invalid format" do
      subject { FactoryGirl.build :comment, email: 'asdsad'} 

      it { should_not be_valid }     
    end
  end
end
