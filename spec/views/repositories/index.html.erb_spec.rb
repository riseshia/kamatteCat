require 'rails_helper'

RSpec.describe "repositories/index", type: :view do
  before(:each) do
    assign(:repositories, [
      Repository.create!(
        :name => "Name",
        :full_name => "Full Name",
        :html_url => "Html Url",
        :github_id => 1,
        :is_target => 0
      ),
      Repository.create!(
        :name => "Name",
        :full_name => "Full Name",
        :html_url => "Html Url",
        :github_id => 1,
        :is_target => 0
      )
    ])
    assign(:has_enabled_repositories, true)
  end

  it "renders a list of repositories" do
    render
    assert_select "tr>td", :text => "OFF".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name (Go to github)".to_s, :count => 2
    assert_select "tr>td", :text => "OFF".to_s, :count => 2
  end
end
