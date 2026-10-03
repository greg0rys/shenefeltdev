class Avo::Resources::StripeItemSale < Avo::BaseResource
  self.icon = "tabler/outline/building-store"
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
    field :stripe_item, as: :belongs_to
    field :total_amt_sold, as: :number
    field :sales_total, as: :number
  end
end
