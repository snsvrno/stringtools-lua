# String Tools
A lua library designed to make working with strings easier.

## Usage
Either get the source and build it with lmake, install it using lmake, or manually download the [Latest Release](https://github.com/snsvrno/stringtools-lua/releases/latest). Look at [Lmake](https://github.com/snsvrno/lmake-rs) for more information how to build.

Once in your project, just 'require' like you would any other source file.

```lua
ST = require 'path.to.stringtools'
``` 

String tools requires it be assigned to a variable so you can access it globally. If you would rather import all the functions into the string's metatable you can use the `addToMetatable()` function on import.

```lua
require('path.to.stringtools'):addToMetatable()
```

## Helper Functions

### `.addToMetatable(self)`
Function to import all the functions into the string metatable. Call it using the `:` notation.

```lua
require('path.to.stringtools'):addToMetatable()
```

## String Functions

### `.split(string,delim)`
Splits a string by a certian delim. Can be any length.

***Inputs***
- **`string`** : *String* - the string to split
- **`delim`** : *String* - delim to use for splitting, can be any length

***Outputs***
- **`return`** : *Table<String>* - a table with the split sections

### `.splitMutliple(string,delims)`
Splits a string by an array (table) of delims. Each element of the array can be any length.

***Inputs***
- **`string`** : *String* - the string to split
- **`delim`** : *String* - array of delims to use for splitting, each element can be any length

***Outputs***
- **`return`** : *Table<String>* - a table with the split sections

### `.remove(string,characters)`
Removes all instances of the characters from the string

***Inputs***
- **`string`** : *String* - the string to split
- **`characters`** : *String* - the character(s) to remove, can be any length and removed as a set.

***Output***
- **`returns`** : *String* - the resulting string with the character(s) removed.

### `.removeLeading(string,characters)`
Removes all the leading instances of the character(s), will stop after it doesn't match anymore characters.

***Inputs***
- **`string`** : *String* - the string to split
- **`characters`** : *String* - the character(s) to remove, can be any length and removed as a set.

***Output***
- **`returns`** : *String* - the resulting string with the character(s) removed.

## Development Tools

- luacov
- luacov-coveralls
- luacheck
- busted
