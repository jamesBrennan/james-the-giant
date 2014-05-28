require 'spec_helper'

describe "admin/shows/edit" do
  before(:each) do
    @admin_show = assign(:admin_show, build_stubbed(:admin/show))
  end

  it "renders the edit admin_show form" do
    render

    assert_select "form", action: admin_shows_path(@admin_show), method: "post" do
      assert_select "input#admin_show_city", name: "admin_show[city]"
      assert_select "input#admin_show_state", name: "admin_show[state]"
      assert_select "input#admin_show_link", name: "admin_show[link]"
    end
  end
end
