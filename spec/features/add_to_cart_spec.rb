require 'rails_helper'

RSpec.feature "User clicks 'Add To Cart'", type: :feature, js: true do

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

  scenario "They click on 'Add To Cart' and cart qty increases by one" do
    # ACT
    visit root_path
    
    first('footer.actions').find_button('Add').click
    expect(page).to have_content('My Cart (1)')

    # DEBUG / VERIFY
    save_screenshot
  end
end
