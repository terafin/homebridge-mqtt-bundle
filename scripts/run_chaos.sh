#!/usr/bin/ruby
require 'csv'

inputPath = ARGV[0]


puts "# ======================================================================================="
puts "# Running Chaos!"
puts "# ======================================================================================"
puts ""

supported_devices = ['switch', 'outlet', 'button', 'light', 'lock', 'garage_door', 'light_dimmable', 
'fan', 'contact_sensor', 'motion_sensor', 'leak_sensor', 
'humidity_sensor', 'temperature_sensor', 'light_sensor', 'thermostat', 'television']

def publish(command) 
    puts "  => Command : " + command
    system(command)
 end
 

random_item = "switch"

loop do
    random_item = supported_devices.sample
    puts " => Running on " + random_item

    File.open(inputPath, "r").each_line do |line|
        csv = CSV.parse_line(line)
    
        device_type = csv[0]
        device_topic = csv[1]
        device_name = csv[2]
        
        next if random_item != device_type
    
        case device_type
            when 'switch'       
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
            when 'outlet'       
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
            when 'button'       
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + '1')
            when 'light'       
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
            when 'lock'       
                random_state = [ "Unsecured", "Secured", "Jammed"].sample
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + random_state)
            when 'garage_door'       
                random_state = [ "Open", "Closed", "Opening", "Closing", "Stopped"].sample
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + random_state)
            when 'light_dimmable'       
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                brightness = Random.new.rand(0..100) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/brightness -m  ' + on_off.to_s)
            when 'fan'       
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                speed = Random.new.rand(0..100) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/rotation_speed -m  ' + on_off.to_s)
            when 'contact_sensor'
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/active -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/fault -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/tampered -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/low_battery -m  ' + on_off.to_s)
            when 'motion_sensor'
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/active -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/fault -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/tampered -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/low_battery -m  ' + on_off.to_s)
            when 'occupancy_sensor'
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/active -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/fault -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/tampered -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/low_battery -m  ' + on_off.to_s)
            when 'leak_sensor'
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/active -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/fault -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/tampered -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/low_battery -m  ' + on_off.to_s)
            when 'humidity_sensor'
                on_off = Random.new.rand(30..80) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/active -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/fault -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/tampered -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/low_battery -m  ' + on_off.to_s)
            when 'temperature_sensor'
                on_off = Random.new.rand(20..80) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/active -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/fault -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/tampered -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/low_battery -m  ' + on_off.to_s)
            when 'light_sensor'
                on_off = Random.new.rand(0..10000) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + ' -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/active -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/fault -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/tampered -m  ' + on_off.to_s)
                on_off = Random.new.rand(0..1) 
                publish('mosquitto_pub -h localhost -t ' + device_topic + '/low_battery -m  ' + on_off.to_s)
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
        end
    end
    
    sleep(0.5)
end
