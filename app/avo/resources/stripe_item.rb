class Avo::Resources::StripeItem < Avo::BaseResource
  self.title = :name
  self.description = "This model represents the stripe inventory items as well."
  self.icon = "tabler/outline/shopping-bag-check"
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
    field :name, as: :text
    field :description, as: :textarea
    field :price_cents, as: :number
  end


end
