class UI
  TASKS = {
    import: "- Import recipes from Marmiton [import]",
    list: "- List all recipes [list]",
    add:  "- Add a new recipe [add]",
    del:  "- Delete a recipe [del]",
    exit: "- Exit [exit]"
  }

  def initialize(controller)
    @controller = controller
    @running = true
  end

  def import
    puts "Import recipes for which ingredient ?"
    @controller.import(gets.chomp)
  end

  def list
    # TODO: call the appropriate controller method with the proper argument(s)
    # TODO: format and display the retrieved data in a numbered list
    recipes = @controller.list
    recipes.each do |recipe|
      puts "#{recipe[0]}, #{recipe[1]} #{recipe[2]}"
      puts "Préparation : #{recipe[3]}, Cuisson : #{recipe[4]}"
      puts "-----------------"
    end
  end

  def add
    # TODO: ask the user a recipe name
    # TODO: call the appropriate controller method with the proper argument(s)
    @controller.add(gets.chomp)
  end

  def del
    # TODO: ask the user a recipe index
    # TODO: call the appropriate controller method with the proper argument(s)
    @controller.del(gets.chomp)
  end

  def exit
    # TODO: exit the program
    # Hint: Take a look at the display method !
    @controller.exit()
    @running = false
  end

  def user_input
    # TODO: Get the user input and return it
    # [OPTIONAL] You can think of the case where the user
    # enters a wrong choice.
    case gets.chomp
    when "import"
      "import"
    when "list"
      "list"
    when "add"
      "add"
    when "del"
      "del"
    when "exit"
      "exit"
    else
      puts "Wrong choice!"
      display_tasks
      dispatch(user_input)
    end

  end

  def display
    puts "-- Welcome to the CookBook --"

    while @running
      print "\n"

      display_tasks
      dispatch(user_input)

      print "\n"
    end
  end

  ###
  ##  You don't need to modify the following methods !
  ###
  def display_tasks
    puts "What do you want to do? \n"
    puts TASKS.values
  end

  # The dispatch method takes a String or a Symbol as an argument
  # and calls the method with the same name.
  #
  #  Examples:
  #
  #   dispatch(:del) => Will call the `del` method in the current class
  #   dispatch("add") => Will call the `add` method in the current class
  #
  # To understand this, read the doc : http://ruby-doc.org/core-2.1.1/Object.html#method-i-send
  def dispatch(task)
    self.send(task.to_sym)
  end
end
