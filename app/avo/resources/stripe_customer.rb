class Avo::Resources::StripeCustomer < Avo::BaseResource
  self.icon = "tabler/outline/robot"
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
    field :email, as: :text
    field :phone, as: :text
    field :stripe_customer_id, as: :text
    field :default_payment_method_id, as: :text
    field :balance, as: :number
    field :delinquent, as: :boolean
    field :metadata, as: :code
  end
end
