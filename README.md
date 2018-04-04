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
require('path.to'stringtools'):addToMetatable()
```

## Helper Functions

### .addToMetatable(self)
Function to import all the functions into the string metatable.

## String Functions

### .split(string,delim)

### .splitMutliple(string,delims)

### .remove(string,characters)

### .removeLeading(string,characters)
Removes all the leading instances of the character(s), will stop after it doesn't match anymore characters.

**string** : *String* - the string to split
**characters** : *String* - the characters to remove, can be any length and removed as a set.

**returns** : *String* - the resulting string with the character(s) removed.