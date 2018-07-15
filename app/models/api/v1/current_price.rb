class Api::V1::CurrentPrice
  include Mongoid::Document
  field :pid, type: Integer
  field :value, type: Float
  field :currency_code, type: String

  index({pid: 1}, {unique: true})

  validates_presence_of :pid, :value, :currency_code
  validates_uniqueness_of :pid
end
