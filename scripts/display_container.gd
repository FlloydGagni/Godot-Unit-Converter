extends MarginContainer

@onready var category_button: MenuButton = $VBoxContainer/HBoxContainer/MenuButton
@onready var value_a_button: MenuButton = $VBoxContainer/VBoxContainer2/HBoxContainer/MenuButton
@onready var value_b_button: MenuButton = $VBoxContainer/VBoxContainer3/HBoxContainer/MenuButton

@onready var category_label: Label = $VBoxContainer/HBoxContainer/Label
@onready var value_a_value_label: Label = $VBoxContainer/VBoxContainer2/Label
@onready var value_b_value_label: Label = $VBoxContainer/VBoxContainer3/Label
@onready var value_a_subcategory_label: Label = $VBoxContainer/VBoxContainer2/HBoxContainer/Label
@onready var value_b_subcategory_label: Label = $VBoxContainer/VBoxContainer3/HBoxContainer/Label

var category_popup
var value_a_popup
var value_b_popup

var category_list : Array[String] = [
	"Volume", "Length", "Weight and Mass", "Temperature",
	"Energy", "Area", "Speed", "Time", "Power", 
	"Data", "Pressure", "Angle"
]

var volume_subcategory : Array[String] = [
	"Milliliters", "Cubic centimeters", "Liters", "Cubic Meters",
	"Teaspoons (US)", "Tablespoons (US)", "Fluid ounces (US)", "Cups (US)",
	"Pints (US)", "Quarts (US)", "Gallons (US)", "Cubic inches",
	"Cubic feet", "Cubic yards", "Teaspoons (UK)", "Tablespoons (UK)", 
	"Fluid ounces (UK)", "Pints (UK)", "Quarts (UK)", "Gallons (UK)"
]
var length_subcategory : Array[String] = [
	"Nanometers", "Microns", "Millimeters", "Centimeters",
	"Meters", "Kilometers", "Inches", "Feet", "Yards",
	"Miles", "Nautical Miles"
]
var weight_and_mass_subcategory : Array[String] = [
	"Carats", "Milligrams", "Centigrams", "Decigrams",
	"Grams", "Dekagrams", "Hectograms", "Kilograms",
	"Metric tonnes", "Ounces", "Pounds", "Stone",
	"Short tons (US)", "Long tons (UK)"
]
var temperature_subcategory : Array[String] = [
	"Celsius", "Fahrenheit", "Kelvin"
]
var energy_subcategory : Array[String] = [
	"Electron volts", "Joules", "Kilojoules", "Thermal calories",
	"Food calories", "Foot-pounds", "British thermal units"
]
var area_subcategory : Array[String] = [
	"Square millimeters", "Square centimeters", "Square meters", "Hectares",
	"Square kilometers", "Square inches", "Square feet", "Square yards", "Acres"
]
var speed_subcategory : Array[String] = [
	"Centimeters per second", "Meters per second", "Kilometers per hour",
	"Feet per second", "Miles per hour", "Knots", "Mach"
]
var time_subcategory : Array[String] = [
	"Microseconds", "Milliseconds", "Seconds", "Minutes",
	"Hours", "Days", "Weeks", "Years"
]
var power_subcategory : Array[String] = [
	"Watts", "Kilowatts", "Horsepower (US)",
	"Foot-pounds/minute", "BTUs/minute"
]
var data_subcategory : Array[String] = [
	"Bits", "Bytes", "Kilobits", "Kibibits", "Kilobytes", "Kibibytes",
	"Megabits", "Mebibits", "Megabytes", "Mebibytes", 
	"Gigabits", "Gibibits", "Gigabytes", "Gibibytes",
	"Terabits", "Tebibits", "Terabytes", "Tebibytes",
	"Petabits", "Pebibits", "Petabytes", "Pebibytes",
	"Exabits", "Exbibits", "Exabytes", "Exbibytes",
	"Zetabits", "Zebibits", "Zetabytes", "Zebibytes",
	"Yottabit", "Yobibits", "Yottabyte", "Yobibytes",
]
var pressure_subcategory : Array[String] = [
	"Atmosphere", "Bars", "Kilopascals",
	"Millimeters of mercury", "Pascals", "Pounds per square inch"
]
var angle_subcategory : Array[String] = [
	"Degrees", "Radians", "Gradians"
]
var subcategory_list : Dictionary = {
	"Volume" : volume_subcategory,
	"Length" : length_subcategory, 
	"Weight and Mass" : weight_and_mass_subcategory, 
	"Temperature" : temperature_subcategory,
	"Energy" : energy_subcategory, 
	"Area" : area_subcategory, 
	"Speed" : speed_subcategory, 
	"Time" : time_subcategory, 
	"Power" : power_subcategory, 
	"Data" : data_subcategory, 
	"Pressure" : pressure_subcategory, 
	"Angle" : angle_subcategory 
}

func _ready() -> void:
	category_popup = category_button.get_popup()
	value_a_popup = value_a_button.get_popup() 
	value_b_popup = value_b_button.get_popup() 
	
	category_popup.id_pressed.connect(_on_category_changed)
	value_a_popup.id_pressed.connect(_on_value_a_subcategory_changed)
	value_b_popup.id_pressed.connect(_on_value_b_subcategory_changed)

func _on_category_changed(id : int) -> void :
	var category_selected = category_button.get_popup().get_item_text(id)
	
	category_label.text = category_selected
	
	value_a_popup.clear()
	value_b_popup.clear()
	value_a_subcategory_label.text = "Choose Unit"
	value_b_subcategory_label.text = "Choose Unit"
	
	for subcategory in subcategory_list.get(category_selected):
		value_a_popup.add_item(subcategory)
		value_b_popup.add_item(subcategory)

func _on_value_a_subcategory_changed(id : int) -> void :
	value_a_subcategory_label.text = value_a_button.get_popup().get_item_text(id)

func _on_value_b_subcategory_changed(id : int) -> void :
	value_b_subcategory_label.text = value_b_button.get_popup().get_item_text(id)
