require 'checkout.rb'

describe Checkout do

let(:checkout) {described_class.new}

	describe '#scan' do
		it "adds the item to an array" do
			expect(checkout.scan("product_code")).to eq(["product_code"])
		end

		it "adds two items to the basket" do
			checkout.scan("item1")
			expect(checkout.scan("item2")).to eq(["item1","item2"])
		end
	end

	describe '#total' do
		it "calculates the total of an empty basket" do
			expect(checkout.total).to eq 0
		end

		it "calculates the total for one coffee" do
			checkout.scan(COFFEE)
			expect(checkout.total).to eq 1123
		end

    it "calculates the total for one coffee and one fruit tea" do

		 checkout.scan(COFFEE)
		 checkout.scan(FRUIT_TEA)
		 expect(checkout.total).to eq 1434
    end

		it "calculates the correct total with the discount for two fruit tea" do
			checkout.scan(COFFEE)
			2.times{checkout.scan(FRUIT_TEA)}
			expect(checkout.total).to eq 1434
		end

		it "calculates the correct total with the discount for 3 strawberries" do
			3.times{checkout.scan(STRAWBERRY)}
			expect(checkout.total).to eq 1350
		end

		it "calculates the correct total with the discount for more than 3 strawberries" do
			7.times{checkout.scan(STRAWBERRY)}
			expect(checkout.total).to eq 3150
		end

		it "calculates the correct total for one strawberry" do
			checkout.scan(STRAWBERRY)
			expect(checkout.total).to eq 500
		end

		it "returns the same total everytime it is called" do
			4.times{checkout.scan(FRUIT_TEA)}
			5.times{checkout.scan(STRAWBERRY)}
			checkout.total
			expect(checkout.total).to eq 2872
		end
	end

end
