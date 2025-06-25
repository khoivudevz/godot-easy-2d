extends Node2D


@export var shadow_path: NodePath
@export var shadow_position: Vector2 = Vector2(0, -110)
@export var shadow_scale: Vector2 = Vector2(1.2, 0.5)

var shadow: Sprite2D


func _ready():
	if shadow_path != NodePath(""):
		shadow = get_node(shadow_path)
		shadow.position = shadow_position
		shadow.scale = shadow_scale

func update_shadow(character_animation: AnimationPlayer):
	if character_animation and shadow:
		var anim = character_animation.animation
		var frame = character_animation.frame
		var frames = character_animation.sprite_frames
		if frames and frames.has_animation(anim):
			shadow.texture = frames.get_frame_texture(anim, frame)
