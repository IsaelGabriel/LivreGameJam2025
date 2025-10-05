extends Node
var _item_paths = [
	"uid://capxhu1j0eqrc",
	"uid://dkrejbms3nh4r",
	"uid://c84dw3nj168ew",
	"uid://bbmivx7w4uwp6"
]

var items: Dictionary[StringName, ItemResource] = {}

func _ready():
	for path in _item_paths:
		var item: ItemResource = load(path)
		items[item.item_name] = item
