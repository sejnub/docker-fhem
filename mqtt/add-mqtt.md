In Container    


In FHEM

    update 
    
    shutdown
    
At host

    docker start fhem

In FHEM

    attr WEB editConfig 1
    
    define CUL_0 CUL /dev/ttyACM0@9600 1034

    define rabbitmq MQTT 172.17.0.3:1883 guest guest
    
    define mqbWs3     MQTT_BRIDGE                CUL_WS_3
    attr   mqbWs3     publishReading_temperature fhem/from/ws3/temperature
    attr   mqbWs3     publishReading_humidity    fhem/from/ws3/humidity
    
    define mqbWs5     MQTT_BRIDGE                CUL_WS_5
    attr   mqbWs5     publishReading_temperature fhem/from/ws5/temperature
    attr   mqbWs5     publishReading_humidity    fhem/from/ws5/humidity
    
    define mqbSwitch1 MQTT_BRIDGE                FS20_12cb03
    attr   mqbSwitch1 publishState               fhem/from/switch1/state
    attr   mqbSwitch1 subscribeSet               fhem/to/switch1/state
    
    define mqdSwitch1 MQTT_DEVICE
    




eof
