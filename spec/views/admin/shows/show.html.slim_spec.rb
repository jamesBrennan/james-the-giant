require 'spec_helper'

describe "admin/shows/show" do
  before(:each) do
    @admin_show = assign(:admin_show, build_stubbed(:admin/show))
  end

  it "renders attributes" do
    render

    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Link/)
  end
end
