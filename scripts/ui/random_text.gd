extends RichTextLabel

@export_multiline var text_options: Array[String] = [
	"Parece que você não é uma lenda da [color=red]QUEIMADA ABSOLUTA[/color]..."
]

func _ready():
	text = text_options[randi() % text_options.size()]
	
