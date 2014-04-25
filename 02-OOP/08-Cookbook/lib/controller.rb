require_relative 'cookbook'

class Controller
  def initialize(file)
    # Here you should instantiate the Cookbook model with the file
    @cookbook = CookBook.new(file)
    @file = file
  end

  def import(ingredient)
    @cookbook.import(ingredient)
  end

  def list
    # TODO: call the appropriate controller method with the proper argument(s)
    # TODO: format and display the retrieved data in a numbered list
    @cookbook.list
  end

  def add(recipe)
    # TODO: ask the user a recipe name
    # TODO: call the appropriate controller method with the proper argument(s)
    @cookbook.add(recipe)
  end

  def del(recipe)
    # TODO: ask the user a recipe index
    # TODO: call the appropriate controller method with the proper argument(s)
    @cookbook.del(recipe)

  end

  def exit
    # TODO: exit the program
    # Hint: Take a look at the display method !
    @cookbook.save_to_csv(@file)
  end

  # TODO: Implement the methods to retrieve, add, and delete recipes through the model
end
