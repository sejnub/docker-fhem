m4_divert(`-1')

m4_define(`m5_prefix_s555th',     `s555')
m4_define(`m5_prefix_fs20st',     `fs20st')
m4_define(`m5_prefix_fs20piri',   `piri')
m4_define(`m5_prefix_fht80b',     `fht')
m4_define(`m5_prefix_fhttk',      `fhttk')
m4_define(`m5_prefix_dashbutton', `dashbutton')
m4_define(`m5_prefix_fs20rc',     `rc')


m4_define(`m5_name_of_fs20std', `m5_prefix_fs20std()_$1_FS20')

m4_define(`m5_name_of_fht80b', `m5_prefix_fht80b()_$1_FHT')

m4_define(`m5_toggle_fs20std', `{HBToggle("m5_name_of_fs20std($1)")}')


m4_define(`m5_mqttbroker',`m4_dnl ###################################
m4_dnl
m4_define(`m5_mqtt_device',`$1')m4_dnl
m4_define(`m5_mqtt_room',  `$3')m4_dnl
m4_dnl
define $1 MQTT $2
attr   $1 room $3 m4_dnl
')


m4_define(`m5_cul',`m4_dnl ###################################
m4_dnl
m4_define(`m5_fs20_device',`$1')m4_dnl
m4_dnl
define $1 CUL  $2
attr   $1 room $3 m4_dnl
')


m4_define(`m5_s555th',`m4_dnl ########################################
m4_dnl
m4_define(`m5_devnamebase',`m5_prefix_s555th()_$1')m4_dnl
m4_dnl
define m5_devnamebase()_CUL_WS      CUL_WS                     $2
attr   m5_devnamebase()_CUL_WS      room                       $3
define m5_devnamebase()_FileLog     FileLog                    ./log/m5_devnamebase()-%Y.log m5_devnamebase()_CUL_WS:T:.*
attr   m5_devnamebase()_FileLog     logtype                    temp4hum6:Temp/Hum,text
attr   m5_devnamebase()_FileLog     room                       $3 m4_dnl

m4_dnl https://fhem.de/commandref.html#SVG                     
m4_dnl define <name> SVG <logDevice>:<gplotfile>:<logfile> 
define m5_devnamebase()_SVG         SVG                        m5_devnamebase()_FileLog:m5_devnamebase()_SVG:CURRENT
attr   m5_devnamebase()_SVG         label                      "m5_devnamebase() Min $data{min1}, Max $data{max1}, Last $data{currval1}"
attr   m5_devnamebase()_SVG         room                       Plots m4_dnl

define m5_devnamebase()_MQTT_BRIDGE MQTT_BRIDGE                m5_devnamebase()_CUL_WS
attr   m5_devnamebase()_MQTT_BRIDGE IODev                      m5_mqtt_device()
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_humidity    fhem/pub/m5_devnamebase()/humidity
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_temperature fhem/pub/m5_devnamebase()/temperature
m4_dnl TODO: No idea what this next line does
attr   m5_devnamebase()_MQTT_BRIDGE stateFormat                transmission-state
attr   m5_devnamebase()_MQTT_BRIDGE room                       m5_mqtt_room() m4_dnl
')


m4_define(`m5_fs20std',`m4_dnl #######################################
m4_dnl
m4_define(`m5_devnamebase',`m5_prefix_fs20std()_$1')m4_dnl
m4_dnl
define m5_devnamebase()_FS20        FS20         $2
attr   m5_devnamebase()_FS20        room         $3
define m5_devnamebase()_FileLog     FileLog      ./log/m5_devnamebase()-%Y.log m5_devnamebase()_FS20
attr   m5_devnamebase()_FileLog     logtype      text
attr   m5_devnamebase()_FileLog     room         $3 m4_dnl

define m5_devnamebase()_MQTT_BRIDGE MQTT_BRIDGE  m5_devnamebase()_FS20
attr   m5_devnamebase()_MQTT_BRIDGE IODev        m5_mqtt_device()
attr   m5_devnamebase()_MQTT_BRIDGE publishState fhem/pub/m5_devnamebase()/state
attr   m5_devnamebase()_MQTT_BRIDGE subscribeSet fhem/sub/m5_devnamebase()/state
m4_dnl TODO: No idea what this next stateFormat line does
attr   m5_devnamebase()_MQTT_BRIDGE stateFormat  transmission-state
attr   m5_devnamebase()_MQTT_BRIDGE room         m5_mqtt_room() m4_dnl
')


m4_define(`m5_fht80b',`m4_dnl ########################################
m4_dnl
m4_define(`m5_devnamebase',`m5_prefix_fht80b()_$1')m4_dnl
m4_dnl
define m5_devnamebase()_FHT         FHT                          $2
attr   m5_devnamebase()_FHT         IODev                        m5_fs20_device
attr   m5_devnamebase()_FHT         room                         $3
define m5_devnamebase()_FileLog     FileLog                      ./log/m5_devnamebase()-%Y.log m5_devnamebase()_FHT
attr   m5_devnamebase()_FileLog     logtype                      fht:Temp/Act,text
attr   m5_devnamebase()_FileLog     room                         $3
define m5_devnamebase()_SVG         SVG                          m5_devnamebase()_FileLog:m5_devnamebase()_SVG:CURRENT
attr   m5_devnamebase()_SVG         label                        "m5_devnamebase() Min $data{min1}, Max $data{max1}, Last $data{currval1}"
attr   m5_devnamebase()_SVG         room                         Plots 
define m5_devnamebase()_MQTT_BRIDGE MQTT_BRIDGE                  m5_devnamebase()_FHT
attr   m5_devnamebase()_MQTT_BRIDGE IODev                        m5_mqtt_device()
attr   m5_devnamebase()_MQTT_BRIDGE publishState                 fhem/pub/m5_devnamebase()/state
attr   m5_devnamebase()_MQTT_BRIDGE subscribeSet                 fhem/sub/m5_devnamebase()/state
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_actuator      fhem/pub/m5_devnamebase()/actuator
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_battery       fhem/pub/m5_devnamebase()/battery
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_desired-temp  fhem/pub/m5_devnamebase()/desired-temp
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_measured-temp fhem/pub/m5_devnamebase()/measured-temp
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_warnings      fhem/pub/m5_devnamebase()/warnings
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_window        fhem/pub/m5_devnamebase()/window
attr   m5_devnamebase()_MQTT_BRIDGE publishReading_windowsensor  fhem/pub/m5_devnamebase()/windowsensor
attr   m5_devnamebase()_MQTT_BRIDGE subscribeSet_desired-temp    fhem/sub/m5_devnamebase()/desired-temp
attr   m5_devnamebase()_MQTT_BRIDGE subscribeSet_mode            fhem/sub/m5_devnamebase()/mode
m4_dnl TODO: No idea what this next stateFormat line does
attr   m5_devnamebase()_MQTT_BRIDGE stateFormat                  transmission-state
attr   m5_devnamebase()_MQTT_BRIDGE room                         m5_mqtt_room() m4_dnl
')


m4_define(`m5_fhttk',`m4_dnl #########################################
m4_dnl
m4_define(`m5_devnamebase',`m5_prefix_fhttk()_$1')m4_dnl
m4_dnl
define m5_devnamebase()_CUL_FHTTK   CUL_FHTTK    $2
attr   m5_devnamebase()_CUL_FHTTK   room         $3
define m5_devnamebase()_FileLog     FileLog      ./log/m5_devnamebase()-%Y.log m5_devnamebase()_CUL_FHTTK
attr   m5_devnamebase()_FileLog     logtype      fht80tf:Window,text
attr   m5_devnamebase()_FileLog     room         $3 m4_dnl

m4_dnl https://fhem.de/commandref.html#SVG       
m4_dnl define <name> SVG <logDevice>:<gplotfile>:<logfile> 
define m5_devnamebase()_SVG         SVG          m5_devnamebase()_FileLog:m5_devnamebase()_SVG:CURRENT
attr   m5_devnamebase()_SVG         label        "m5_devnamebase() Min $data{min1}, Max $data{max1}, Last $data{currval1}"
attr   m5_devnamebase()_SVG         room         Plots m4_dnl

define m5_devnamebase()_MQTT_BRIDGE MQTT_BRIDGE  m5_devnamebase()_CUL_FHTTK
attr   m5_devnamebase()_MQTT_BRIDGE IODev        m5_mqtt_device()
attr   m5_devnamebase()_MQTT_BRIDGE publishState fhem/pub/m5_devnamebase()/state
m4_dnl TODO: No idea what this next line does
attr   m5_devnamebase()_MQTT_BRIDGE stateFormat  transmission-state
attr   m5_devnamebase()_MQTT_BRIDGE room         m5_mqtt_room() m4_dnl
')


m4_define(`m5_dashbutton',`m4_dnl ####################################
m4_dnl
m4_define(`m5_devnamebase',`m5_prefix_dashbutton()_$1')m4_dnl
m4_dnl
define m5_devnamebase()_dummy  dummy
attr   m5_devnamebase()_dummy  webCmd press
attr   m5_devnamebase()_dummy  room   $2 m4_dnl
m4_ifelse(`$3', `', `m4_dnl', `
define m5_devnamebase()_notify notify m5_devnamebase().* $3'
attr   m5_devnamebase()_notify room   Sysraum) m4_dnl
')


m4_define(`m5_fs20rc',`m4_dnl ####################################
m4_dnl
m4_define(`m5_devnamebase',`m5_prefix_fs20rc()_$1')m4_dnl
m4_dnl
define m5_devnamebase()_FS20    FS20    $2
attr   m5_devnamebase()_FS20    room    $3 
define m5_devnamebase()_FileLog FileLog ./log/m5_devnamebase()-%Y.log m5_devnamebase()_FS20
attr   m5_devnamebase()_FileLog logtype text
attr   m5_devnamebase()_FileLog room    $3 m4_dnl

define m5_devnamebase()_MQTT_BRIDGE MQTT_BRIDGE  m5_devnamebase()_FS20
attr   m5_devnamebase()_MQTT_BRIDGE IODev        m5_mqtt_device()
attr   m5_devnamebase()_MQTT_BRIDGE publishState fhem/pub/m5_devnamebase()/state
attr   m5_devnamebase()_MQTT_BRIDGE subscribeSet fhem/sub/m5_devnamebase()/state
m4_dnl TODO: No idea what this next stateFormat line does
attr   m5_devnamebase()_MQTT_BRIDGE stateFormat  transmission-state
attr   m5_devnamebase()_MQTT_BRIDGE room         m5_mqtt_room() m4_dnl
')


m4_define(`m5_fs20piri',`m4_dnl ####################################
m4_dnl
m4_define(`m5_devnamebase',`m5_prefix_fs20piri()_$1')m4_dnl
m4_dnl
define m5_devnamebase()_FS20        FS20               $2
attr   m5_devnamebase()_FS20        room               $3 
define m5_devnamebase()_FileLog     FileLog            ./log/m5_devnamebase()-%Y.log m5_devnamebase()_FS20
attr   m5_devnamebase()_FileLog     logtype            text
attr   m5_devnamebase()_FileLog     room               $3 
define m5_devnamebase()_SVG         SVG                m5_devnamebase()_FileLog:m5_devnamebase()_SVG:CURRENT
attr   m5_devnamebase()_SVG         label              "m5_devnamebase() Min $data{min1}, Max $data{max1}, Last $data{currval1}"
attr   m5_devnamebase()_SVG         room               Plots
define m5_devnamebase()_MQTT_BRIDGE MQTT_BRIDGE        m5_devnamebase()_FS20
attr   m5_devnamebase()_MQTT_BRIDGE IODev              m5_mqtt_device()
attr   m5_devnamebase()_MQTT_BRIDGE publishState       fhem/pub/m5_devnamebase()/state
attr   m5_devnamebase()_MQTT_BRIDGE subscribeSet       fhem/sub/m5_devnamebase()/state
m4_dnl TODO: No idea what this next line does. Lets see if there ever is anything sent!
attr   m5_devnamebase()_MQTT_BRIDGE publish-topic-base fhem/sub/m5_devnamebase()/something
m4_dnl TODO: No idea what this next stateFormat line does
attr   m5_devnamebase()_MQTT_BRIDGE stateFormat        transmission-state
attr   m5_devnamebase()_MQTT_BRIDGE room               m5_mqtt_room() m4_dnl
')


m4_divert(0)m4_dnl
