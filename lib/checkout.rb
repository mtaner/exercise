COFFEE = 'CF1'
FRUIT_TEA = 'FR1'
STRAWBERRY = 'SR1'

class Checkout

	PRICES = {
		COFFEE => 1123,
		FRUIT_TEA => 311,
		STRAWBERRY => 500
	}

	def initialize
		@basket = []
	end

	def scan(item)
		@basket << item
	end

	def total
		@price = []
		check_discount
		@basket.each do |item|
			@price << PRICES[item]
		end
		@price.reduce(0, &:+)
	end

	private

	def check_discount
		fruit_tea_discount
		strawberry_discount
	end

	def strawberry_discount
		strawberry_count = @basket.select{ |item| item == STRAWBERRY}.count
		if strawberry_count >= 3
			@price << -(strawberry_count*50)
		end
	end

	def fruit_tea_discount
		fruit_tea_count = @basket.select{ |item| item == FRUIT_TEA}.count
		discount = fruit_tea_count / 2
		@price << -(discount*PRICES[FRUIT_TEA])
	end
end
