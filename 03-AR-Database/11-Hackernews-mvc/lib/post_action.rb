class PostAction
  attr_reader :title

  def initialize(title, &block)
    @title = title
    @action = block
  end

  # "Running" a menu action simply means calling the block that was given at
  # initialization with the given arguments
  def run(*args)
    @action.call(args)
  end
end
