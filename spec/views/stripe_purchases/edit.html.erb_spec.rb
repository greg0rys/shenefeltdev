require 'rails_helper'

RSpec.describe "stripe_purchases/edit", type: :view do
  let(:stripe_purchase) {
    StripePurchase.create!()
  }

  before(:each) do
    assign(:stripe_purchase, stripe_purchase)
  end

  it "renders the edit stripe_purchase form" do
    render

    assert_select "form[action=?][method=?]", stripe_purchase_path(stripe_purchase), "post" do
    end
  end
end
