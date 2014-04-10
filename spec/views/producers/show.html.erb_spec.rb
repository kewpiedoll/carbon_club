require 'spec_helper'

describe "producers/show" do
  before(:each) do
    @producer = assign(:producer, stub_model(Producer,
      :user_name => "User Name",
      :full_name => "Full Name",
      :re_system_type => 1,
      :init_kwh_reading => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Name/)
    rendered.should match(/Full Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
