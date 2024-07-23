extends StaticBody2D

signal gate_entered

func _on_area_2d_body_entered(_body):
	gate_entered.emit()
	
