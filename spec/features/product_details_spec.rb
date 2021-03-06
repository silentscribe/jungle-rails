require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

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

  scenario "They click on product and it navigates to page" do
    # ACT
    visit root_path
    
    first('footer.actions').find_link('Details').click
    expect(page).to have_css 'section.products-show', count: 1

  
    # DEBUG / VERIFY
    # sleep 2
    # save_screenshot
  end


end
