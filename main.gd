extends Node2D

onready var rocket_timing = $rocket.get_node("timing")
onready var hyperdrive = $rocket.get_node("rocket_capsule/hyperdrive")

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		rocket_timing.play("timing")
		$rocket_launch.play("launch")
		yield($rocket_launch, "animation_finished")
		$stars.play("slow_stars")
		$rocket_launch.queue("planet")
		yield($rocket_launch, "animation_finished")
		rocket_timing.play("rocket_body")
		yield(rocket_timing, "animation_finished")
		$slow_stars.visible = false
		$fast_stars.visible = true
		hyperdrive.visible = true
		
