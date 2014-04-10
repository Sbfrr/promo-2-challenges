def tag(tag_name, attr = nil)

  #TODO:  Build HTML tags around  content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]

  attr == nil ? attribute = "" : attribute = " #{attr[0]}=\'#{attr[1]}\'"

  "<#{tag_name}#{attribute}>" + yield + "</#{tag_name}>"
end

def timer_for
  #TODO:  Return time taken to execute the given block
  time_0 = Time.now
  yield
  time_1 = Time.now
  time_1 - time_0
end

def transform(element)
  yield element
  #TODO:  Simply execute the given block on element
end

