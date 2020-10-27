char val; // Data received from the serial port
byte relayStates = 0;
byte relayStatesOld = 0;
byte relayStatesChange = 0;
int offset = 2;

void setup() {
  // set pin 2 to 9 as Outputs
  for(int i=0+offset; i<8+offset; i++){
    pinMode(i, OUTPUT);
  }

  Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
  while (Serial.available()) { // If data is available to read,
    relayStates = (byte)Serial.read();
  }
  relayStatesChange = relayStates | relayStatesOld;
  if(relayStatesChange != 0){
    for(int i=0; i<8; i++){
      if(bitRead(relayStatesChange, i) == 1){
        digitalWrite(7+offset-i,bitRead(relayStates, i));
      }
    }
  }
  relayStatesOld = relayStates;
}
