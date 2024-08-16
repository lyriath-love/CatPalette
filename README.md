## CatPalette! 🎨 🐾

![Designer(2)](https://github.com/user-attachments/assets/5a6657d4-1457-4ade-bab1-faadd234494e)

**CatPalette** is a **Julia** library created for customize prints texts, changing their color and type in different ways, it's very simple and easy to use, here are examples: 

---
## Examples:

```Julia
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
```Julia
using CatPalette

# In this function goes 1 arguments: 
# The text (String) 

print!underline("UNDERLINED") # It prints the text given as an argument underlined

# In this function doesn't go any arguments:

underline!() # Changues the print type to the selected type
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
