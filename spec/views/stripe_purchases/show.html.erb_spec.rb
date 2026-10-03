require 'rails_helper'

RSpec.describe "stripe_purchases/show", type: :view do
  before(:each) do
    assign(:stripe_purchase, StripePurchase.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
