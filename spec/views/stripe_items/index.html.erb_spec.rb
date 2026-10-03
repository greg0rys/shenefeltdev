require 'rails_helper'

RSpec.describe "stripe_items/index", type: :view do
  before(:each) do
    assign(:stripe_items, [
      StripeItem.create!(),
      StripeItem.create!()
    ])
  end

  it "renders a list of stripe_items" do
    render
    cell_selector = 'div>p'
  end
end
