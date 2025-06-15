extends Node

var recipes = {
	# ==== Stove ====
	"spaghetti cooked": ["spaghetti (raw)"],
	"fried egg": ["egg (raw)", "oil"],
	"vege burger": ["bun", "vegetable (peeled)", "cheese", "tomato (sliced)", "mayonaise"],
	"beef burger": ["bun", "cheese", "vegetable (peeled)", "beef patty (grilled)", "mayonaise"],
	"chicken burger": ["bun", "cheese", "vegetable (peeled)", "chicken patty (grilled)", "mayonaise"],
	"lamb burger": ["bun", "cheese", "vegetable (peeled)", "lamb patty (grilled)", "mayonaise"],
	"chicken patty (grilled)": ["chicken patty (raw)", "oil"],
	"beef patty (grilled)": ["beef patty (raw)", "oil"],
	"lamb patty (grilled)": ["lamb patty (raw)", "oil"],
	"aglio olio": ["spaghetti cooked", "oil"],
	"carbonara": ["spaghetti cooked", "fried egg", "chicken (grilled)", "cheese"],
	"bolognese": ["spaghetti cooked", "tomato sauce", "beef (grilled)"],
	"beef (grilled)": ["beef (raw)"],
	"chicken (grilled)": ["chicken (raw)"],
	"lamb (grilled)": ["lamb (raw)"],
	"grilled beef steak": ["beef (raw)", "oil", "Barbecue Sauce", "vegetable (peeled)", "carrot (sliced)"],
	"grilled chicken steak": ["chicken (raw)", "oil", "Barbecue Sauce", "vegetable (peeled)", "carrot (sliced)"],
	"grilled lamb steak": ["lamb (raw)", "oil", "Barbecue Sauce", "vegetable (peeled)", "carrot (sliced)"],

	# ==== Toaster ====
	"egg mayo sandwich": ["fried egg", "mayonaise", "vegetable (peeled)", "tomato (sliced)", "cheese", "bread", "bread"],
	"chicken sandwich": ["chicken (grilled)", "vegetable (peeled)", "tomato (sliced)", "mayonaise", "cheese", "bread", "bread"],
	"lamb sandwich": ["lamb (grilled)", "vegetable (peeled)", "tomato (sliced)", "mayonaise", "cheese", "bread", "bread"],
	"beef sandwich": ["beef (grilled)", "vegetable (peeled)", "tomato (sliced)", "mayonaise", "cheese", "bread", "bread"],
	"vege sandwich": ["vegetable (peeled)", "vegetable (peeled)", "tomato (sliced)", "tomato (sliced)", "mayonaise", "bread", "bread"],

	# ==== Drinks (Fridge) ====
	"coke": ["coke"],
	"100plus": ["100plus"],
	"sprite": ["sprite"],
	"7up": ["7up"],
	"cold water": ["cold water"],  # Only add if you intend to use/serve this!e

	# ==== Prep ingredients ====
	"vegetable (peeled)": ["vegetable"],
	"tomato (sliced)": ["tomato"],
	"carrot (sliced)": ["carrot"],

	# ==== Sauces ====
	"mayonaise": ["mayonaise"],
	"tomato sauce": ["tomato sauce"],
	"Barbecue Sauce": ["Barbecue Sauce"],

	# ==== Other ====
	"oil": ["oil"],
	"ice": ["ice"],  # You can craft/obtain ice directly
}
