require 'spec_helper'

describe "admin/shows/index" do
  before(:each) do
    assign(:admin_shows, [
      build_stubbed(:admin/show,
        city: "City",
        state: "State",
        link: "Link"
      ),
      build_stubbed(:admin/show,
        city: "City",
        state: "State",
        link: "Link"
      )
    ])
  end

  it "renders a list of admin/shows" do
    render

    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "State".to_s, count: 2
    assert_select "tr>td", text: "Link".to_s, count: 2
  end
end
