class Rental
    attr_accessor :date
    belongs_to :book
    belongs_to :person
    
    def initialize(date)
        @date = date
    end
end