extends Node2D

func _ready():
	get_node("CouchNode1/CollisionShape2D").disabled = false
	get_node("CouchNode2/CollisionShape2D").disabled = false
