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
    
    define culws3 MQTT_BRIDGE CUL_WS_3
    attr culws3 publishState culws3Topic
    
    define mqbSwitch1 MQTT_BRIDGE  FS20_12cb03
    attr   mqbSwitch1 publishState switch1Topic
    attr   mqbSwitch1 subscribeSet fhem/mqtt/Licht/set
    
    define mqdSwitch1 MQTT_DEVICE
    




eof
