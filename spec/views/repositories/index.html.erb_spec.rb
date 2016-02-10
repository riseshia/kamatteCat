require 'rails_helper'

RSpec.describe "repositories/index", type: :view do
  before(:each) do
    assign(:repositories, [
      Repository.create!(
        :name => "Name",
        :full_name => "Full Name",
        :html_url => "Html Url",
        :github_id => 1,
        :is_target => 2
      ),
      Repository.create!(
        :name => "Name",
        :full_name => "Full Name",
        :html_url => "Html Url",
        :github_id => 1,
        :is_target => 2
      )
    ])
  end

  it "renders a list of repositories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Html Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
