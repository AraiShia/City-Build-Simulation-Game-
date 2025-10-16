extends Node

var tax:int
var balance:int
var net_income:int = income-outcome+tax-service_maintain_cost
var income:int =Merchange+tax
var outcome:int
var service_maintain_cost:int
var LoanUp:int
var Merchange:int

func _ready() -> void:
	balance = 1000000
	LoanUp = 1000000

	


func _balance_count():
	balance+=net_income
