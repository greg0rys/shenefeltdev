require 'rails_helper'

RSpec.describe "stripe_customers/show", type: :view do
  before(:each) do
    assign(:stripe_customer, StripeCustomer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
