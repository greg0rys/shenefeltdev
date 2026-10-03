require 'rails_helper'

RSpec.describe "stripe_purchases/new", type: :view do
  before(:each) do
    assign(:stripe_purchase, StripePurchase.new())
  end

  it "renders new stripe_purchase form" do
    render

    assert_select "form[action=?][method=?]", stripe_purchases_path, "post" do
    end
  end
end
