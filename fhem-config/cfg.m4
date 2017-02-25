# TODO
# - Why are the SVGs empty?
# - Security
#   - Remove Passwords from "Allowed" section and set them in another way!
#   - Credentials for mqtt are not implemented
#
#
# Update-Vorgang
#
# - attr WEB editConfig 1
# - upload via http://192.168.178.31:8083/fhem?cmd=style%20edit%20fhem.cfg
# - rereadcfg
   

#### Global ####

attr global room                       Sysraum
attr global statefile                  ./log/fhem.save
attr global title                      "Haussteuerung von H. Bunjes"
attr global userattr                   cmdIcon devStateIcon devStateStyle icon sortby webCmd widgetOverride
attr global verbose                    3
attr global autoload_undefined_devices 1
attr global logfile                    ./log/fhem-%Y-%m.log
attr global modpath .
attr global updateInBackground 1


#### Allowed ####

define web_allowed    allowed
attr   web_allowed    validFor        screen_FHEMWEB, phone_FHEMWEBWEB, tablet_FHEMWEB
attr   web_allowed    basicAuth       {"$user:$password" eq "<fhem_web_user_1>:<fhem_web_pass_1>"}
attr   web_allowed    room            Sysraum

define telnet_allowed allowed
attr   telnet_allowed validFor        telnetPort
attr   telnet_allowed globalpassword  secret
attr   telnet_allowed room            Sysraum


#### Telnet

define telnetPort telnet 7072 global
attr   telnetPort room   Sysraum


#### FHEMWEB ####

define screen_FHEMWEB FHEMWEB          8083 global

define phone_FHEMWEB  FHEMWEB          8084 global
attr   phone_FHEMWEB  stylesheetPrefix smallscreen

define tablet_FHEMWEB FHEMWEB          8085 global
attr   tablet_FHEMWEB stylesheetPrefix touchpad

attr   .*_FHEMWEB     confirmDelete    0
attr   .*_FHEMWEB     endPlotNow       1
attr   .*_FHEMWEB     sortRooms        Arbeitszimmer Grosses-Bad Kleines-Bad Kueche Schlafzimmer Wohnzimmer Dachboden Flur Unbekannter-Raum
attr   .*_FHEMWEB     editConfig       1
attr   .*_FHEMWEB     room             Sysraum


# Fake FileLog entry, to access the fhem log from FHEMWEB 
define fhem_FileLog FileLog ./log/fhem-%Y-%m.log fakelog
attr   fhem_FileLog room    Sysraum


#### Autocreate

define autocreate autocreate
attr   autocreate filelog ./log/%NAME-%Y.log
attr   autocreate device_room autocreated_%TYPE
attr   autocreate room Sysraum
attr   autocreate weblink 
attr   autocreate weblink_room Plots


#### eventTypes ####

# Collect event types for all devices
define eventTypes eventTypes ./log/eventTypes.txt
attr   eventTypes room       Sysraum


#### USB-Devices 

# Disable this to avoid looking for new USB devices on startup
define initialUsbCheck notify global:INITIALIZED usb create
attr   initialUsbCheck room   Sysraum

m5_cul(cul0, /dev/ttyACM0@9600 1034, Arbeitszimmer)


#### MQTT-Broker ####

# TODO: Credentials are missing
m5_mqttbroker(rabbitmq, 172.17.0.3:1883, mqtt-room)


#### Thermostate Typ S555TH ####

m5_s555th(Bett_Heiner,   1, Schlafzimmer)
m5_s555th(Duschraum,     2, Kleines-Bad)
m5_s555th(Dachboden,     3, Dachboden)
m5_s555th(Kuehlschrank,  4, Kueche)
m5_s555th(Schlafzimmer,  5, Schlafzimmer)
m5_s555th(Grosses_Bad,   6, Grosses-Bad)
m5_s555th(Flur,          7, Flur)
m5_s555th(Bett_Carmen,   8, Schlafzimmer)
                      
                                      
#### Steckdosen Typ FS20 ####                  
                                     
m5_fs20st(Neonlicht_Kueche,              e4e4 0C, Kueche)
m5_fs20st(Sechsfachstecker_Schlafzimmer, e4e4 0D, Schlafzimmer)
m5_fs20st(Notlicht_Flur,                 e4e4 0E, Flur)
m5_fs20st(Licht_Wohnzimmer,              e4e4 0B, Wohnzimmer)
m5_fs20st(Heizdecke_Carmen,              e4e4 0A, Schlafzimmer)
m5_fs20st(Licht_Schlafzimmer,            5e29 01, Schlafzimmer)
m5_fs20st(Harddisk_Fritzbox,             5e29 02, Dachboden)
m5_fs20st(Auf_Schreibtisch,              12cb 03, Arbeitszimmer)


#### Raumthermostat Typ FHT80B ####

m5_fht80b(Kueche, 6219, Kueche)


#### Türkontakt Tp FHTTK ####

m5_fhttk(Tuer_grosses_Bad, b39e94, Testraum)


#### Buttons Typ FS20 ####

m5_fs20rc(rc1_btn1,  e4e4 00, Mobil)
m5_fs20rc(rc1_btn2,  e4e4 01, Mobil)
m5_fs20rc(rc1_btn3,  e4e4 02, Mobil)
m5_fs20rc(rc1_btn4,  e4e4 03, Mobil)
m5_fs20rc(rc1_btn5,  e4e4 04, Mobil)
m5_fs20rc(rc1_btn6,  e4e4 05, Mobil)
m5_fs20rc(rc1_btn7,  e4e4 06, Mobil)
m5_fs20rc(rc1_btn8,  e4e4 07, Mobil)
m5_fs20rc(rc1_btn9,  e4e4 f0, Mobil)
m5_fs20rc(rc1_btn10, e4e4 0f, Mobil)
   
m5_fs20rc(rc2_btn1,  12cb 00, Mobil)
m5_fs20rc(rc2_btn2,  12cb 01, Mobil)
m5_fs20rc(rc2_btn3,  12cb 02, Mobil)
m5_fs20rc(rc2_btn4,  12cb 03, Mobil)
               
m5_fs20rc(rc3_btn1,  5f29 00, Unbekannter-Raum)
m5_fs20rc(rc3_btn2,  5f29 01, Unbekannter-Raum)
m5_fs20rc(rc3_btn3,  5f29 02, Unbekannter-Raum)


#### DashButtons ####

m5_dashbutton(Ariel1,   Mobil)
m5_dashbutton(Bio1,     Mobil)
m5_dashbutton(Bio2,     Mobil)
m5_dashbutton(Caffe1,   Wohnzimmer,   {HBToggle("m5_name_of_fs20st(Licht_Wohnzimmer)")})
m5_dashbutton(Kleenex1, Schlafzimmer, m5_toggle_fs20st(Licht_Schlafzimmer))
m5_dashbutton(Somat1,   Wohnzimmer,   m5_toggle_fs20st(Licht_Wohnzimmer))


#### Bewegungsmelder Typ PIRI ####

m5_fs20piri(Flur, 2d03 00, Flur)


#### at ####

define at1 at *12:13:14 set m5_name_of_fs20st(Sechsfachstecker_Schlafzimmer) on
attr   at1 room Sysraum

define at2 at *04:12:13 set m5_name_of_fht80b(Kueche)                         time 
attr   at2 room Sysraum


#### Workspace ####

attr .*SVG      plotsize 1400,160
attr piri.*_SVG plotsize 1400,40
