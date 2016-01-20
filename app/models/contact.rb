class Contact
  include Neo4j::ActiveNode

  property :name_first
  property :name_last
  property :email
  property :twitter

  has_many :out, :phone_numbers, type: :has_phone

  ### Validations
  # validates :name_first, presence: true
  # validates :name_last, presence: true

end
