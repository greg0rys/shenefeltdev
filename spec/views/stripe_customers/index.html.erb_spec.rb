require 'rails_helper'

RSpec.describe "stripe_customers/index", type: :view do
  before(:each) do
    assign(:stripe_customers, [
      StripeCustomer.create!(),
      StripeCustomer.create!()
    ])
  end

  it "renders a list of stripe_customers" do
    render
    cell_selector = 'div>p'
  end
end
