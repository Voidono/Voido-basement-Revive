extends Node2D

func _process(delta):
	if Global.found_quest_item == true:
		$QuestItem.visible = false
