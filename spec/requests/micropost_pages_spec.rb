require File.expand_path('spec/spec_helper')

describe "Microposts pages" do
  subject { page  }

  let(:user) { FactoryGirl.create(:user) }
  before {sign_in user}

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid info" do
      it "should not create a micropost" do
        expect {click_button "Post"}.should_not change(Micropost, :count)
      end

      describe "error :message" do
        before { click_button "Post" }
        it { should have_content('error')}
      end
    end

    describe "with valid info" do
      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Post" }.should change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link "delete" }.should change(Micropost, :count).by(-1)
      end
    end
  end
end

