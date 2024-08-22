## CatPalette! 🎨 🐾

![CatPalette-Logo](https://github.com/user-attachments/assets/72ff742f-5ac0-4790-a89c-f2101b4fa063)
---
**CatPalette** is a **Julia** library created for customize prints texts, changing their color and type in different ways, it's very simple and easy to use, here are examples: 

---
## Examples:

```julia
using CatPalette

# In this function goes 3 arguments: 
# The text (String) 
# Text Type or Background type ("TEXT", "BACKGROUND") (String)
# Highlighted text (true, false) (bool)

print!red("Red is beautiful!", "TEXT", true) # It prints in the selected color the text given as an argument

# In this function goes 2 arguments: 
# Text Type or Background type ("TEXT", "BACKGROUND") (String)
# Highlighted text (true, false) (bool)

red!("TEXT", true) # Changues the main color print to the selected color
``` 

---
```julia
using CatPalette

# In this function goes 1 argument: 
# The text (String) 

print!underline("UNDERLINED") # It prints the text given as an argument underlined

# In this function doesn't go any arguments:

underline!() # Changues the print type to the selected type
``` 
---
```julia
using CatPalette

# Or, if you want print something with a different color or
# type, you can use the "cv" (color-variables) 
# in the default julia print function.

println("$NT_red This is red! $NT_blue and this is blue!")

# To change the type (background or text) you need to change
# the second letter of the cv.

println("$NT_red This changes the text color to red!")
println("$NB_red This changes the background color to red!")

# To change highlighted and no highlighted text you need to
# chnge the first letter of the cv.

println("$BT_red This changes the text highligth to true!")
println("$NT_red This changes the text highligth to false!")
```
---
```julia
print!red("Red. Like blood.", "TEXT", false)
print!cyan("Cyan. Like diamonds", "BACKGROUND", true)

black!("TEXT", false)
println("The $NT_white light $NT_black is in the night to.")
```
---
## Colors/Types:

There are types and colors that library has, and they are:

🖤 Black! (Color)
❤️ Red! (Color)
💚 Green! (Color)
💛 Yellow! (Color)
💙 Blue! (Color)
💜 Magenta! (Color)
🩵 Cyan! (Color)
🤍 White! (Color)

---

DEFAULT (Default text type in your terminal)
RESET (Type and color reset)
~~STRIKETHROUGH~~ (Strike through text type)
INVERSE (Inverts the current color of the background and text in terminal)
UNDERLINE (Underlines your text terminal)
STRONGUNDERLINE (su) (Underlines your text terminal)
__BOLD__ (Changes your text terminal type, to bold type)
RGB (Red, green, blue, 256 color palette) (Changes your text terminal color)

----
