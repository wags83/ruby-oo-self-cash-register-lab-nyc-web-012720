require "pry"
class CashRegister
    
    attr_accessor :discount, :total
    
    def initialize (discount=0)
        @total = 0
        @discount = discount
        @item_list = []
        @last_transaction = 0
    end

    def add_item (item_name, price, quantity=1)
        @total += price * quantity
        @item_list.fill(item_name, @item_list.size, quantity)
        @last_transaction = price*quantity
    end

    def apply_discount 
        if @discount == 0
            return "There is no discount to apply."
        else
            @total = @total.to_f*((100-@discount.to_f)/100)
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @item_list
    end

    def void_last_transaction
        @total = @total - @last_transaction
    end

end
