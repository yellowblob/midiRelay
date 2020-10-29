# midiRelay

This Software aims to control an 8channel relay with a Midi keyboard or any other suitable midi device.
It can be controlled with MAX by cycling74 or processing. Simply download [MAX](https://cycling74.com/downloads) or [processing](https://processing.org/download/) and open the respective file in this repository.
Please be aware that this was testet in MacOS Environment only.

If you want to set up your own communication between a software and the arduino you can easily do this. The communication to the Arduino is encoded in one byte, each bit representing one of the relay's channels.