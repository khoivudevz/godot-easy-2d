extends Node2D

@export var step_ray_path: NodePath
@export var footsteps_audio_path: NodePath
@export var debounce_time := 0.12
@export var surface_to_audio_path := {}

var step_ray: RayCast2D
var footsteps: AudioStreamPlayer
var last_step_time := -100.0

func _ready():
	if step_ray_path != NodePath(""):
		step_ray = get_node(step_ray_path)
	if footsteps_audio_path != NodePath(""):
		footsteps = get_node(footsteps_audio_path)

func step():
	var now = Time.get_ticks_msec() / 3500.0
	if now - last_step_time < debounce_time:
		return
	last_step_time = now
	if not step_ray or not step_ray.is_colliding():
		return
	var collider = step_ray.get_collider()
	if collider == null or not collider is TileMapLayer:
		return
	var tilemap: TileMapLayer = collider
	var collision_point = step_ray.get_collision_point()
	var cell = tilemap.local_to_map(tilemap.to_local(collision_point))
	var tile_data = tilemap.get_cell_tile_data(cell)
	if tile_data == null:
		return
	var surface = tile_data.get_custom_data("surface")
	var audio_path = surface_to_audio_path.get(surface, "")
	if audio_path != "":
		if footsteps.stream == null or footsteps.stream.resource_path != audio_path:
			footsteps.stream = load(audio_path)
		# Randomize pitch for variation
		footsteps.pitch_scale = randf_range(0.75, 1.05)
		if not footsteps.playing:
			footsteps.play()
