require 'spec_helper'

describe Post do
  describe 'creation' do 
    context "when is not valid" do
      subject { FactoryGirl.build :empty_post }
      it { should_not be_valid }
    end

    context "when body is empty" do
      subject { FactoryGirl.build :empty_post, title: "byle co"}
      it { should_not be_valid }
    end

    context "when category not present" do
     subject { FactoryGirl.build :post_with_no_category_id }
     it { should_not be_valid }
    end
  end
end