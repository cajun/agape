class Student
  include Mongoid::Document
  field :first_name, :type => String
  field :middle_name, :type => String
  field :last_name, :type => String
  field :date_of_birth, :type => Date
  field :number, :type => Integer

  validates_presence_of( :first_name, :last_name, :date_of_birth, :number )
  validates_numericality_of( :number )
end
