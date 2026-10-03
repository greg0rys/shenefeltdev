require 'rails_helper'

RSpec.describe "stripe_purchases/index", type: :view do
  before(:each) do
    assign(:stripe_purchases, [
      StripePurchase.create!(),
      StripePurchase.create!()
    ])
  end

  it "renders a list of stripe_purchases" do
    render
    cell_selector = 'div>p'
  end
end
