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
    
    define mqbWs3     MQTT_BRIDGE  CUL_WS_3
    attr   mqbWs3     publishState fhem/ws3/fromfhem
    attr   mqbWs3     subscribeSet fhem/ws3/tofhem
    
    define mqbSwitch1 MQTT_BRIDGE  FS20_12cb03
    attr   mqbSwitch1 publishState fhem/switch1/fromfhem
    attr   mqbSwitch1 subscribeSet fhem/switch1/tofhem
    
    define mqdSwitch1 MQTT_DEVICE
    




eof
