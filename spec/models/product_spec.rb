require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'products' do
      before do
        @category = Category.find_or_create_by(name: 'TMNT')
        # @category_id = @category.id
        @original_count = Product.count
        # puts Category.count
      end
      # test by creating a product with all entries but
      # the one that you are testing - check errors
      # which makes it five examples
      # test that @product can be saved
      it 'gets saved' do
        @splinter = Product.new({
          name: 'Splinter',
          price: 2500,
          quantity: 2,
          category_id: @category.id
        })
        @splinter.save
        # puts ("product #{@splinter.inspect}")

        # check if the item was added to the table
        expect(Product.count).not_to eq(@original_count)
      end
    end
  end
end
