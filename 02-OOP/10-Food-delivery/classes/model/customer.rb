class Customer
  attr_accessor :name, :address

  def initialize(name, address)
    @name = name
    @address = address
  end

  def to_s
    # Return a multiline string with name and address of customer
    <<MULTILIGNE
    #{@name}
    #{@address[:address]}
    #{@address[:postal_code]} #{@address[:city]}
    Phone: #{@address[:phone]}
    MULTILIGNE
  end
end
