extends Node

var recipes = {
	# ==== Stove ====
	"spaghetti cooked": ["spaghetti raw"],
	"fried egg": ["egg (raw)", "oil"],
	"vege burger": ["bun", "sliced vege", "cheese", "sliced tomato", "mayonaise"],
	"beef burger": ["bun", "cheese", "sliced vege", "beef patty cooked", "mayonaise"],
	"chicken burger": ["bun", "cheese", "sliced vege", "chicken patty cooked", "mayonaise"],
	"lamb burger": ["bun", "cheese", "sliced vege", "lamb patty cooked", "mayonaise"],
	"chicken patty cooked": ["chicken patty raw", "oil"],
	"beef patty cooked": ["beef patty raw", "oil"],
	"lamb patty cooked": ["lamb patty raw", "oil"],
	"aglio olio": ["spaghetti cooked", "oil"],
	"carbonara": ["spaghetti cooked", "fried egg", "chicken cooked", "cheese"],
	"bolognese": ["spaghetti cooked", "tomato sauce", "beef cooked"],
	"beef cooked": ["beef raw"],
	"chicken cooked": ["chicken raw"],
	"lamb cooked": ["lamb raw"],
	"grilled beef steak": ["beef raw", "oil", "barbecue sauce", "sliced vege", "carrot (sliced)"],
	"grilled chicken steak": ["chicken raw", "oil", "barbecue sauce", "sliced vege", "carrot (sliced)"],
	"grilled lamb steak": ["lamb raw", "oil", "barbecue sauce", "sliced vege", "carrot (sliced)"],

	# ==== Sandwiches (Toaster) ====
	"egg mayo sandwich": ["fried egg", "mayonaise", "sliced vege", "sliced tomato", "cheese", "bread", "bread"],
	"chicken sandwich": ["chicken cooked", "sliced vege", "sliced tomato", "mayonaise", "cheese", "bread", "bread"],
	"lamb sandwich": ["lamb cooked", "sliced vege", "sliced tomato", "mayonaise", "cheese", "bread", "bread"],
	"beef sandwich": ["beef cooked", "sliced vege", "sliced tomato", "mayonaise", "cheese", "bread", "bread"],
	"vege sandwich": ["sliced vege", "sliced vege", "sliced tomato", "sliced tomato", "mayonaise", "bread", "bread"],

	# ==== Drinks (Fridge) ====
	"coke": ["coke"],
	"100plus": ["100plus"],
	"sprite": ["sprite"],
	"7up": ["7up"],

	# ==== Prep ingredients ====
	"sliced vege": ["vegetable"],
	"sliced tomato": ["tomato"],

	# ==== Sauces ====
	"mayonaise": ["mayonaise"],
	"tomato sauce": ["tsauce"],
	"barbecue sauce": ["bbqs"],

	# ==== Other ====
	"oil": ["oil"],
	"ice": ["ice"],
}
