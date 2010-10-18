class Teacher
  include Mongoid::Document
  field :first_name, :type => String
  field :middle_name, :type => String
  field :last_name, :type => String
  field :number, :type => Integer
end
