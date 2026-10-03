class Avo::Resources::StripePurchase < Avo::BaseResource
  self.icon = "tabler/outline/receipt-2"
  # self.avatar = {
  #   source: :avatar
  # }
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    # field :avatar, as: :avatar
    field :customer, as: :belongs_to
    field :stripe_payment_intent_id, as: :text
    field :status, as: :text
    field :total_cents, as: :number
    field :currency, as: :text
    field :metadata, as: :code
  end
end
