require 'spec_helper'

# describe Producer do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Producer do

  before do 
    @producer = Producer.new(user_name: "exampleuser", full_name: "Example User", re_system_type:
                              1, init_kwh_reading: 1890, email: "example@user.com",
                              password: "foobarfoobar", password_confirmation: "foobarfoobar")
  end

  subject { @producer }

  it { should respond_to(:user_name) }
  it { should respond_to(:full_name) }
  it { should respond_to(:re_system_type) }
  it { should respond_to(:init_kwh_reading) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do 
    before { @producer.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do 
    before { @producer.email = " " }
    it { should_not be_valid }
  end

  # I wrote these specs -- anything for "system" and "init-reading" is not included
  # in the text examples
  describe "when system is not present" do 
    before { @producer.re_system_type = " " }
    it { should_not be_valid }
  end

  describe "when init_kwh_reading is not present" do 
    before { @producer.init_kwh_reading = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do 
    before { @producer.name = "a" * 26}
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do 
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar_baz.com]
      addresses.each do |invalid_address|
        @producer.email = invalid_address
        expect(@producer).not_to be_valid
      end
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do 
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.com]
      addresses.each do |invalid_address|
        @producer.email = invalid_address
        expect(@producer).to be_valid
      end
    end
  end

  describe "when email address is already taken" do 
    before do 
      user_with_same_email = @producer.dup
      user_with_same_email.email = @producer.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  # Kewpiedoll specific tests for system/init_kwh_reading below
  describe "when system value is not within range" do
    it "should be invalid" do 
      system_values = [1000, -20, 7, 0]
      system_values.each do |invalid_value|
        @producer.system = invalid_value 
        expect(@producer).not_to be_valid
      end
    end
  end

  describe "when initial meter reading is not a reasonable, positive number, or 0" do 
    it "should not be invalid" do 
      system_values = [-1, 1000000001]
      system_values.each do |invalid_value|
        @producer.init_kwh_reading = invalid_value 
        expect(@producer).not_to be_valid
      end
    end
  end
  # end Kewpiedoll specific tests

  describe "when password is not present" do 
    before do 
      @producer = Producer.new(user_name: "wxampleuser", full_name: "Example User", re_system_type:
                              "1", init_kwh_reading: "1890", email: "example@user.com")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do 
    before { @producer.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do 
    before { @producer.password = @producer.password_confirmation = "a" * 9 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do 
    before { @producer.save }
    let(:found_producer) { producer.find_by(email: @producer.email) }

    describe "with valid password" do
      it { should eq found_producer.authenticate(@producer.password) }
    end

    describe "with invalid password" do 
      let(:producer_for_invalid_password) { found_producer.authenticate("invalid") }

      it { should_not eq user_for_producer_password }
      specify { expect(user_for_producer_password).to be_false }
    end
  end



end