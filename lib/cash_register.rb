class CashRegister
    attr_accessor :discount, :total, :items, :last_amt
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times {items << title}
        self.last_amt = price * quantity
    end

    def apply_discount
        return "There is no discount to apply." if self.discount == 0
        self.total = (100 - discount).to_f / 100 * self.total
        formatted = self.total.to_s.sub(/\.?0+$/, '')
        "After the discount, the total comes to $#{formatted}."
    end

    def void_last_transaction
        self.total -= self.last_amt 
    end
end

