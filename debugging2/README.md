## Introduction

One of the first questions a good programmer will ask themselves when they encounter a bug is "what is the error message telling me?". Error messages are your friend, not your enemy. 

## Stack Traces

Before you start, take a look at and run `error_example.rb`. The output from running the program is this:

    error_example.rb:9:in `method3': wrong number of arguments (0 for 1) (ArgumentError)
    	from error_example.rb:6:in `method2'
    	from error_example.rb:2:in `method1'
    	from error_example.rb:13:in `<main>'

This is an error message accompanied by a stack trace. You see it when an error occurs which causes your program to terminate (aka: "crap out"). Think of stack traces like BREADCRUMB trails. They help us debug the problem by tracing backwards from the line number where the error occurred. 

In the stack trace above, we see in the first line that the error occurred on line 9 of `error_example.rb`. That's evident based on the `:9`. It's very important to properly read and understand the error. This particular one is a `ArgumentError` (type) with a detail message saying "wrong number of arguments (0 for 1)". Arguments are inputs into methods, so an incorrect number of inputs are being passed into some method, and it seems to be happening at line 9, apparently. 

But wait, line 9 is where `method3` is defined, not called... Is that where the problem with this code lies? To see how it got to line 9, we look at the next line in the stacktrace. Turns out that line 6 (in `method2`) was the previous line of code to execute before the ruby interpreter jumped to line 9. This is where our program attempts to call (invoke) `method3`. 

Note how the actual error was really not on the very top line of the stack trace, this is common and something to be aware of when reading stack traces.

In ruby, and other languages, they are also often referred to as "Backtraces" 

## Debug `debug01.rb`, `debug02.rb`, `debug03.rb` and `debug04.rb`

The `debug01.rb`, `debug02.rb`, `debug03.rb` and `debug04.rb` files contains some bugs. Your task is to figure out what the error are and then update the code to remove the bugs. In order to do this, you will have to read the error message that Ruby returns.

_**Hint:** Read the error message and also look at the "stack trace" top down to trace the error back to its relevant source._


### Debugging `TypeError`

At a certain point in debugging the code above, you will encounter a TypeError that will need to be fixed.

Ruby is a [dynamically and strongly typed programming language](http://www.rubyfleebie.com/ruby-is-dynamically-and-strongly-typed/), which means that you do not have to define the type of a variable when you assign it.

Sometimes, though, the objects our program receives are of a different type than the ones we expected it to receive. Since Ruby is a strongly typed language, it doesn't just guess what to do, it instead throws a `TypeError` at that point. This error is not uncommon and is generally easy to resolve. So you might as well get used to debugging it now :)

