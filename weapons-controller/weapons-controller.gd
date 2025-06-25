extends Node2D


@export var weapons_node_path: NodePath


var weapons: Node2D


func _ready():
	if weapons_node_path != NodePath(""):
		weapons = get_node(weapons_node_path)

func _process(_delta):
	for child in weapons.get_children():
		var filtered = Player.weapons.filter(func(weapon): return weapon == child.name)
		if filtered.size() > 0:
			var weapon_info = filtered[0]
			if weapon_info and child.visible == false:
				child.visible = true
