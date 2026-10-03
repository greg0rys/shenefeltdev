class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  PASTEL = Pastel.new
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  def self.display_console_info
    return nil if User.count.zero?
    User.all.each { |u| puts PASTEL.magenta.bold("User id: #{u.id}\nUser Email #{u.email}") }
  end
end
