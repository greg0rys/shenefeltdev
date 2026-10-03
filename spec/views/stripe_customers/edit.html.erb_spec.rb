require 'rails_helper'

RSpec.describe "stripe_customers/edit", type: :view do
  let(:stripe_customer) {
    StripeCustomer.create!()
  }

  before(:each) do
    assign(:stripe_customer, stripe_customer)
  end

  it "renders the edit stripe_customer form" do
    render

    assert_select "form[action=?][method=?]", stripe_customer_path(stripe_customer), "post" do
    end
  end
end
