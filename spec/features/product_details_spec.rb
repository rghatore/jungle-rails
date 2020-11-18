require 'rails_helper'

RSpec.feature "Visitor clicks on product on home page", type: :feature, js: true do

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

  xscenario "and see product details page" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    # puts page.html
    first('.product img').click
    sleep(1)
    save_screenshot('screenshot_2a_product_details.png')
    expect(page).to have_content 'Quantity', count: 1
  end

end
