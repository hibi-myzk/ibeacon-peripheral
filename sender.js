var Bleacon = require('bleacon');

//var uuid = 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE';
var uuid = '8DE9BE11-2268-4015-B040-418924420612';
var major = 0; // 0 - 65535
var minor = 0; // 0 - 65535
//var measuredPower = -59; //-128 - 127 (measured RSSI at 1 meter)
var measuredPower = -128;

Bleacon.startAdvertising(uuid, major, minor, measuredPower);
