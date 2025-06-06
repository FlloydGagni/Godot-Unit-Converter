extends MarginContainer

@onready var category_button: MenuButton = $VBoxContainer/HBoxContainer/MenuButton
@onready var value_a_button: MenuButton = $VBoxContainer/VBoxContainer2/MenuButton
@onready var value_b_button: MenuButton = $VBoxContainer/VBoxContainer3/MenuButton

@onready var category_label: Label = $VBoxContainer/HBoxContainer/Label
@onready var value_a_label: Label = $VBoxContainer/VBoxContainer2/Label
@onready var value_b_label: Label = $VBoxContainer/VBoxContainer3/Label

var category_popup
var value_a_popup
var value_b_popup

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


func _ready() -> void:
	category_popup = category_button.get_popup()
	value_a_popup = value_a_button.get_popup() 
	value_b_popup = value_b_button.get_popup() 
	
	category_popup.id_pressed.connect(_on_category_changed)

func _on_category_changed(id : int) -> void :
	match  category_button.get_popup().get_item_text(id):
		"Volume":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in volume_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Length":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in length_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Weight and Mass":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in weight_and_mass_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Temperature":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in temperature_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Energy":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in energy_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Area":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in area_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Speed":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in speed_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Time":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in time_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Power":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in power_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Data":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in data_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Pressure":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in pressure_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
			
		"Angle":
			value_a_popup.clear()
			value_b_popup.clear()
			
			for subcategory in angle_subcategory:
				value_a_popup.add_item( subcategory )
				value_b_popup.add_item( subcategory )
