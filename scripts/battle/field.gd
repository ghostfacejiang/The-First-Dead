extends Node3D

const GRID_SCENE = preload("res://scenes/battle/grid.tscn")

var grids = []

func _ready() -> void:
	create_grids()

# 创建格子
func create_grids() -> void:
	for row in range(4):
		for col in range(3):
			var grid = GRID_SCENE.instantiate()

			add_child(grid)

			var z = 0

			if row < 2:
				z = row * 2
				grid.team = grid.Team.ALLY
			else:
				z = row * 2 + 3
				grid.team = grid.Team.ENEMY
			
			grid.position = Vector3(col * 2, 0, z)

			grid.row = row
			grid.column = col

			grids.append(grid)

# 获取空格子
func get_empty_grids(team):
	var result = []
	for grid in grids:
		if grid.team == team and not grid.is_occupied():
			result.append(grid)
	return result

func _process(delta: float) -> void:
	pass
