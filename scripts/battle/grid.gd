extends Node3D

# 导出变量
@export var row: int
@export var column: int

# 内部变量
var is_occupied_unit = null

enum Team {
	ALLY,
	ENEMY
}

var team: Team

# 是否有单位
func is_occupied() -> bool:
	return is_occupied_unit != null


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
