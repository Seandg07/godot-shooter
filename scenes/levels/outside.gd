extends LevelParent



func _on_gate_gate_entered():
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,0.5) # Replace with function body.
	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")
