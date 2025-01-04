extends ScrollContainer

const HIGHTS = [2160, 1080, 720, 480, 360, 240, 144]
const WIDTHS = [3840, 1920, 1280, 640, 480, 426, 256]

@onready var resolution_slider = $"VBoxContainer/Resolution/Resolution Slider"
@onready var fps_slider = $"VBoxContainer/Frame Rate/FPS Slider"
@onready var viewport = get_tree().root

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		
		

func _on_resolution_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		viewport.scaling_3d_scale = resolution_slider.value


func _on_v_sync_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)


func _on_fps_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		Engine.max_fps = fps_slider.value
