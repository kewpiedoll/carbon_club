require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do 
    before { visit root_path }

    it { should have_content('GreenCoin') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do 

    it "should have the h1 content 'Help'" do 
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title('GreenCoin | Help')
    end
  end

  describe "About page" do 
    it "should have the h1 content 'About us'" do 
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title('GreenCoin | About')
    end
  end

  describe "Contact page" do
    it "should have the h1 'Contact" do 
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do 
      visit contact_path
      expect(page).to have_title("GreenCoin | Contact")
    end
  end
end

