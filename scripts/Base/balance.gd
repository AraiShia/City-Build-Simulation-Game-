extends RichTextLabel

func _physics_process(delta: float) -> void:
	self.text = "财政："+str(EconomySystem.balance)
