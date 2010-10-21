# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :teacher do |f|
  f.first_name "MyString"
  f.middle_name "MyString"
  f.last_name "MyString"
  f.number 1
end
