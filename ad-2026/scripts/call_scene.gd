extends Node2D

@onready var character = %character
@onready var dialogue_ui = %dialogue_ui

const dialogue_lines : Array[String] = [
	"Character 1: Hi! I'm Character 1! Nice to meet you miss!",
	"Character 2: Likewise, I'm Character 2. Let's get to work now, shall we?",
	"Character 1: Yes, miss Character 2!",
	"Character 2: Please, just Character2."
]


func _ready():
	# process first line of dialogue
	process_line(parse_line(dialogue_lines[0]))


func parse_line(line: String):
	var line_info = line.split(":")
	assert(len(line_info) >= 2)
	return {
		"speakername": line_info[0],
		"dialogueline": line_info[1]
	}
	
func process_line(line_info: Dictionary):
	dialogue_ui.speakername.text = line_info["speakername"]
	dialogue_ui.dialogueline.text = line_info["dialogueline"]
