require 'rails_helper'

RSpec.feature "users can navigate from the home page to the product detail", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      
    end
  end

  scenario "They see click on a product" do
    # ACT
    visit root_path
    find('a.btn', match: :first).click
    
    #DEBUG
    
    # VERIFY
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end
end