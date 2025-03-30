extends Area2D


@onready var health: ProgressBar = $healthBar


func _on_body_entered(body: Node2D) -> void:
	health.takeDamage()
