# What is Metaprogramming?
Metaprogramming is a technique in which code operates on code rather than on data. It can be used to write programs that write code dynamically at run time. MetaProgramming gives Ruby the ability to open and modify classes, create methods on the fly and much more.

A few examples of metaprogramming in Ruby are:

* Adding a new method to Ruby's native classes or to classes that have been declared beforehand.
* Using send to invoke a method by name programmatically.

## Monkey Patching
A Monkey Patch (MP) is referred to as a dynamic modification to a class and by a dynamic modification to a class means to add new or overwrite existing methods at runtime. This ability is provided by ruby to give more flexibility to the coders.

It is a very important feature and needs extra care while using it. There are some basic properties for monkey patching in ruby listed as follows.

1. If multiple libraries have the same       method, the first one will get overwritten.
2. If the class is not imported before the patch, it will lead to a redefinition of the class instead of patching it.
3. All the patches are global in nature and can actually disrupt multiple libraries.
4. Monkey patching is used to patch up classes that are owned by the coder and it’s not recommended to patch a class already defined in Ruby which are used frequently like Hashes, Lists, etc.

#### Syntax  
```
class [class_name]
     def [method_to_patch]:
       #do_something
     end
end 
```