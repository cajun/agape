require 'spec_helper'

describe Student do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :number }
  it { should validate_presence_of :date_of_birth }
  it { should validate_numericality_of :number }
end
