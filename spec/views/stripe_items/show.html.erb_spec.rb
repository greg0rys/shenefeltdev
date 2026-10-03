require 'rails_helper'

RSpec.describe "stripe_items/show", type: :view do
  before(:each) do
    assign(:stripe_item, StripeItem.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
