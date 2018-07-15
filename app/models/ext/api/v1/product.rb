class Ext::Api::V1::Product
  include Mongoid::Document
  field :pid, type: Integer
  field :name, type: String

  index({pid: 1}, {unique: true})
  
  validates_presence_of :pid, :name
  validates_uniqueness_of :pid
end
