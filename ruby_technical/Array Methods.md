# Array Methods in ruby
# Array
Ruby arrays are orderd collection of object. They can hold object like integer, number, Hash, String symbol or any other array

## Creating Ruby Array
### A ruby array is created in many ways
* Using Literal Constructor
* Using new class method

### 1. Using literal construct

An single array contain different types of objects
For Example - Following Array contain an integer , floating point and a string

eg-   exam =[4,4.0,"Josh"]
      puts exam
o/p - 4
      4.0
      Josh

# Array Methods

## days = [ "Mon" ,"Tue" , "Wed" , "Thu" , "Fri" , "Sat" "Sun" ]
### (i) at method 

To access a particuler element , at method can also be used 
Eg- puts days.at(0)
    puts days.at(-1)

## slice method-Slice method is work similar to #[] method

### (iii) Fetch method 

The Fetch method is used to provide a default value error for out of range indices.
Eg- puts days.fetch(10)
Error : index 10 outside the array bond  : -7 ...7 (index error)
eg  -puts days.fetch(10,"oops")
o/p - oops

### (iv) First and Last Method

The first and last method will return first and last element of an array respectively.
Eg- puts days.first // o/p - Mon
    puts days.last   // o/p -Sun

### (v) Take method

Take method returns the first n element of an array
puts days.take(4) // o/p- Sat,Sun

### (vi) Drop method

Drop method is opposite of take method . it returns element after n elements have been dropped.
puts days.drop(2) // o/p-
puts days.drop(1) // o/p-

## Adding item to array :
Ruby item elements can be added in different ways-

Push or <<
unshift
insert
push

### (v) Push or <<

Using push or << ,item can be added at th end of the Array.
puts days.pus("Today)
puts days << ("Tomorrow)

### (vi) unshift

Using unshift , a new element can be added at the beginning of an array.
Eg- days=["Fri","Sat","Sun"]
    puts day.unshift("Today");

### (vii) Insert

Using insert , A new element can be added at any position in an array.Here first we need to mentioned the index number at whic we want to position the element
eg- puts days.insert(2,"Thurs")

## Removing item from Array
Ruby array elements can be remove in different ways.

Pop
Shift
Delete
Uniq

### (viii) Pop

Remove end of array and it returns the remove item
Eg-  days=["Fri","Sat","Sun"]
     puts days.pop
o/p -Sun

### (ix) Shift

it remove start of the array and it returns the remove item
Eg   - puts days.shift
o/p  - Fri

### (x) Delete , Delete_at(Index_number)

Using delete item can be remove from anywhere in an array . it returns the removed item
puts days.delete("sat")
o/p- Sat

### (xi) uniq

Using uniq , duplicate elements can be removed from an array. it returns the remaining array
days=["Fri","Sat","Sun","Sat"]
print days.uniq
o/p-[Fri , Sat , Sun]