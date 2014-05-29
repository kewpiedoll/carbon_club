require 'spec_helper'

describe "Producers" do

  subject { page }

  describe "index" do 
    before do
      sign_in FactoryGirl.create(:producer)
      # FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
      visit users_path
    end
      # tests go here
  end

  describe "profile page" do
    let(:producer) { FactoryGirl.create(:producer) }
    before do 
      # authenticate user or login here
      visit producer_session_path
      fill_in "Email", with: "biodieselchris@gmail.com"
      fill_in "Password", with: "qqqwwweee"
      click_button "Sign in"
      visit producer_path(producer)
    end
    it { should have_content(producer.user_name) } 
    it { should have_title(full_title(producer.user_name)) }
  end

  # tried these as well and same failure as above
  # describe "edit profile page" do
  #   let(:producer) { FactoryGirl.create(:producer) }
  #   before { visit edit_producer_path(producer) }

  #   it { should  have_content(producer.user_name) } 
  #   it { should have_title(full_title(producer.user_name)) }
  # end

  describe "signup page" do
    before { visit new_producer_registration_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "signup" do 
    before { visit new_producer_registration_path}

    let(:submit) { "Sign up" }

    describe "with invalid information" do 
      it "should not create a user" do 
        expect { click_button submit }.not_to change(Producer, :count)
      end
    end

    describe "with valid information" do 
      before do 
        fill_in "Email",                  with: "user@example.com"
        fill_in "Password",               with: "aaabbbccc"
        fill_in "Password Confirmation",  with: "aaabbbccc"
        fill_in "User Name",              with: "exampleuser"
        fill_in "Full Name",              with: "Example User"
        fill_in "Re System Type",         with: "1"
        fill_in "Init Kwh Reading",       with: "1890"
      end

      it "shoud create a user" do 
        expect { click_button submit }.to change(Producer, :count).by(1)
      end
    end
  end
end