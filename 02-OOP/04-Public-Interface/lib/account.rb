# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount

  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)

  MIN_DEPOSIT =  100
  attr_reader :name, :position

  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    add_transaction(-amount)
    "You just withdraw #{amount}$ from your account."
  end

  def deposit(amount)
    add_transaction(amount)
    "You just deposit #{amount}$ on your account."
  end

  def transactions_history(args = {})
    history = ""
    if args[:password] == nil
      history += 'no password given'
    elsif args[:password] != @password
      history += 'wrong password'
    else
      @transactions.each  do |transaction|
        transaction > 0 ? history += "deposit: #{transaction}" : history += "withdraw: #{-transaction}"
      end
    end
    history
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
  end

  def iban
    length = @iban.length
    "#{@iban[0...4]}#{"*"*(length-7)}#{@iban[(length-3)...length]}"
  end

  def to_s
    "Owner: #{@name}\nIBAN: #{self.iban}\nCurrent Amount: #{@position}"
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    @transactions << amount
    # TODO: update the current position (which represents the balance of the account)
    @position += amount
  end

end
