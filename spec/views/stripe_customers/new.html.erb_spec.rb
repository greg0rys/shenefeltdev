require 'rails_helper'

RSpec.describe "stripe_customers/new", type: :view do
  before(:each) do
    assign(:stripe_customer, StripeCustomer.new())
  end

  it "renders new stripe_customer form" do
    render

    assert_select "form[action=?][method=?]", stripe_customers_path, "post" do
    end
  end
end
