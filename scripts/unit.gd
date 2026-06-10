extends CharacterBody3D

# 导出变量
@export var hp: int = 100
@export var attack_power: int = 10
@export var attack_interval: float = 1.0

# 内部变量
var max_hp: int
var is_alive: bool = true

# UI元素
@onready var hp_label: Label3D = $HPLabel
@onready var mesh_instance: MeshInstance3D = $MeshInstance3D

func _ready() -> void:
	max_hp = hp
	update_display()

func _physics_process(delta: float) -> void:
	pass

# 受伤
func take_damage(amount: int) -> void:
	if not is_alive:
		return
	
	hp -= amount

	if hp <= 0:
		die()
	
	update_display()

# 死亡
func die() -> void:
	is_alive = false
	queue_free()

# 更新显示
func update_display() -> void:
	if hp_label:
		hp_label.text = str(hp) + " / " + str(max_hp)


# 攻击目标
func attack_target(target: Unit):
	if target and target.is_alive:
		target.take_damage(attack_power)