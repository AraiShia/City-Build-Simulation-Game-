extends CanvasLayer

@export var InComeIndex:RichTextLabel
@export var OutComeIndex:RichTextLabel
@export var LoanIndex:RichTextLabel
@export var ResidenMoodIndex:ProgressBar
@export var ResidentialsIndex:RichTextLabel
@export var LoanSlider:HSlider
@export var LoanButton:Button
@export var ResourcesWaterIndex:ProgressBar
@export var ResourcesPowerIndex:ProgressBar
@export var ResourcesFoodIndex:ProgressBar
var rm:Resources_Manager

func _ready() -> void:
	LoanButton.pressed.connect(_on_LoanButton_Click)
	ResidenMoodIndex.max_value=100
	ResidenMoodIndex.min_value=0
	ResidenMoodIndex.value=HouseholdBehaviorSystem.PopMood
	ResourcesWaterIndex.min_value = -100
	ResourcesPowerIndex.min_value = -100
	ResourcesFoodIndex.min_value = -100
func _process(delta: float) -> void:
	ResidenMoodIndex.value=HouseholdBehaviorSystem.PopMood
	LoanIndex.text= str(LoanSlider.value)
	LoanSlider.max_value=EconomySystem.LoanUp
	ResidentialsIndex.text=str(HouseholdBehaviorSystem.Population)
	ResourcesPowerIndex.value=ResourceBuyerSystem.PowerResource
	ResourcesWaterIndex.value=ResourceBuyerSystem.WaterResource
	ResourcesFoodIndex.value=ResourceBuyerSystem.FoodResource
	InComeIndex.text=str(EconomySystem.income)
	OutComeIndex.text=str(EconomySystem.outcome)
func _on_LoanButton_Click():
	EconomySystem.balance+=LoanSlider.value
	LoanSlider.max_value=EconomySystem.LoanUp-LoanSlider.value
	EconomySystem.LoanUp=LoanSlider.max_value
	
