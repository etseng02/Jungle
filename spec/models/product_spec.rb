#require_relative 'product'

require 'rails_helper'

#RSpec.describe Product, type: :model do

describe Product, type: :model do


  
  describe 'Validations' do
    subject { Product.new(name: "test", price: 100, quantity: "20", category_id: "1") }
    
    it 'should have a product name' do
      expect(subject.name).to be_present
  end

  it 'should have a price' do
    expect(subject.price).to be_present
end

it 'should have a quantity' do
  expect(subject.quantity).to be_present
end

it 'should have a category' do
  expect(subject.category_id).to be_present
end



end

end
