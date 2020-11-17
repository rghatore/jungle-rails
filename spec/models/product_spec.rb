require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'products' do
      before(:all) do
        @category = Category.find_or_create_by(name: 'TMNT')
        @original_count = Product.count
      end
      # test that @product can be saved
      it 'gets saved' do
        @splinter = Product.new({
          name: 'Splinter',
          price: 25,
          quantity: 2,
          category_id: @category.id
        })
        @splinter.save
        # check if the item was added to the table
        expect(Product.count).not_to eq(@original_count)
      end
      # validate name test
      it 'does not get saved when name is missing' do
        @raph = @category.products.create(price: 30, quantity: 1)
        expect(@raph).to_not be_valid
        expect(@raph.errors.messages[:name]).to eq ['can\'t be blank']
      end
      # validate price test
      it 'does not get saved when price is missing' do
        @raph = @category.products.create(name: 'Raphael', quantity: 1)
        expect(@raph).to_not be_valid
        expect(@raph.errors.full_messages).to include('Price can\'t be blank')
      end
      # validate quantity test
      it 'does not get saved when quantity is missing' do
        @raph = @category.products.create(name: 'Raphael', price: 30)
        expect(@raph).to_not be_valid
        expect(@raph.errors.full_messages).to include('Quantity can\'t be blank')
      end
      # validate category test
      it 'does not get saved when not linked to category' do
        @raph = Product.create(name: 'Raphael', price: 30, quantity: 1)
        expect(@raph).to_not be_valid
        expect(@raph.errors.full_messages).to include('Category can\'t be blank')
      end
    end
  end
end
