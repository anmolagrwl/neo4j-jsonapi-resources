class PhoneNumber
  include Neo4j::ActiveNode

  property :name
  property :phone_number

  has_one :in, :contact, type: 'HAS_PHONE'
end
