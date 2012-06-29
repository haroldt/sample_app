require File.expand_path('spec/spec_helper')

describe Micropost do

  let(:user) {FactoryGirl.create(:user)}

  before do
    @micropost = user.microposts.build(content: "lorem ipsum")
  end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @micropost.content = "" }
    it { should_not be_valid }
  end

  describe "with content that is to long" do
    before { @micropost.content = "a" *141 }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect {Micropost.new(user_id: user.id)}.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end

