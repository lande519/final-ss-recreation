if other.state = States.grabdash{
	global.rocketLauncher = true
	instance_destroy()
	other.state = States.normal
}