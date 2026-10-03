class Avo::Resources::StripeRefund < Avo::BaseResource
  self.icon = "tabler/outline/moneybag-plus"
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
    field :stripe_customer, as: :belongs_to
    field :amount_cents, as: :number
  end
end
