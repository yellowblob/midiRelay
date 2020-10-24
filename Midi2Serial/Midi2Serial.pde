import processing.serial.*;
import themidibus.*; //Import the library
import java.util.Map;


MidiBus myBus; // The MidiBus
SimpleMidiListener listener;
static int[] pitches = {37,39,41,43,45,47,49,51};
HashMap<Integer,Integer> hm = new HashMap<Integer,Integer>();

void setup() {
  size(400, 400);
  background(0);
  
  for(int i = 0; i < pitches.length; i++) {
    hm.put(pitches[i],i);
  }

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  myBus = new MidiBus(this, "PAD", "Bus 1"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
  myBus.addMidiListener(listener);
}

void draw() {
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  int relay = hm.get(pitch);
  println(relay);
}
