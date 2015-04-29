Write a method `count_letters` that can tell us all the unique characters that exist in a string that is passed into the method. Furthermore, the method should also report back how many instances of each letter were found in the string.

Methods generally return one object. That object can be a number, a boolean, nothing (`nil`), a symbol, a string, and so on. However, we need to return an object that can represent all the characters found in the input string, and their respective counts.

What type of object should be returned back by `count_letters`? A Hash comes to mind! 

So `count_letters("lighthouse in the house...")` would return:

    {
      'l' => 1,
      'i' => 2,
      'g' => 1,
      'h' => 4,
      't' => 2,
      'o' => 2,
      'u' => 2,
      's' => 2,
      'e' => 3,
      'n' => 1,
      '.' => 3
    }

**Tip:** Use `.inspect` on any object to turn it into a debug-friendly string... great for `puts`ing objects like Hashes to the screen.

Also, note that we are skipping and not counting spaces. 

## Return indices instead

Instead of returning just the count of each letter, the requirement has changed to return all the indices (positions) in the string where each character is found. So for each letter, we're no longer returning just one number but rather multiple numbers (potentially) 

What would the resulting hash look like with the example string above?

Update your method so that it works this way now.

**Pro Tip:** While you could keep track of the index in a variable as you loop through each letter in the string with `Enumerable#each`, there is also `Enumerable#each_with_index` that can streamline this a little bit. 

