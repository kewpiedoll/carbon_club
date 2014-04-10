require 'spec_helper'

describe "producers/index" do
  before(:each) do
    assign(:producers, [
      stub_model(Producer,
        :user_name => "User Name",
        :full_name => "Full Name",
        :re_system_type => 1,
        :init_kwh_reading => 2
      ),
      stub_model(Producer,
        :user_name => "User Name",
        :full_name => "Full Name",
        :re_system_type => 1,
        :init_kwh_reading => 2
      )
    ])
  end

  it "renders a list of producers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
