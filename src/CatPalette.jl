module CatPalette

	using JSON # JSON LIB.

	# This struct organize
	# the colors correctly
	# from Black to White.

	struct Colors
		Black::String
		Red::String
		Green::String
		Yellow::String
		Blue::String
		Magenta::String
		Cyan::String
		White::String
	end

	struct Especials
		Default::String
		Reset::String
		Strikethrough::String
		Inverse::String
		Underline::String
		StrongUnderline::String
		Bold::String
		RGB::String
	end

	# JSONR (JSON Read) Reads the data of a JSON file.

	function JSONR(F::String)
		return JSON.parsefile(F)
	end
	
	JSONF = joinpath(@__DIR__, "Colors.json") # JSONF (JSON file)
	JSOND = JSONR(JSONF) # JSOND (JSON Data) JSON file data
	
	# Next, we have the "Panel Control" Where are to color data
	# is saved in diferent structures such as: NCL, NBCL, BCL
	# BBCL and ESPL

	NCL = Colors(
				JSOND["colors"]["TXT"]["8_16C"]["Black"],
				JSOND["colors"]["TXT"]["8_16C"]["Red"],
				JSOND["colors"]["TXT"]["8_16C"]["Green"],
				JSOND["colors"]["TXT"]["8_16C"]["Yellow"],
				JSOND["colors"]["TXT"]["8_16C"]["Blue"],
				JSOND["colors"]["TXT"]["8_16C"]["Magenta"],
				JSOND["colors"]["TXT"]["8_16C"]["Cyan"],
				JSOND["colors"]["TXT"]["8_16C"]["White"],
				) # NCL (Normal Color List)	
	
	NBCL = Colors(
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Black"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Red"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Green"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Yellow"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Blue"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Magenta"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Cyan"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_White"],
				) # NBCL (Normal Background Color list)
	
	BCL = Colors(
				JSOND["colors"]["TXT"]["8_16C"]["Bright_Black"],
				JSOND["colors"]["TXT"]["8_16C"]["Bright_Red"],
				JSOND["colors"]["TXT"]["8_16C"]["Bright_Green"],
				JSOND["colors"]["TXT"]["8_16C"]["Bright_Yellow"],
				JSOND["colors"]["TXT"]["8_16C"]["Bright_Blue"],
				JSOND["colors"]["TXT"]["8_16C"]["Bright_Magenta"],
				JSOND["colors"]["TXT"]["8_16C"]["Bright_Cyan"],
				JSOND["colors"]["TXT"]["8_16C"]["Bright_White"],
				) # BCL (Bright Color List)	
	
	BBCL = Colors(
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Black"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Red"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Green"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Yellow"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Blue"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Magenta"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_Cyan"],
				JSOND["colors"]["BKG"]["8_16C"]["Bright_White"],
				) # BBCL (Bright Background Color list)

	ESPL = Especials(
				JSOND["ESP"]["Default"],
				JSOND["ESP"]["Reset"],
				JSOND["ESP"]["Strikethrough"],
				JSOND["ESP"]["Inverse"],
				JSOND["ESP"]["Underline"],
				JSOND["ESP"]["StrongUnderline"],
				JSOND["ESP"]["Bold"],
				JSOND["ESP"]["RGB"]
				) # ESPL (Especials List)

	# Color prints are divided by "Main" Functions and sub-main functions
	# these are for print a text given as an argument and for set a main
	# print color, main functions and sub-main functions are called 
	# "color-model" so, every color print function is divided and
	# enumerated.
	
	# ERRMSG$ (Error Message (Number)) These are the error messages. Changue it if you want.

	ERRMSG1(ARGUMENT::Any, LINE::Any) = return "[    ERR    ] CatPalet ERROR. Argument two (' $ARGUMENT ') in function call: Wrong or not given. Argument two has to be 'TXT' (For text) Or 'BKG' (For background). Line: $LINE"	

	ERRMSG2(ARGUMENT::Any, LINE::Any) = return "[    ERR    ] CatPalet ERROR. Argument three (' $ARGUMENT ') in function call: Wrong or not given. Argument three has to be 'true' (bool value), (For bright text) Or 'false' (bool value), (For normal text). Line: $LINE"	

	# Modules Functions Exports
	
	export print!black
	export print!red
	export print!green
	export print!yellow
	export print!blue
	export print!magenta
	export print!cyan
	export print!white

	export black!
	export red!
	export green!
	export yellow!
	export blue!
	export magenta!
	export cyan!
	export white!

	export print!default
	export print!reset
	export print!st
	export print!inverse
	export print!underline
	export print!su
	export print!bold
	export print!RGB

	export default!
	export reset!
	export st!
	export inverse!
	export underline!
	export su!
	export bold!
	export RGB!
	
	# There are basic modules, they got 8-16 colors with a TEXT given as an
	# argument.

	function print!black(TEXT::String, TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Black * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(NCL.Black * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Black * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(BCL.Black * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°1 (Black color) (Text argument only)

	function print!red(TEXT::String, TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Red * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(NCL.Red * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Red * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(BCL.Red * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°2 (Red color) (Text argument only)

	function print!green(TEXT::String, TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Green * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(NCL.Green * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Green * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(BCL.Green * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°3 (Green color) (Text argument only)

	function print!yellow(TEXT::String, TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Yellow * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(NCL.Yellow * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Yellow * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(BCL.Yellow * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°4 (Yellow color) (Text argument only)

	function print!blue(TEXT::String, TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Blue * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(NCL.Blue * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Blue * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(BCL.Blue * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°5 (Blue color) (Text argument only)

	function print!magenta(TEXT::String, TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Magenta * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(NCL.Magenta * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Magenta * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(BCL.Magenta * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°6 (Magenta color) (Text argument only)

	function print!cyan(TEXT::String, TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Cyan * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(NCL.Cyan * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Cyan * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(BCL.Cyan * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°7 (Cyan color) (Text argument only)

	function print!white(TEXT::String, TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.White * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(NCL.White * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.White * TEXT * ESPL.Reset)
			elseif BRIGHT == false
				println(BCL.White * TEXT * ESPL.Reset)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°8 (White color) (Text argument only)
	
	# These basic modules, are 8-16 colors, and they change the 
	# main color of a print function.
	
	function black!(TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Black)
			elseif BRIGHT == false
				println(NCL.Black)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Black)
			elseif BRIGHT == false
				println(BCL.Black)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°9 (Black color) (Main print color change)

	function red!(TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Red)
			elseif BRIGHT == false
				println(NCL.Red)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Red)
			elseif BRIGHT == false
				println(BCL.Red)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°10 (Red color) (Main print color change)

	function green!(TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Green)
			elseif BRIGHT == false
				println(NCL.Green)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Green)
			elseif BRIGHT == false
				println(BCL.Green)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°11 (Green color) (Main print color change)

	function yellow!(TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Yellow)
			elseif BRIGHT == false
				println(NCL.Yellow)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Yellow)
			elseif BRIGHT == false
				println(BCL.Yellow)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°12 (Yellow color) (Main print color change)

	function blue!(TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Blue)
			elseif BRIGHT == false
				println(NCL.Blue)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Blue)
			elseif BRIGHT == false
				println(BCL.Blue)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°13 (Blue color) (Main print color change)

	function magenta!(TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Magenta)
			elseif BRIGHT == false
				println(NCL.Magenta)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Magenta)
			elseif BRIGHT == false
				println(BCL.Magenta)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°14 (Magenta color) (Main print color change)

	function cyan!(TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.Cyan)
			elseif BRIGHT == false
				println(NCL.Cyan)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.Cyan)
			elseif BRIGHT == false
				println(BCL.Cyan)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°15 (Cyan color) (Main print color change)

	function white!(TYPE::String, BRIGHT::Bool)
		if TYPE == "TEXT"
			if BRIGHT == true
				println(BCL.White)
			elseif BRIGHT == false
				println(NCL.White)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		elseif TYPE == "BACKGROUND"
			if BRIGHT == true
				println(BBCL.White)
			elseif BRIGHT == false
				println(BCL.White)
			else
				error(ERRMSG2(BRIGHT, @__LINE__))
			end
		else
			error(ERRMSG1(TYPE, @__LINE__))
		end
	end # Color-model N°16 (White color) (Main print color change)

	# These modules, contain the ESPECIAL types of prints, these supports
	# only a given text as an argument.
	
	function print!default(TEXT::String)
		println(ESPL.Default * TEXT * ESPL.Reset)
	end # Color-model N°17 (Especial: Default) (Text argument only)

	function print!reset(TEXT::String)
		println(ESPL.Reset * TEXT * ESPL.Reset)
	end # Color-model N°18 (Especial: Reset) (Text argument only)

	function print!st(TEXT::String)
		println(ESPL.Strikethrough * TEXT * ESPL.Reset)
	end # Color-model N°19 (Especial: Strikethrough) (Text argument only)

	function print!inverse(TEXT::String)
		println(ESPL.Inverse * TEXT * ESPL.Reset)
	end # Color-model N°20 (Especial: Inverse) (Text argument only)

	function print!underline(TEXT::String)
		println(ESPL.Underline * TEXT * ESPL.Reset)
	end # Color-model N°21 (Especial: Underline) (Text argument only)

	function print!su(TEXT::String)
		println(ESPL.StrongUnderline * TEXT * ESPL.Reset)
	end # Color-model N°22 (Especial: StrongStrikethrough) (Text argument only)

	function print!bold(TEXT::String)
		println(ESPL.Bold * TEXT * ESPL.Reset)
	end # Color-model N°23 (Especial: Bold) (Text argument only)

	function print!RGB(TEXT::String, R::Int, G::Int, B::Int)
		println(ESPL.RGB * ";$R;$G;$B" * "m" * TEXT * ESPL.Reset)
	end # Color-model N°24 (Especial: RGB) (Text argument only)

	# These modules are ESPECIAL types of prints, these changes the type
	# of the prints
	
	function default!()
		println(ESPL.Default)
	end # Color-model N°25 (Especial: Default) (Changes print type)

	function reset!()
		println(ESPL.Reset)
	end # Color-model N°26 (Especial: Reset) (Changes print type)

	function st!()
		println(ESPL.Strikethrough)
	end # Color-model N°27 (Especial: Strikethrough) (Changes print type)

	function inverse!()
		println(ESPL.Inverse)
	end # Color-model N°28 (Especial: Inverse) (Changes print type)

	function underline!()
		println(ESPL.Underline)
	end # Color-model N°29 (Especial: Underline) (Changes print type)

	function su!()
		println(ESPL.StrongUnderline)
	end # Color-model N°30 (Especial: StrongStrikethrough) (Changes print type)

	function bold!()
		println(ESPL.Bold)
	end # Color-model N°31 (Especial: Bold) (Changes print type)

	function RGB!(R::Int, G::Int, B::Int)
		println(ESPL.RGB * ";$R;$G;$B" * "m")
	end # Color-model N°32 (Especial: RGB) (Changes print type)

end
