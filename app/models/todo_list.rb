class TodoList
  include Mongoid::Document
  
  field :name, :type => String
  embedded_in :user

  validates_uniqueness_of :name
end
