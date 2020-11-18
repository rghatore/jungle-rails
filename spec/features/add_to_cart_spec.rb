require 'rails_helper'

RSpec.feature "Visitor clicks on add product on home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "and cart quantity increases by 1" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    # puts page.html
    expect(page).to have_content 'My Cart (0)'
    first('.product .button_to').click
    sleep(1)
    save_screenshot('screenshot_3a_add_to_cart.png')
    expect(page).to have_content 'My Cart (1)'
  end

end
