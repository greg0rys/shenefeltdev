require 'rails_helper'

RSpec.describe "stripe_items/edit", type: :view do
  let(:stripe_item) {
    StripeItem.create!()
  }

  before(:each) do
    assign(:stripe_item, stripe_item)
  end

  it "renders the edit stripe_item form" do
    render

    assert_select "form[action=?][method=?]", stripe_item_path(stripe_item), "post" do
    end
  end
end
