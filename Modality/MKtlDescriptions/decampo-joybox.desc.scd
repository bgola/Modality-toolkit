(
/* Example for a MIDI hardware device and its elements.
	The joybox is made from a Doepfer pocket electronics kit,
	which can send 16 midi controls,
	and 8 XY joysticks in a 4x2 layout.

// usage example:
// make an Mktl for it - will say that this is virtual only
MKtl(\jbx, "decampo-joybox");
MKtl(\jbx).gui;
// MKtl has as idInfo : "EXTERNAL", which is not an existing port name.
MKtl(\jbx).desc.fullDesc.at(\idInfo);

// So we need to tell it which midi hardware interface we connect it to.
// See which MIDI sources are available:
MIDIClient.sources;
// figure out which one you want to use,
// and open it via the port name as idInfo:
MKtl(\jbx).openDeviceVia("IAC Driver");

*/

deviceName: "joybox",
protocol: \midi,
deviceType: \faderbox,
elementTypes: [\fader],
status: (
	linux: "unknown",
	osx: "tested and working",
	win: "unknown"),

idInfo: "EXTERNAL",

deviceInfo: (
	vendorURI: "http://www.doepfer.de/pe.htm",
	manualURI: "http://www.doepfer.de/pdf/PE_manual.pdf",
	description: "Box with 8 XY joysticks, made w doepfer pocket-electronics kit.",
	features: [],
	notes: "",

),

elementsDesc: (
	groupName: \joy,
	sharedProperties: (elementType: \joyAxis, midiMsgType: \control,
			spec: \midiCC, midiChan: 0),
	elements: (0..7).collect { |i|
		(i+1).asSymbol -> [
			\x -> (midiNum: i * 2),
			\y -> (midiNum: i * 2 + 1)
		];
	}
)
);