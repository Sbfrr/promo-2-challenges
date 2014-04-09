## Background & Objectives
Destructive methods are methods who modify their receiver. They are dangerous in a way. Therefore a good convention is to name them with a final bang `!`.

## Specs
- Implement `#pmu_format!` that modifies the array it takes as argument to make it more friendly for the PMU anchorman
- **constraint**: The method should reverse the array, prepend the horse position, and add a bang at the end of the horse name string. Ex: `["Abricot du Laudot", "Black Caviar", "Brigadier Gerard"]` should become exaclty `["3-Brigadier Gerard!", "2-Black Caviar!", "1-Abricot du Laudot!"]` after formating. That's the only format the anchorman can understand !

Remember that the method should modifify the array object given in input, not simply return a modified copy of this array.

## Tips & Resources
- Of course, you should use destructive iterators within the method :)

## Learning Badges
As you realize, the only purpose of a method is not only ti return the result of some computation.. A method can also be there to perform actions on objects that it will modify. Make sure your are confortable with the following notions before moving on.
- What's an object id ? Type `"something".object_id` in IRB to figure it out.
- What's an object equality ? When you use `a==b` in a conditional statement, do you test object equality ? What do you test exactly ?
- (optional) How can we assign a copy of an object `a` to a new variable `b` so that it stores a copy of this object but not the original one ?

