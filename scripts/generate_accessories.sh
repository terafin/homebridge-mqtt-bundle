#!/usr/bin/ruby
require 'csv'

# Need
## 2 Thermostats, 2 sensors each
## 2 Garage Door Openers
## 2 Door Locks
## 20 lights
# 5 Cameras
# 3 Homepods 2 Apple TVs
## 4 Sensors
## 5 Pop Switches
## 10 Smart Plugs
## 1 TV


# switch,topic,Test Switch 1

        # {
        #     "accessory": "mqttthing",
        #     "type": "switch",
        #     "name": "Test Switch 1",
        #     "url": "mqtt://localhost",
        #     "topics": {
        #         "getOn": "/switch/test",
        #         "setOn": "/switch/test/set"
        #     },
        #     "integerValue": "true"
        # }

inputPath = ARGV[0]


puts "# ======================================================================================="
puts "# Auto Generated Accessories for config.json"
puts "#   => Copy this into homebridge/config.json in the accessories: [] section and restart"
puts "# ======================================================================================"
puts ""

is_first = true

File.open(inputPath, "r").each_line do |line|
    csv = CSV.parse_line(line)

    device_type = csv[0]
    device_topic = csv[1]
    device_name = csv[2]
    
    if is_first then
        is_first = false
        puts '{'
    else
        puts ','
        puts '{'
    end


    case  device_type
        when 'switch'       
            puts '     "accessory": "mqttthing",'
            puts '     "type": "switch",'
            puts '     "name": "' + device_name + '",'
            puts '     "url": "mqtt://localhost",'
            puts '     "topics": {'
            puts '         "getOn": "' + device_topic + '",'
            puts '         "setOn": "' + device_topic + '/set"'
            puts '    },'
            puts '     "integerValue": "true"'
        when 'outlet'       
            puts '     "accessory": "mqttthing",'
            puts '     "type": "outlet",'
            puts '     "name": "' + device_name + '",'
            puts '     "url": "mqtt://localhost",'
            puts '     "topics": {'
            puts '         "getOn": "' + device_topic + '",'
            puts '         "setOn": "' + device_topic + '/set"'
            puts '    },'
            puts '     "integerValue": "true"'
        when 'button'       
            puts '     "accessory": "mqttthing",'
            puts '     "type": "statelessProgrammableSwitch",'
            puts '     "name": "' + device_name + '",'
            puts '     "url": "mqtt://localhost",'
            puts '     "topics": {'
            puts '         "getSwitch": "' + device_topic + '"'
            puts '    },'
            puts '     "integerValue": "true"'
        when 'light'       
            puts '     "accessory": "mqttthing",'
            puts '     "type": "lightbulb",'
            puts '     "name": "' + device_name + '",'
            puts '     "url": "mqtt://localhost",'
            puts '     "topics": {'
            puts '         "getOn": "' + device_topic + '",'
            puts '         "setOn": "' + device_topic + '/set"'
            puts '    },'
            puts '     "integerValue": "true"'
        when 'lock'       
            puts '     "accessory": "mqttthing",'
            puts '     "type": "lockMechanism",'
            puts '     "name": "' + device_name + '",'
            puts '     "url": "mqtt://localhost",'
            puts '     "topics": {'
            puts '         "setLockTargetState": "' + device_topic + '/set",'
            puts '         "getLockTargetState": "' + device_topic + '/target",'
            puts '         "getLockCurrentState": "' + device_topic + '"'
            puts '    },'
            puts '     "lockValues": [ "Unsecured", "Secured", "Jammed",  "Unknown" ]'
        when 'garage_door'       
            puts '     "accessory": "mqttthing",'
            puts '     "type": "garageDoorOpener",'
            puts '     "name": "' + device_name + '",'
            puts '     "url": "mqtt://localhost",'
            puts '     "topics": {'
            puts '         "setTargetDoorState": "' + device_topic + '/set",'
            puts '         "getTargetDoorState": "' + device_topic + '/target",'
            puts '         "getCurrentDoorState": "' + device_topic + '",'
            puts '         "setLockTargetState": "' + device_topic + '/lock/set",'
            puts '         "getLockTargetState": "' + device_topic + '/lock/target",'
            puts '         "getLockCurrentState": "' + device_topic + '/lock",'
            puts '         "getObstructionDetected": "' + device_topic + '/obstruction"'
            puts '    },'
            puts '    "doorValues": [ "Open", "Closed", "Opening", "Closing", "Stopped" ],'
            puts '    "lockValues": [ "Unsecured", "Secured", "Jammed",  "Unknown" ]'
        when 'light_dimmable'       
            puts '     "accessory": "mqttthing",'
            puts '     "type": "lightbulb",'
            puts '     "name": "' + device_name + '",'
            puts '     "url": "mqtt://localhost",'
            puts '     "topics": {'
            puts '         "getOn": "' + device_topic + '",'
            puts '         "setOn": "' + device_topic + '/set",'
            puts '         "getBrightness": "' + device_topic + '/brightness",'
            puts '         "setBrightness": "' + device_topic + '/brightness/set"'
            puts '    },'
            puts '     "integerValue": "true"'
        when 'fan'       
            puts '     "accessory": "mqttthing",'
            puts '     "type": "fan",'
            puts '     "name": "' + device_name + '",'
            puts '     "url": "mqtt://localhost",'
            puts '     "topics": {'
            puts '        "getOn": "' + device_topic + '",'
            puts '        "setOn":       "' + device_topic + '/set",'
            puts '        "getRotationDirection":        "' + device_topic + '/rotation_direction",'
            puts '        "setRotationDirection":     "' + device_topic + '/rotation_direction/set",'
            puts '        "getRotationSpeed":        "' + device_topic + '/rotation_speed",'
            puts '        "setRotationSpeed":     "' + device_topic + '/rotation_speed/set"'
            puts '    },'
            puts '     "integerValue": "true"'
        when 'contact_sensor'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "contactSensor",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "getContactSensorState": "' + device_topic + '",'
            puts '        "getStatusActive":       "' + device_topic + '/active",'
            puts '        "getStatusFault":        "' + device_topic + '/fault",'
            puts '        "getStatusTampered":     "' + device_topic + '/tampered",'
            puts '        "getStatusLowBattery":   "' + device_topic + '/low_battery"'
            puts '    },'
            puts '    "integerValue": "true"'
        when 'motion_sensor'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "motionSensor",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "getMotionDetected": "' + device_topic + '",'
            puts '        "getStatusActive":       "' + device_topic + '/active",'
            puts '        "getStatusFault":        "' + device_topic + '/fault",'
            puts '        "getStatusTampered":     "' + device_topic + '/tampered",'
            puts '        "getStatusLowBattery":   "' + device_topic + '/low_battery"'
            puts '    },'
            puts '    "integerValue": "true"'
        when 'occupancy_sensor'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "occupancySensor",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "getOccupancyDetected": "' + device_topic + '",'
            puts '        "getStatusActive":       "' + device_topic + '/active",'
            puts '        "getStatusFault":        "' + device_topic + '/fault",'
            puts '        "getStatusTampered":     "' + device_topic + '/tampered",'
            puts '        "getStatusLowBattery":   "' + device_topic + '/low_battery"'
            puts '    },'
            puts '    "integerValue": "true"'
        when 'leak_sensor'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "leakSensor",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "getLeakDetected": "' + device_topic + '",'
            puts '        "getStatusActive":       "' + device_topic + '/active",'
            puts '        "getStatusFault":        "' + device_topic + '/fault",'
            puts '        "getStatusTampered":     "' + device_topic + '/tampered",'
            puts '        "getStatusLowBattery":   "' + device_topic + '/low_battery"'
            puts '    },'
            puts '    "integerValue": "true"'
        when 'humidity_sensor'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "humiditySensor",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "getCurrentRelativeHumidity": "' + device_topic + '",'
            puts '        "getStatusActive":       "' + device_topic + '/active",'
            puts '        "getStatusFault":        "' + device_topic + '/fault",'
            puts '        "getStatusTampered":     "' + device_topic + '/tampered",'
            puts '        "getStatusLowBattery":   "' + device_topic + '/low_battery"'
            puts '    },'
            puts '    "integerValue": "true"'
        when 'temperature_sensor'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "temperatureSensor",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "getCurrentTemperature": "' + device_topic + '",'
            puts '        "getStatusActive":       "' + device_topic + '/active",'
            puts '        "getStatusFault":        "' + device_topic + '/fault",'
            puts '        "getStatusTampered":     "' + device_topic + '/tampered",'
            puts '        "getStatusLowBattery":   "' + device_topic + '/low_battery"'
            puts '    },'
            puts '    "integerValue": "true"'
        when 'light_sensor'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "lightSensor",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "getCurrentAmbientLightLevel": "' + device_topic + '",'
            puts '        "getStatusActive":       "' + device_topic + '/active",'
            puts '        "getStatusFault":        "' + device_topic + '/fault",'
            puts '        "getStatusTampered":     "' + device_topic + '/tampered",'
            puts '        "getStatusLowBattery":   "' + device_topic + '/low_battery"'
            puts '    },'
            puts '    "integerValue": "true"'
        when 'thermostat'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "thermostat",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "getCurrentAmbientLightLevel": "' + device_topic + '",'
            puts '        "getCurrentHeatingCoolingState":  "' + device_topic + '/state",'
            puts '        "setTargetHeatingCoolingState":   "' + device_topic + '/state/set",'
            puts '        "getTargetHeatingCoolingState":   "' + device_topic + '/state/target",'
            puts '        "getCurrentTemperature":          "' + device_topic + '/temperature",'
            puts '        "setTargetTemperature":           "' + device_topic + '/temperature/target/set",'
            puts '        "getTargetTemperature":           "' + device_topic + '/temperature/target",'
            puts '        "setTemperatureDisplayUnits":     "' + device_topic + '/units/set",'
            puts '        "getTemperatureDisplayUnits":     "' + device_topic + '/units",'
            puts '        "getCurrentRelativeHumidity":     "' + device_topic + '/humidity"'
            puts '    },'
            puts '    "integerValue": "true"'
        when 'television'
            puts '    "accessory": "mqttthing",'
            puts '    "type": "television",'
            puts '    "name": "' + device_name + '",'
            puts '    "url": "mqtt://localhost",'
            puts '    "topics":'
            puts '    {'
            puts '        "setActive": "' + device_topic + '/set",'
            puts '        "getActive":       "' + device_topic + '",'
            puts '        "setActiveInput":        "' + device_topic + '/input/set",'
            puts '        "getActiveInput":     "' + device_topic + '/input",'
            puts '        "setRemoteKey":   "' + device_topic + '/remote_key/set"'
            puts '    },'
            puts '    "inputs": ['
            puts '        {'
            puts '            "name":     "Apple TV",'
            puts '            "value":    "apple_tv"'
            puts '        },'
            puts '        {'
            puts '            "name":     "Video Games",'
            puts '            "value":    "video_games"'
            puts '        }'
            puts '    ], "integerValue": "true"'


        else
            puts ' **** Bad device type: ' + device_type
            exit(1)
    end

    printf '}'
end

puts ''
puts ''
