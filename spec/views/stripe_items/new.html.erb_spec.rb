require 'rails_helper'

RSpec.describe "stripe_items/new", type: :view do
  before(:each) do
    assign(:stripe_item, StripeItem.new())
  end

  it "renders new stripe_item form" do
    render

    assert_select "form[action=?][method=?]", stripe_items_path, "post" do
    end
  end
end
