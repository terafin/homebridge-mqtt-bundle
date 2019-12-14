# homebridge-mqtt-bundle

## Install steps

1. Download Balena Etcher: <https://www.balena.io/etcher/>
2. Setup Pi with raspbian <https://www.raspberrypi.org/downloads/raspbian/>
3. Install Ruby on Pi `sudo apt install ruby`
4. Install Docker on Pi  `curl -sSL https://get.docker.com | sh`
5. Install Docker-Compose on Pi `sudo apt install docker-compose`
6. Install Mosquitto Clients on Pi: `sudo apt install mosquitto-clients`
7. [Optional] Install mosquitto Client on Mac: `brew install mosquitto`

## Generating Config

1. Use example devices.csv inside /config/ as a template
2. Generate JSON using command `./scripts/generate_accessories.sh ./config/devices.csv`
3. From this github repo root directory, run: `docker-compose up -d --remove-orphans`
4. To watch HomeBridge logs & get pairing code: `docker logs -f homebridge`
5. Once HomeBridge is up and running, pair it up, and head back to the terminal
6. Put example JSON inside ./homebridge/config.json in the accessories: [] section
    Check Docker status at: `docker ps -a`
    1. Notes about docker here: <https://docker-curriculum.com/>
7. Reboot homebridge: `docker restart homebridge`
