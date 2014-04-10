require 'spec_helper'

describe "producers/edit" do
  before(:each) do
    @producer = assign(:producer, stub_model(Producer,
      :user_name => "MyString",
      :full_name => "MyString",
      :re_system_type => 1,
      :init_kwh_reading => 1
    ))
  end

  it "renders the edit producer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", producer_path(@producer), "post" do
      assert_select "input#producer_user_name[name=?]", "producer[user_name]"
      assert_select "input#producer_full_name[name=?]", "producer[full_name]"
      assert_select "input#producer_re_system_type[name=?]", "producer[re_system_type]"
      assert_select "input#producer_init_kwh_reading[name=?]", "producer[init_kwh_reading]"
    end
  end
end
