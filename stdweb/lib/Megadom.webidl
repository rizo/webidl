
// -------
// TODO
typedef sequence<any> ArrayBufferView;
typedef any BufferSource;
//typedef sequence<double> Float32Array;
// --------

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/ANGLE_instanced_arrays/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface ANGLEInstancedArrays {
    const GLenum VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE = 0x88FE;
    undefined drawArraysInstancedANGLE(GLenum mode, GLint first, GLsizei count, GLsizei primcount);
    undefined drawElementsInstancedANGLE(GLenum mode, GLsizei count, GLenum type, GLintptr offset, GLsizei primcount);
    undefined vertexAttribDivisorANGLE(GLuint index, GLuint divisor);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-abstractrange
 */

[Exposed=Window]
interface AbstractRange {
  [Pure]
  readonly attribute Node startContainer;
  [Pure]
  readonly attribute unsigned long startOffset;
  [Pure]
  readonly attribute Node endContainer;
  [Pure]
  readonly attribute unsigned long endOffset;
  [Pure]
  readonly attribute boolean collapsed;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// Interface for testing element activation
// This interface is entirely internal to Servo, and should not be accessible to
// web pages.
[Exposed=(Window,Worker)]
interface mixin ActivatableElement {
  [Throws, Pref="dom.testing.element.activation.enabled"]
  undefined enterFormalActivationState();

  [Throws, Pref="dom.testing.element.activation.enabled"]
  undefined exitFormalActivationState();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#analysernode
 */

dictionary AnalyserOptions : AudioNodeOptions {
  unsigned long fftSize = 2048;
  double maxDecibels = -30;
  double minDecibels = -100;
  double smoothingTimeConstant = 0.8;
};

[Exposed=Window]
interface AnalyserNode : AudioNode {
  [Throws] constructor(BaseAudioContext context, optional AnalyserOptions options = {});
  undefined getFloatFrequencyData (Float32Array array);
  undefined getByteFrequencyData (Uint8Array array);
  undefined getFloatTimeDomainData (Float32Array array);
  undefined getByteTimeDomainData (Uint8Array array);
  [SetterThrows] attribute unsigned long fftSize;
  readonly attribute unsigned long frequencyBinCount;
  [SetterThrows] attribute double minDecibels;
  [SetterThrows] attribute double maxDecibels;
  [SetterThrows] attribute double smoothingTimeConstant;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * http://www.w3.org/TR/css3-animations/#animation-events-
 * http://dev.w3.org/csswg/css3-animations/#animation-events-
 *
 * Copyright © 2012 W3C® (MIT, ERCIM, Keio), All Rights Reserved. W3C
 * liability, trademark and document use rules apply.
 */

[Exposed=Window]
interface AnimationEvent : Event {
  constructor(DOMString type, optional AnimationEventInit eventInitDict = {});

  readonly attribute DOMString animationName;
  readonly attribute float     elapsedTime;
  readonly attribute DOMString pseudoElement;
};

dictionary AnimationEventInit : EventInit {
  DOMString animationName = "";
  float elapsedTime = 0;
  DOMString pseudoElement = "";
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-attr
 *
 */

[Exposed=Window]
interface Attr : Node {
  [Constant]
  readonly attribute DOMString? namespaceURI;
  [Constant]
  readonly attribute DOMString? prefix;
  [Constant]
  readonly attribute DOMString localName;
  [Constant]
  readonly attribute DOMString name;
  [CEReactions, Pure]
           attribute DOMString value;

  [Pure]
  readonly attribute Element? ownerElement;

  [Constant]
  readonly attribute boolean specified; // useless; always returns true
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#audiobuffer
 */

dictionary AudioBufferOptions {
  unsigned long numberOfChannels = 1;
  required unsigned long length;
  required float sampleRate;
};

[Exposed=Window]
interface AudioBuffer {
  [Throws] constructor(AudioBufferOptions options);
  readonly attribute float sampleRate;
  readonly attribute unsigned long length;
  readonly attribute double duration;
  readonly attribute unsigned long numberOfChannels;
  [Throws] Float32Array getChannelData(unsigned long channel);
  [Throws] undefined copyFromChannel(Float32Array destination,
                                unsigned long channelNumber,
                                optional unsigned long startInChannel = 0);
  [Throws] undefined copyToChannel(Float32Array source,
                              unsigned long channelNumber,
                              optional unsigned long startInChannel = 0);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#AudioBufferSourceNode
 */

dictionary AudioBufferSourceOptions {
  AudioBuffer? buffer;
  float detune = 0;
  boolean loop = false;
  double loopEnd = 0;
  double loopStart = 0;
  float playbackRate = 1;
};

[Exposed=Window]
interface AudioBufferSourceNode : AudioScheduledSourceNode {
  [Throws] constructor(BaseAudioContext context, optional AudioBufferSourceOptions options = {});
  [Throws] attribute AudioBuffer? buffer;
  readonly attribute AudioParam playbackRate;
  readonly attribute AudioParam detune;
  attribute boolean loop;
  attribute double loopStart;
  attribute double loopEnd;
  [Throws] undefined start(optional double when = 0,
                      optional double offset,
                      optional double duration);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#dom-audiocontext
 */

enum AudioContextLatencyCategory {
  "balanced",
  "interactive",
  "playback"
};

dictionary AudioContextOptions {
  (AudioContextLatencyCategory or double) latencyHint = "interactive";
  float sampleRate;
};

dictionary AudioTimestamp {
  double contextTime;
  DOMHighResTimeStamp performanceTime;
};

[Exposed=Window]
interface AudioContext : BaseAudioContext {
  [Throws] constructor(optional AudioContextOptions contextOptions = {});
  readonly attribute double baseLatency;
  readonly attribute double outputLatency;

  AudioTimestamp getOutputTimestamp();

  Promise<undefined> suspend();
  Promise<undefined> close();

  [Throws] MediaElementAudioSourceNode createMediaElementSource(HTMLMediaElement mediaElement);
  [Throws] MediaStreamAudioSourceNode createMediaStreamSource(MediaStream mediaStream);
  [Throws] MediaStreamTrackAudioSourceNode createMediaStreamTrackSource(MediaStreamTrack mediaStreamTrack);
  [Throws] MediaStreamAudioDestinationNode createMediaStreamDestination();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#dom-audiodestinationnode
 */

[Exposed=Window]
interface AudioDestinationNode : AudioNode {
  readonly attribute unsigned long maxChannelCount;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#audiolistener
 */

[Exposed=Window]
interface AudioListener {
  readonly attribute AudioParam positionX;
  readonly attribute AudioParam positionY;
  readonly attribute AudioParam positionZ;
  readonly attribute AudioParam forwardX;
  readonly attribute AudioParam forwardY;
  readonly attribute AudioParam forwardZ;
  readonly attribute AudioParam upX;
  readonly attribute AudioParam upY;
  readonly attribute AudioParam upZ;
  [Throws] AudioListener setPosition (float x, float y, float z);
  [Throws] AudioListener setOrientation (float x, float y, float z, float xUp, float yUp, float zUp);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#dom-audionode
 */

enum ChannelCountMode {
  "max",
  "clamped-max",
  "explicit"
};

enum ChannelInterpretation {
  "speakers",
  "discrete"
};

dictionary AudioNodeOptions {
   unsigned long         channelCount;
   ChannelCountMode      channelCountMode;
   ChannelInterpretation channelInterpretation;
};

[Exposed=Window]
interface AudioNode : EventTarget {
  [Throws]
  AudioNode connect(AudioNode destinationNode,
                    optional unsigned long output = 0,
                    optional unsigned long input = 0);
  [Throws]
  undefined connect(AudioParam destinationParam,
               optional unsigned long output = 0);
  [Throws]
  undefined disconnect();
  [Throws]
  undefined disconnect(unsigned long output);
  [Throws]
  undefined disconnect(AudioNode destination);
  [Throws]
  undefined disconnect(AudioNode destination, unsigned long output);
  [Throws]
  undefined disconnect(AudioNode destination,
                  unsigned long output,
                  unsigned long input);
  [Throws]
  undefined disconnect(AudioParam destination);
  [Throws]
  undefined disconnect(AudioParam destination, unsigned long output);

  readonly attribute BaseAudioContext context;
  readonly attribute unsigned long numberOfInputs;
  readonly attribute unsigned long numberOfOutputs;

  [SetterThrows]
  attribute unsigned long channelCount;
  [SetterThrows]
  attribute ChannelCountMode channelCountMode;
  [SetterThrows]
  attribute ChannelInterpretation channelInterpretation;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#dom-audioparam
 */

enum AutomationRate {
  "a-rate",
  "k-rate"
};

[Exposed=Window]
interface AudioParam {
             attribute float value;
             [SetterThrows] attribute AutomationRate automationRate;
    readonly attribute float defaultValue;
    readonly attribute float minValue;
    readonly attribute float maxValue;
    [Throws] AudioParam setValueAtTime(float value, double startTime);
    [Throws] AudioParam linearRampToValueAtTime(float value, double endTime);
    [Throws] AudioParam exponentialRampToValueAtTime(float value, double endTime);
    [Throws] AudioParam setTargetAtTime(float target,
                               double startTime,
                               float timeConstant);
    [Throws] AudioParam setValueCurveAtTime(sequence<float> values,
                                   double startTime,
                                   double duration);
    [Throws] AudioParam cancelScheduledValues(double cancelTime);
    [Throws] AudioParam cancelAndHoldAtTime(double cancelTime);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#AudioScheduledSourceNode
 */

[Exposed=Window]
interface AudioScheduledSourceNode : AudioNode {
  attribute EventHandler onended;
  [Throws] undefined start(optional double when = 0);
  [Throws] undefined stop(optional double when = 0);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#audiotrack

[Exposed=Window]
interface AudioTrack {
  readonly attribute DOMString id;
  readonly attribute DOMString kind;
  readonly attribute DOMString label;
  readonly attribute DOMString language;
  attribute boolean enabled;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#audiotracklist

[Exposed=Window]
interface AudioTrackList : EventTarget {
  readonly attribute unsigned long length;
  getter AudioTrack (unsigned long index);
  AudioTrack? getTrackById(DOMString id);

  attribute EventHandler onchange;
  attribute EventHandler onaddtrack;
  attribute EventHandler onremovetrack;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#BaseAudioContext
 */

enum AudioContextState {
  "suspended",
  "running",
  "closed"
};

callback DecodeErrorCallback = undefined (DOMException error);
callback DecodeSuccessCallback = undefined (AudioBuffer decodedData);

[Exposed=Window]
interface BaseAudioContext : EventTarget {
  readonly attribute AudioDestinationNode destination;
  readonly attribute float sampleRate;
  readonly attribute double currentTime;
  readonly attribute AudioListener listener;
  readonly attribute AudioContextState  state;
  Promise<undefined> resume();
  attribute EventHandler onstatechange;
  [Throws] AudioBuffer createBuffer(unsigned long numberOfChannels,
                                    unsigned long length,
                                    float sampleRate);
  Promise<AudioBuffer> decodeAudioData(ArrayBuffer audioData,
                                       optional DecodeSuccessCallback successCallback,
                                       optional DecodeErrorCallback errorCallback);
  [Throws] AudioBufferSourceNode createBufferSource();
  [Throws] ConstantSourceNode createConstantSource();
  // ScriptProcessorNode createScriptProcessor(optional unsigned long bufferSize = 0,
  //                                           optional unsigned long numberOfInputChannels = 2,
  //                                           optional unsigned long numberOfOutputChannels = 2);
  [Throws] AnalyserNode createAnalyser();
  [Throws]  GainNode createGain();
  // DelayNode createDelay(optional double maxDelayTime = 1);
  [Throws] BiquadFilterNode createBiquadFilter();
  // IIRFilterNode createIIRFilter(sequence<double> feedforward,
  //                               sequence<double> feedback);
  // WaveShaperNode createWaveShaper();
  [Throws] PannerNode createPanner();
  [Throws] StereoPannerNode createStereoPanner();
  // ConvolverNode createConvolver();
  [Throws] ChannelSplitterNode createChannelSplitter(optional unsigned long numberOfOutputs = 6);
  [Throws] ChannelMergerNode createChannelMerger(optional unsigned long numberOfInputs = 6);
  // DynamicsCompressorNode createDynamicsCompressor();
  [Throws]  OscillatorNode createOscillator();
  // PeriodicWave createPeriodicWave(sequence<float> real,
  //                                 sequence<float> imag,
  //                                 optional PeriodicWaveConstraints constraints);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * For more information on this interface please see
 * https://html.spec.whatwg.org/multipage/#beforeunloadevent
 */

[Exposed=Window]
interface BeforeUnloadEvent : Event {
  attribute DOMString returnValue;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#biquadfilternode
 */

enum BiquadFilterType {
  "lowpass",
  "highpass",
  "bandpass",
  "lowshelf",
  "highshelf",
  "peaking",
  "notch",
  "allpass"
};

dictionary BiquadFilterOptions : AudioNodeOptions {
  BiquadFilterType type = "lowpass";
  float Q = 1;
  float detune = 0;
  float frequency = 350;
  float gain = 0;
};

[Exposed=Window]
interface BiquadFilterNode : AudioNode {
  [Throws] constructor(BaseAudioContext context, optional BiquadFilterOptions options = {});
  attribute BiquadFilterType type;
  readonly attribute AudioParam frequency;
  readonly attribute AudioParam detune;
  readonly attribute AudioParam Q;
  readonly attribute AudioParam gain;
  // the AudioParam model of https://github.com/servo/servo/issues/21659 needs to
  // be implemented before we implement this
  // void getFrequencyResponse (Float32Array frequencyHz, Float32Array magResponse, Float32Array phaseResponse);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/FileAPI/#blob

[Exposed=(Window,Worker)]
interface Blob {
  [Throws] constructor(optional sequence<BlobPart> blobParts,
    optional BlobPropertyBag options = {});

  readonly attribute unsigned long long size;
  readonly attribute DOMString type;

  // slice Blob into byte-ranged chunks
  Blob slice(optional [Clamp] long long start,
             optional [Clamp] long long end,
             optional DOMString contentType);

  [NewObject] object stream();
  [NewObject] Promise<DOMString> text();
  [NewObject] Promise<ArrayBuffer> arrayBuffer();
};

dictionary BlobPropertyBag {
  DOMString type = "";
};

typedef (ArrayBuffer or ArrayBufferView or Blob or DOMString) BlobPart;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/#bluetooth

dictionary BluetoothDataFilterInit {
  BufferSource dataPrefix;
  BufferSource mask;
};

dictionary BluetoothLEScanFilterInit {
  sequence<BluetoothServiceUUID> services;
  DOMString name;
  DOMString namePrefix;
  // Maps unsigned shorts to BluetoothDataFilters.
  record<DOMString, BluetoothDataFilterInit> manufacturerData;
  // Maps BluetoothServiceUUIDs to BluetoothDataFilters.
  record<DOMString, BluetoothDataFilterInit> serviceData;
};

dictionary RequestDeviceOptions {
  sequence<BluetoothLEScanFilterInit> filters;
  sequence<BluetoothServiceUUID> optionalServices = [];
  boolean acceptAllDevices = false;
};

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface Bluetooth : EventTarget {
  [SecureContext]
  Promise<boolean> getAvailability();
  [SecureContext]
  attribute EventHandler onavailabilitychanged;
  // [SecureContext, SameObject]
  // readonly attribute BluetoothDevice? referringDevice;
  [SecureContext]
  Promise<BluetoothDevice> requestDevice(optional RequestDeviceOptions options = {});
};

// Bluetooth includes BluetoothDeviceEventHandlers;
// Bluetooth includes CharacteristicEventHandlers;
// Bluetooth includes ServiceEventHandlers;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/#advertising-events

/*interface BluetoothManufacturerDataMap {
  readonly maplike<unsigned short, DataView>;
};
interface BluetoothServiceDataMap {
  readonly maplike<UUID, DataView>;
};*/
[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothAdvertisingEvent : Event {
  [Throws] constructor(DOMString type, BluetoothAdvertisingEventInit init);
  [SameObject]
  readonly attribute BluetoothDevice device;
  // readonly attribute FrozenArray<UUID> uuids;
  readonly attribute DOMString? name;
  readonly attribute unsigned short? appearance;
  readonly attribute byte? txPower;
  readonly attribute byte? rssi;
  // [SameObject]
  // readonly attribute BluetoothManufacturerDataMap manufacturerData;
  // [SameObject]
  // readonly attribute BluetoothServiceDataMap serviceData;
};
dictionary BluetoothAdvertisingEventInit : EventInit {
  required BluetoothDevice device;
  // sequence<(DOMString or unsigned long)> uuids;
  DOMString name;
  unsigned short appearance;
  byte txPower;
  byte rssi;
  // Map manufacturerData;
  // Map serviceData;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/#characteristicproperties

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothCharacteristicProperties {
  readonly attribute boolean broadcast;
  readonly attribute boolean read;
  readonly attribute boolean writeWithoutResponse;
  readonly attribute boolean write;
  readonly attribute boolean notify;
  readonly attribute boolean indicate;
  readonly attribute boolean authenticatedSignedWrites;
  readonly attribute boolean reliableWrite;
  readonly attribute boolean writableAuxiliaries;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/#bluetoothdevice

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothDevice : EventTarget {
  readonly attribute DOMString id;
  readonly attribute DOMString? name;
  readonly attribute BluetoothRemoteGATTServer? gatt;

  Promise<undefined> watchAdvertisements();
  undefined unwatchAdvertisements();
  readonly attribute boolean watchingAdvertisements;
};

interface mixin BluetoothDeviceEventHandlers {
  attribute EventHandler ongattserverdisconnected;
};

// BluetoothDevice includes EventTarget;
BluetoothDevice includes BluetoothDeviceEventHandlers;
// BluetoothDevice includes CharacteristicEventHandlers;
// BluetoothDevice includes ServiceEventHandlers;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/#bluetoothpermissionresult

dictionary BluetoothPermissionDescriptor : PermissionDescriptor {
  DOMString deviceId;
  // These match RequestDeviceOptions.
  sequence<BluetoothLEScanFilterInit> filters;
  sequence<BluetoothServiceUUID> optionalServices = [];
  boolean acceptAllDevices = false;
};

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothPermissionResult : PermissionStatus {
  // attribute FrozenArray<BluetoothDevice> devices;
  // Workaround until FrozenArray get implemented.
  sequence<BluetoothDevice> devices();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/#bluetoothremotegattcharacteristic

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothRemoteGATTCharacteristic : EventTarget {
  [SameObject]
  readonly attribute BluetoothRemoteGATTService service;
  readonly attribute DOMString uuid;
  readonly attribute BluetoothCharacteristicProperties properties;
  readonly attribute ByteString? value;
  Promise<BluetoothRemoteGATTDescriptor> getDescriptor(BluetoothDescriptorUUID descriptor);
  Promise<sequence<BluetoothRemoteGATTDescriptor>>
  getDescriptors(optional BluetoothDescriptorUUID descriptor);
  Promise<ByteString> readValue();
  //Promise<DataView> readValue();
  Promise<undefined> writeValue(BufferSource value);
  Promise<BluetoothRemoteGATTCharacteristic> startNotifications();
  Promise<BluetoothRemoteGATTCharacteristic> stopNotifications();
};

interface mixin CharacteristicEventHandlers {
  attribute EventHandler oncharacteristicvaluechanged;
};

// BluetoothRemoteGATTCharacteristic includes EventTarget;
BluetoothRemoteGATTCharacteristic includes CharacteristicEventHandlers;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// http://webbluetoothcg.github.io/web-bluetooth/#bluetoothremotegattdescriptor

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothRemoteGATTDescriptor {
  [SameObject]
  readonly attribute BluetoothRemoteGATTCharacteristic characteristic;
  readonly attribute DOMString uuid;
  readonly attribute ByteString? value;
  Promise<ByteString> readValue();
  //Promise<DataView> readValue();
  Promise<undefined> writeValue(BufferSource value);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

//https://webbluetoothcg.github.io/web-bluetooth/#bluetoothremotegattserver

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothRemoteGATTServer {
  [SameObject]
  readonly attribute BluetoothDevice device;
  readonly attribute boolean connected;
  Promise<BluetoothRemoteGATTServer> connect();
  [Throws]
  undefined disconnect();
  Promise<BluetoothRemoteGATTService> getPrimaryService(BluetoothServiceUUID service);
  Promise<sequence<BluetoothRemoteGATTService>> getPrimaryServices(optional BluetoothServiceUUID service);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/#bluetoothremotegattservice

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothRemoteGATTService : EventTarget {
  [SameObject]
  readonly attribute BluetoothDevice device;
  readonly attribute DOMString uuid;
  readonly attribute boolean isPrimary;
  Promise<BluetoothRemoteGATTCharacteristic> getCharacteristic(BluetoothCharacteristicUUID characteristic);
  Promise<sequence<BluetoothRemoteGATTCharacteristic>>
  getCharacteristics(optional BluetoothCharacteristicUUID characteristic);
  Promise<BluetoothRemoteGATTService> getIncludedService(BluetoothServiceUUID service);
  Promise<sequence<BluetoothRemoteGATTService>> getIncludedServices(optional BluetoothServiceUUID service);
};

interface mixin ServiceEventHandlers {
  attribute EventHandler onserviceadded;
  attribute EventHandler onservicechanged;
  attribute EventHandler onserviceremoved;
};

// BluetoothRemoteGATTService includes EventTarget;
// BluetoothRemoteGATTService includes CharacteristicEventHandlers;
BluetoothRemoteGATTService includes ServiceEventHandlers;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/#bluetoothuuid

[Exposed=Window, Pref="dom.bluetooth.enabled"]
interface BluetoothUUID {
  [Throws]
  static UUID getService(BluetoothServiceUUID name);
  [Throws]
  static UUID getCharacteristic(BluetoothCharacteristicUUID name);
  [Throws]
  static UUID getDescriptor(BluetoothDescriptorUUID name);
  static UUID canonicalUUID([EnforceRange] unsigned long alias);
};

typedef DOMString UUID;
typedef (DOMString or unsigned long) BluetoothServiceUUID;
typedef (DOMString or unsigned long) BluetoothCharacteristicUUID;
typedef (DOMString or unsigned long) BluetoothDescriptorUUID;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://fetch.spec.whatwg.org/#body

[Exposed=(Window,Worker)]
interface mixin Body {
  readonly attribute boolean bodyUsed;
  readonly attribute object? body;

  [NewObject] Promise<ArrayBuffer> arrayBuffer();
  [NewObject] Promise<Blob> blob();
  [NewObject] Promise<FormData> formData();
  [NewObject] Promise<any> json();
  [NewObject] Promise<USVString> text();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://html.spec.whatwg.org/multipage/#broadcastchannel
 */

[Exposed=(Window,Worker)]
interface BroadcastChannel : EventTarget {
  constructor(DOMString name);

  readonly attribute DOMString name;
  [Throws] undefined postMessage(any message);
  undefined close();
  attribute EventHandler onmessage;
  attribute EventHandler onmessageerror;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-cdatasection
 */

[Exposed=Window]
interface CDATASection : Text {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * http://dev.w3.org/csswg/cssom/#the-css-interface
 */

[Abstract, Exposed=Window]
interface CSS {
  [Throws]
  static DOMString escape(DOMString ident);
};

// https://drafts.csswg.org/css-conditional-3/#the-css-interface
partial interface CSS {
  static boolean supports(DOMString property, DOMString value);
  static boolean supports(DOMString conditionText);
};

// https://drafts.css-houdini.org/css-paint-api-1/#paint-worklet
partial interface CSS {
    [SameObject, Pref="dom.worklet.enabled"] static readonly attribute Worklet paintWorklet;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/css-conditional/#cssconditionrule
[Abstract, Exposed=Window]
interface CSSConditionRule : CSSGroupingRule {
    readonly attribute DOMString conditionText;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/css-fonts/#cssfontfacerule is unfortunately not web-compatible:
// https://github.com/w3c/csswg-drafts/issues/825

// https://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/css.html#CSS-CSSFontFaceRule ,
// plus extended attributes matching CSSStyleRule
[Exposed=Window]
interface CSSFontFaceRule : CSSRule {
  // [SameObject, PutForwards=cssText] readonly attribute CSSStyleDeclaration style;
};

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-cssgroupingrule-interface
[Abstract, Exposed=Window]
interface CSSGroupingRule : CSSRule {
  [SameObject] readonly attribute CSSRuleList cssRules;
  [Throws] unsigned long insertRule(DOMString rule, unsigned long index);
  [Throws] undefined deleteRule(unsigned long index);
};

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#cssimportrule
[Exposed=Window]
interface CSSImportRule : CSSRule {
  // readonly attribute DOMString href;
  // [SameObject, PutForwards=mediaText] readonly attribute MediaList media;
  // [SameObject] readonly attribute CSSStyleSheet styleSheet;
  readonly attribute DOMString? layerName;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/css-animations/#interface-csskeyframerule
[Exposed=Window]
interface CSSKeyframeRule : CSSRule {
  //          attribute DOMString           keyText;
  readonly attribute CSSStyleDeclaration style;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/css-animations/#interface-csskeyframesrule
[Exposed=Window]
interface CSSKeyframesRule : CSSRule {
  [SetterThrows]
           attribute DOMString   name;
  readonly attribute CSSRuleList cssRules;

  undefined            appendRule(DOMString rule);
  undefined            deleteRule(DOMString select);
  CSSKeyframeRule? findRule(DOMString select);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/css-cascade-5/#the-csslayerblockrule-interface
[Exposed=Window]
interface CSSLayerBlockRule : CSSGroupingRule {
  readonly attribute DOMString name;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/css-cascade-5/#the-csslayerstatementrule-interface
[Exposed=Window]
interface CSSLayerStatementRule : CSSRule {
  readonly attribute /*FrozenArray<ResizeObserverSize>*/any nameList;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-cssmediarule-interface
// https://drafts.csswg.org/css-conditional/#cssmediarule
[Exposed=Window]
interface CSSMediaRule : CSSConditionRule {
  [SameObject, PutForwards=mediaText] readonly attribute MediaList media;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-cssnamespacerule-interface
[Exposed=Window]
interface CSSNamespaceRule : CSSRule {
  readonly attribute DOMString namespaceURI;
  readonly attribute DOMString prefix;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-cssrule-interface
[Abstract, Exposed=Window]
interface CSSRule {
  const unsigned short STYLE_RULE = 1;
  const unsigned short CHARSET_RULE = 2; // historical
  const unsigned short IMPORT_RULE = 3;
  const unsigned short MEDIA_RULE = 4;
  const unsigned short FONT_FACE_RULE = 5;
  const unsigned short PAGE_RULE = 6;
  const unsigned short MARGIN_RULE = 9;
  const unsigned short NAMESPACE_RULE = 10;

  readonly attribute unsigned short type;
  attribute DOMString cssText;
  // readonly attribute CSSRule? parentRule;
  readonly attribute CSSStyleSheet? parentStyleSheet;
};

// https://drafts.csswg.org/css-animations/#interface-cssrule-idl
partial interface CSSRule {
    const unsigned short KEYFRAMES_RULE = 7;
    const unsigned short KEYFRAME_RULE = 8;
};

// https://drafts.csswg.org/css-conditional-3/#extentions-to-cssrule-interface
partial interface CSSRule {
    const unsigned short SUPPORTS_RULE = 12;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#cssrulelist
// [LegacyArrayClass]
[Exposed=Window]
interface CSSRuleList {
  getter CSSRule? item(unsigned long index);
  readonly attribute unsigned long length;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * http://dev.w3.org/csswg/cssom/#the-cssstyledeclaration-interface
 *
 * Copyright © 2013 W3C® (MIT, ERCIM, Keio, Beihang), All Rights Reserved.
 */

[Exposed=Window]
interface CSSStyleDeclaration {
  [CEReactions, SetterThrows]
           attribute DOMString cssText;
  readonly attribute unsigned long length;
  getter DOMString item(unsigned long index);
  DOMString getPropertyValue(DOMString property);
  DOMString getPropertyPriority(DOMString property);
  [CEReactions, Throws]
  undefined setProperty(DOMString property, [LegacyNullToEmptyString] DOMString value,
                                       optional [LegacyNullToEmptyString] DOMString priority = "");
  [CEReactions, Throws]
  DOMString removeProperty(DOMString property);
  // readonly attribute CSSRule? parentRule;
  [CEReactions, SetterThrows]
           attribute DOMString cssFloat;
};

// Auto-generated in GlobalGen.py: accessors for each CSS property
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-cssstylerule-interface
[Exposed=Window]
interface CSSStyleRule : CSSRule {
  attribute DOMString selectorText;
  [SameObject, PutForwards=cssText] readonly attribute CSSStyleDeclaration style;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-cssstylesheet-interface
[Exposed=Window]
interface CSSStyleSheet : StyleSheet {
  // readonly attribute CSSRule? ownerRule;
  [Throws, SameObject] readonly attribute CSSRuleList cssRules;
  [Throws] unsigned long insertRule(DOMString rule, optional unsigned long index = 0);
  [Throws] undefined deleteRule(unsigned long index);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.css-houdini.org/css-typed-om-1/#cssstylevalue
// NOTE: should this be exposed to Window?
[Pref="dom.worklet.enabled", Exposed=(Worklet)]
interface CSSStyleValue {
    stringifier;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/css-conditional/#csssupportsrule
[Exposed=Window]
interface CSSSupportsRule : CSSConditionRule {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#2dcontext

// typedef (HTMLImageElement or
//          SVGImageElement) HTMLOrSVGImageElement;
typedef HTMLImageElement HTMLOrSVGImageElement;

typedef (HTMLOrSVGImageElement or
         /*HTMLVideoElement or*/
         HTMLCanvasElement or
         /*ImageBitmap or*/
         OffscreenCanvas or
         /*VideoFrame or*/
         /*CSSImageValue*/ CSSStyleValue) CanvasImageSource;

enum CanvasFillRule { "nonzero", "evenodd" };

[Exposed=Window]
interface CanvasRenderingContext2D {
  // back-reference to the canvas
  readonly attribute HTMLCanvasElement canvas;
};
CanvasRenderingContext2D includes CanvasState;
CanvasRenderingContext2D includes CanvasTransform;
CanvasRenderingContext2D includes CanvasCompositing;
CanvasRenderingContext2D includes CanvasImageSmoothing;
CanvasRenderingContext2D includes CanvasFillStrokeStyles;
CanvasRenderingContext2D includes CanvasShadowStyles;
CanvasRenderingContext2D includes CanvasFilters;
CanvasRenderingContext2D includes CanvasRect;
CanvasRenderingContext2D includes CanvasDrawPath;
CanvasRenderingContext2D includes CanvasUserInterface;
CanvasRenderingContext2D includes CanvasText;
CanvasRenderingContext2D includes CanvasDrawImage;
CanvasRenderingContext2D includes CanvasImageData;
CanvasRenderingContext2D includes CanvasPathDrawingStyles;
CanvasRenderingContext2D includes CanvasTextDrawingStyles;
CanvasRenderingContext2D includes CanvasPath;

interface mixin CanvasState {
  // state
  undefined save(); // push state on state stack
  undefined restore(); // pop state stack and restore state
  undefined reset();
};

interface mixin CanvasTransform {
  // transformations (default transform is the identity matrix)
  undefined scale(unrestricted double x, unrestricted double y);
  undefined rotate(unrestricted double angle);
  undefined translate(unrestricted double x, unrestricted double y);
  undefined transform(unrestricted double a,
                 unrestricted double b,
                 unrestricted double c,
                 unrestricted double d,
                 unrestricted double e,
                 unrestricted double f);

  [NewObject] DOMMatrix getTransform();
  undefined setTransform(unrestricted double a,
                    unrestricted double b,
                    unrestricted double c,
                    unrestricted double d,
                    unrestricted double e,
                    unrestricted double f);
  // void setTransform(optional DOMMatrixInit matrix);
  undefined resetTransform();
};

interface mixin CanvasCompositing {
  // compositing
  attribute unrestricted double globalAlpha; // (default 1.0)
  attribute DOMString globalCompositeOperation; // (default source-over)
};

interface mixin CanvasImageSmoothing {
  // image smoothing
  attribute boolean imageSmoothingEnabled; // (default true)
  // attribute ImageSmoothingQuality imageSmoothingQuality; // (default low)
};

interface mixin CanvasFillStrokeStyles {
  // colours and styles (see also the CanvasDrawingStyles interface)
  attribute (DOMString or CanvasGradient or CanvasPattern) strokeStyle; // (default black)
  attribute (DOMString or CanvasGradient or CanvasPattern) fillStyle; // (default black)
  CanvasGradient createLinearGradient(double x0, double y0, double x1, double y1);
  [Throws]
  CanvasGradient createRadialGradient(double x0, double y0, double r0, double x1, double y1, double r1);
  [Throws]
  CanvasPattern? createPattern(CanvasImageSource image, [LegacyNullToEmptyString] DOMString repetition);
};

interface mixin CanvasShadowStyles {
  // shadows
  attribute unrestricted double shadowOffsetX; // (default 0)
  attribute unrestricted double shadowOffsetY; // (default 0)
  attribute unrestricted double shadowBlur; // (default 0)
  attribute DOMString shadowColor; // (default transparent black)
};

interface mixin CanvasFilters {
  // filters
  //attribute DOMString filter; // (default "none")
};

interface mixin CanvasRect {
  // rects
  undefined clearRect(unrestricted double x, unrestricted double y, unrestricted double w, unrestricted double h);
  undefined fillRect(unrestricted double x, unrestricted double y, unrestricted double w, unrestricted double h);
  undefined strokeRect(unrestricted double x, unrestricted double y, unrestricted double w, unrestricted double h);
};

interface mixin CanvasDrawPath {
  // path API (see also CanvasPath)
  undefined beginPath();
  undefined fill(optional CanvasFillRule fillRule = "nonzero");
  //void fill(Path2D path, optional CanvasFillRule fillRule = "nonzero");
  undefined stroke();
  //void stroke(Path2D path);
  undefined clip(optional CanvasFillRule fillRule = "nonzero");
  //void clip(Path2D path, optional CanvasFillRule fillRule = "nonzero");
  boolean isPointInPath(unrestricted double x, unrestricted double y,
                        optional CanvasFillRule fillRule = "nonzero");
  //boolean isPointInPath(Path2D path, unrestricted double x, unrestricted double y,
  //                      optional CanvasFillRule fillRule = "nonzero");
  //boolean isPointInStroke(unrestricted double x, unrestricted double y);
  //boolean isPointInStroke(Path2D path, unrestricted double x, unrestricted double y);
};

interface mixin CanvasUserInterface {
  //void drawFocusIfNeeded(Element element);
  //void drawFocusIfNeeded(Path2D path, Element element);
  //void scrollPathIntoView();
  //void scrollPathIntoView(Path2D path);
};

interface mixin CanvasText {
  // text (see also the CanvasPathDrawingStyles and CanvasTextDrawingStyles interfaces)
  [Pref="dom.canvas_text.enabled"]
  undefined fillText(DOMString text, unrestricted double x, unrestricted double y,
                optional unrestricted double maxWidth);
  //void strokeText(DOMString text, unrestricted double x, unrestricted double y,
  //                optional unrestricted double maxWidth);
  [Pref="dom.canvas_text.enabled"]
  TextMetrics measureText(DOMString text);
};

interface mixin CanvasDrawImage {
  // drawing images
  [Throws]
  undefined drawImage(CanvasImageSource image, unrestricted double dx, unrestricted double dy);
  [Throws]
  undefined drawImage(CanvasImageSource image, unrestricted double dx, unrestricted double dy,
                                          unrestricted double dw, unrestricted double dh);
  [Throws]
  undefined drawImage(CanvasImageSource image, unrestricted double sx, unrestricted double sy,
                                          unrestricted double sw, unrestricted double sh,
                                          unrestricted double dx, unrestricted double dy,
                                          unrestricted double dw, unrestricted double dh);
};

interface mixin CanvasImageData {
  // pixel manipulation
  [Throws]
  ImageData createImageData(long sw, long sh);
  [Throws]
  ImageData createImageData(ImageData imagedata);
  [Throws]
  ImageData getImageData(long sx, long sy, long sw, long sh);
  undefined putImageData(ImageData imagedata, long dx, long dy);
  undefined putImageData(ImageData imagedata,
                    long dx, long dy,
                    long dirtyX, long dirtyY,
                    long dirtyWidth, long dirtyHeight);
};

enum CanvasLineCap { "butt", "round", "square" };
enum CanvasLineJoin { "round", "bevel", "miter"};
enum CanvasTextAlign { "start", "end", "left", "right", "center" };
enum CanvasTextBaseline { "top", "hanging", "middle", "alphabetic", "ideographic", "bottom" };
enum CanvasDirection { "ltr", "rtl", "inherit" };

interface mixin CanvasPathDrawingStyles {
  // line caps/joins
  attribute unrestricted double lineWidth; // (default 1)
  attribute CanvasLineCap lineCap; // (default "butt")
  attribute CanvasLineJoin lineJoin; // (default "miter")
  attribute unrestricted double miterLimit; // (default 10)

  // dashed lines
  //void setLineDash(sequence<unrestricted double> segments); // default empty
  //sequence<unrestricted double> getLineDash();
  //attribute unrestricted double lineDashOffset;
};

interface mixin CanvasTextDrawingStyles {
  // text
  attribute DOMString font; // (default 10px sans-serif)
  attribute CanvasTextAlign textAlign; // "start", "end", "left", "right", "center" (default: "start")
  attribute CanvasTextBaseline textBaseline; // "top", "hanging", "middle", "alphabetic",
                                      // "ideographic", "bottom" (default: "alphabetic")
  attribute CanvasDirection direction; // "ltr", "rtl", "inherit" (default: "inherit")
};

interface mixin CanvasPath {
  // shared path API methods
  undefined closePath();
  undefined moveTo(unrestricted double x, unrestricted double y);
  undefined lineTo(unrestricted double x, unrestricted double y);
  undefined quadraticCurveTo(unrestricted double cpx, unrestricted double cpy,
                        unrestricted double x, unrestricted double y);

  undefined bezierCurveTo(unrestricted double cp1x,
                     unrestricted double cp1y,
                     unrestricted double cp2x,
                     unrestricted double cp2y,
                     unrestricted double x,
                     unrestricted double y);

  [Throws]
  undefined arcTo(unrestricted double x1, unrestricted double y1,
             unrestricted double x2, unrestricted double y2,
             unrestricted double radius);

  undefined rect(unrestricted double x, unrestricted double y, unrestricted double w, unrestricted double h);

  [Throws]
  undefined arc(unrestricted double x, unrestricted double y, unrestricted double radius,
           unrestricted double startAngle, unrestricted double endAngle, optional boolean anticlockwise = false);

  [Throws]
  undefined ellipse(unrestricted double x, unrestricted double y, unrestricted double radius_x,
               unrestricted double radius_y, unrestricted double rotation, unrestricted double startAngle,
               unrestricted double endAngle, optional boolean anticlockwise = false);
};

[Exposed=(Window, PaintWorklet, Worker)]
interface CanvasGradient {
  // opaque object
  [Throws]
  undefined addColorStop(double offset, DOMString color);
};

[Exposed=(Window, PaintWorklet, Worker)]
interface CanvasPattern {
  // opaque object
  //undefined setTransform(optional DOMMatrix2DInit transform = {});
};

[Exposed=(Window,Worker),
 Serializable]
interface ImageData {
  [Throws] constructor(unsigned long sw, unsigned long sh/*, optional ImageDataSettings settings = {}*/);
  [Throws] constructor(/* Uint8ClampedArray */ object data, unsigned long sw, optional unsigned long sh
              /*, optional ImageDataSettings settings = {}*/);

  readonly attribute unsigned long width;
  readonly attribute unsigned long height;
  [Throws] readonly attribute Uint8ClampedArray data;
  //readonly attribute PredefinedColorSpace colorSpace;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#channelmergernode
 */

dictionary ChannelMergerOptions : AudioNodeOptions {
  unsigned long numberOfInputs = 6;
};

[Exposed=Window]
interface ChannelMergerNode : AudioNode {
  [Throws] constructor(BaseAudioContext context, optional ChannelMergerOptions options = {});
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#channelsplitternode
 */

dictionary ChannelSplitterOptions : AudioNodeOptions {
  unsigned long numberOfOutputs = 6;
};

[Exposed=Window]
interface ChannelSplitterNode : AudioNode {
  [Throws] constructor(BaseAudioContext context, optional ChannelSplitterOptions options = {});
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#characterdata
 *
 * Copyright © 2012 W3C® (MIT, ERCIM, Keio), All Rights Reserved. W3C
 * liability, trademark and document use rules apply.
 */

[Exposed=Window, Abstract]
interface CharacterData : Node {
  [Pure] attribute [LegacyNullToEmptyString] DOMString data;
  [Pure] readonly attribute unsigned long length;
  [Pure, Throws]
  DOMString substringData(unsigned long offset, unsigned long count);
  undefined appendData(DOMString data);
  [Throws]
  undefined insertData(unsigned long offset, DOMString data);
  [Throws]
  undefined deleteData(unsigned long offset, unsigned long count);
  [Throws]
  undefined replaceData(unsigned long offset, unsigned long count, DOMString data);
};

CharacterData includes ChildNode;
CharacterData includes NonDocumentTypeChildNode;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://dom.spec.whatwg.org/#interface-childnode
 */

interface mixin ChildNode {
  [Throws, CEReactions, Unscopable]
  undefined before((Node or DOMString)... nodes);
  [Throws, CEReactions, Unscopable]
  undefined after((Node or DOMString)... nodes);
  [Throws, CEReactions, Unscopable]
  undefined replaceWith((Node or DOMString)... nodes);
  [CEReactions, Unscopable]
  undefined remove();
};

interface mixin NonDocumentTypeChildNode {
  [Pure]
  readonly attribute Element? previousElementSibling;
  [Pure]
  readonly attribute Element? nextElementSibling;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/ServiceWorker/#client

[Pref="dom.serviceworker.enabled", Exposed=ServiceWorker]
interface Client {
  readonly attribute USVString url;
  readonly attribute FrameType frameType;
  readonly attribute DOMString id;
  //void postMessage(any message, optional sequence<Transferable> transfer);
};

enum FrameType {
  "auxiliary",
  "top-level",
  "nested",
  "none"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

//https://html.spec.whatwg.org/multipage/#the-closeevent-interfaces
[Exposed=(Window,Worker)]
interface CloseEvent : Event {
  [Throws] constructor(DOMString type, optional CloseEventInit eventInitDict = {});
  readonly attribute boolean wasClean;
  readonly attribute unsigned short code;
  readonly attribute DOMString reason;
};

dictionary CloseEventInit : EventInit {
  boolean wasClean = false;
  unsigned short code = 0;
  DOMString reason = "";
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#comment
 *
 * Copyright © 2012 W3C® (MIT, ERCIM, Keio), All Rights Reserved. W3C
 * liability, trademark and document use rules apply.
 */

[Exposed=Window]
interface Comment : CharacterData {
  [Throws] constructor(optional DOMString data = "");
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/uievents/#idl-compositionevent
 *
 */

// https://w3c.github.io/uievents/#idl-compositionevent
[Exposed=Window, Pref="dom.composition_event.enabled"]
interface CompositionEvent : UIEvent {
  [Throws] constructor(DOMString type, optional CompositionEventInit eventInitDict = {});
  readonly attribute DOMString data;
};

// https://w3c.github.io/uievents/#idl-compositioneventinit
dictionary CompositionEventInit : UIEventInit {
  DOMString data = "";
};

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://console.spec.whatwg.org/

[ClassString="Console",
 Exposed=(Window,Worker,Worklet),
 ProtoObjectHack]
namespace console {
  // Logging
  undefined log(any... messages);
  undefined debug(any... messages);
  undefined info(any... messages);
  undefined warn(any... messages);
  undefined error(any... messages);
  undefined assert(boolean condition, optional any message);
  undefined clear();

  // Counting
  undefined count(optional DOMString label = "default");
  undefined countReset(optional DOMString label = "default");

  // Grouping
  undefined group(any... data);
  undefined groupCollapsed(any... data);
  undefined groupEnd();

  // Timing
  undefined time(DOMString message);
  undefined timeEnd(DOMString message);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#ConstantSourceNode
 */

dictionary ConstantSourceOptions: AudioNodeOptions {
  float offset = 1;
};

[Exposed=Window]
interface ConstantSourceNode : AudioScheduledSourceNode {
  [Throws] constructor(BaseAudioContext context, optional ConstantSourceOptions options = {});
  readonly attribute AudioParam offset;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dvcs.w3.org/hg/webcrypto-api/raw-file/tip/spec/Overview.html#crypto-interface
 *
 */

[Exposed=(Window,Worker)]
interface mixin GlobalCrypto {
  readonly attribute Crypto crypto;
};

Window includes GlobalCrypto;
WorkerGlobalScope includes GlobalCrypto;

[Exposed=(Window,Worker)]
interface Crypto {
  //readonly attribute SubtleCrypto subtle;
  [Throws]
  ArrayBufferView getRandomValues(ArrayBufferView array);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#customelementregistry
[Exposed=Window, Pref="dom.custom_elements.enabled"]
interface CustomElementRegistry {
  [Throws, CEReactions]
  undefined define(
    DOMString name,
    CustomElementConstructor constructor_,
    optional ElementDefinitionOptions options = {}
  );

  any get(DOMString name);

  Promise<CustomElementConstructor> whenDefined(DOMString name);

  [CEReactions] undefined upgrade(Node root);
};

callback CustomElementConstructor = HTMLElement();

dictionary ElementDefinitionOptions {
  DOMString extends;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * For more information on this interface please see
 * https://dom.spec.whatwg.org/#interface-customevent
 *
 * To the extent possible under law, the editors have waived
 * all copyright and related or neighboring rights to this work.
 * In addition, as of 1 May 2014, the editors have made this specification
 * available under the Open Web Foundation Agreement Version 1.0,
 * which is available at
 * http://www.openwebfoundation.org/legal/the-owf-1-0-agreements/owfa-1-0.
 */

[Exposed=(Window,Worker)]
interface CustomEvent : Event {
  [Throws] constructor(DOMString type, optional CustomEventInit eventInitDict = {});
  readonly attribute any detail;

  undefined initCustomEvent(DOMString type, boolean bubbles, boolean cancelable, any detail);
};

dictionary CustomEventInit : EventInit {
  any detail = null;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*

/* https://heycam.github.io/webidl/#es-DOMException
 * https://heycam.github.io/webidl/#es-DOMException-constructor-object
 */

[
  ExceptionClass,
  Exposed=(Window,Worker,Worklet,DissimilarOriginWindow)
]
interface DOMException {
  [Throws] constructor(optional DOMString message="", optional DOMString name="Error");
  const unsigned short INDEX_SIZE_ERR = 1;
  const unsigned short DOMSTRING_SIZE_ERR = 2; // historical
  const unsigned short HIERARCHY_REQUEST_ERR = 3;
  const unsigned short WRONG_DOCUMENT_ERR = 4;
  const unsigned short INVALID_CHARACTER_ERR = 5;
  const unsigned short NO_DATA_ALLOWED_ERR = 6; // historical
  const unsigned short NO_MODIFICATION_ALLOWED_ERR = 7;
  const unsigned short NOT_FOUND_ERR = 8;
  const unsigned short NOT_SUPPORTED_ERR = 9;
  const unsigned short INUSE_ATTRIBUTE_ERR = 10; // historical
  const unsigned short INVALID_STATE_ERR = 11;
  const unsigned short SYNTAX_ERR = 12;
  const unsigned short INVALID_MODIFICATION_ERR = 13;
  const unsigned short NAMESPACE_ERR = 14;
  const unsigned short INVALID_ACCESS_ERR = 15;
  const unsigned short VALIDATION_ERR = 16; // historical
  const unsigned short TYPE_MISMATCH_ERR = 17; // historical; use JavaScript's TypeError instead
  const unsigned short SECURITY_ERR = 18;
  const unsigned short NETWORK_ERR = 19;
  const unsigned short ABORT_ERR = 20;
  const unsigned short URL_MISMATCH_ERR = 21;
  const unsigned short QUOTA_EXCEEDED_ERR = 22;
  const unsigned short TIMEOUT_ERR = 23;
  const unsigned short INVALID_NODE_TYPE_ERR = 24;
  const unsigned short DATA_CLONE_ERR = 25;

  // Error code as u16
  readonly attribute unsigned short code;

  // The name of the error code (ie, a string repr of |code|)
  readonly attribute DOMString name;

  // A custom message set by the thrower.
  readonly attribute DOMString message;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-domimplementation
 *
 * Copyright:
 * To the extent possible under law, the editors have waived all copyright and
 * related or neighboring rights to this work.
 */

[Exposed=Window]
interface DOMImplementation {
  [NewObject, Throws]
  DocumentType createDocumentType(DOMString qualifiedName, DOMString publicId,
                                  DOMString systemId);
  [NewObject, Throws]
  XMLDocument createDocument(DOMString? namespace,
                             [LegacyNullToEmptyString] DOMString qualifiedName,
                             optional DocumentType? doctype = null);
  [NewObject]
  Document createHTMLDocument(optional DOMString title);

  [Pure]
  boolean hasFeature(); // useless, always return true
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.fxtf.org/geometry/#dommatrix

[Exposed=(Window,Worker,PaintWorklet),
 LegacyWindowAlias=WebKitCSSMatrix]
interface DOMMatrix : DOMMatrixReadOnly {
    [Throws] constructor(optional (DOMString or sequence<unrestricted double>) init);

    [NewObject, Throws] static DOMMatrix fromMatrix(optional DOMMatrixInit other = {});
    [NewObject, Throws] static DOMMatrix fromFloat32Array(Float32Array array32);
    [NewObject, Throws] static DOMMatrix fromFloat64Array(Float64Array array64);

    // These attributes are simple aliases for certain elements of the 4x4 matrix
    inherit attribute unrestricted double a;
    inherit attribute unrestricted double b;
    inherit attribute unrestricted double c;
    inherit attribute unrestricted double d;
    inherit attribute unrestricted double e;
    inherit attribute unrestricted double f;

    inherit attribute unrestricted double m11;
    inherit attribute unrestricted double m12;
    inherit attribute unrestricted double m13;
    inherit attribute unrestricted double m14;
    inherit attribute unrestricted double m21;
    inherit attribute unrestricted double m22;
    inherit attribute unrestricted double m23;
    inherit attribute unrestricted double m24;
    inherit attribute unrestricted double m31;
    inherit attribute unrestricted double m32;
    inherit attribute unrestricted double m33;
    inherit attribute unrestricted double m34;
    inherit attribute unrestricted double m41;
    inherit attribute unrestricted double m42;
    inherit attribute unrestricted double m43;
    inherit attribute unrestricted double m44;

    // Mutable transform methods
    [Throws] DOMMatrix multiplySelf(optional DOMMatrixInit other = {});
    [Throws] DOMMatrix preMultiplySelf(optional DOMMatrixInit other = {});
    DOMMatrix translateSelf(optional unrestricted double tx = 0,
                            optional unrestricted double ty = 0,
                            optional unrestricted double tz = 0);
    DOMMatrix scaleSelf(optional unrestricted double scaleX = 1,
                        optional unrestricted double scaleY,
                        optional unrestricted double scaleZ = 1,
                        optional unrestricted double originX = 0,
                        optional unrestricted double originY = 0,
                        optional unrestricted double originZ = 0);
    DOMMatrix scale3dSelf(optional unrestricted double scale = 1,
                          optional unrestricted double originX = 0,
                          optional unrestricted double originY = 0,
                          optional unrestricted double originZ = 0);
    DOMMatrix rotateSelf(optional unrestricted double rotX = 0,
                         optional unrestricted double rotY,
                         optional unrestricted double rotZ);
    DOMMatrix rotateFromVectorSelf(optional unrestricted double x = 0,
                                   optional unrestricted double y = 0);
    DOMMatrix rotateAxisAngleSelf(optional unrestricted double x = 0,
                                  optional unrestricted double y = 0,
                                  optional unrestricted double z = 0,
                                  optional unrestricted double angle = 0);
    DOMMatrix skewXSelf(optional unrestricted double sx = 0);
    DOMMatrix skewYSelf(optional unrestricted double sy = 0);
    DOMMatrix invertSelf();

//  DOMMatrix setMatrixValue(DOMString transformList);
};

dictionary DOMMatrix2DInit {
    unrestricted double a;
    unrestricted double b;
    unrestricted double c;
    unrestricted double d;
    unrestricted double e;
    unrestricted double f;
    unrestricted double m11;
    unrestricted double m12;
    unrestricted double m21;
    unrestricted double m22;
    unrestricted double m41;
    unrestricted double m42;
};

dictionary DOMMatrixInit : DOMMatrix2DInit {
    unrestricted double m13 = 0;
    unrestricted double m14 = 0;
    unrestricted double m23 = 0;
    unrestricted double m24 = 0;
    unrestricted double m31 = 0;
    unrestricted double m32 = 0;
    unrestricted double m33 = 1;
    unrestricted double m34 = 0;
    unrestricted double m43 = 0;
    unrestricted double m44 = 1;
    boolean is2D;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://drafts.fxtf.org/geometry-1/#DOMMatrix
 *
 * Copyright:
 * To the extent possible under law, the editors have waived all copyright and
 * related or neighboring rights to this work.
 */

[Exposed=(Window,Worker,PaintWorklet)]
interface DOMMatrixReadOnly {
    [Throws] constructor(optional (DOMString or sequence<unrestricted double>) init);

    [NewObject, Throws] static DOMMatrixReadOnly fromMatrix(optional DOMMatrixInit other = {});
    [NewObject, Throws] static DOMMatrixReadOnly fromFloat32Array(Float32Array array32);
    [NewObject, Throws] static DOMMatrixReadOnly fromFloat64Array(Float64Array array64);

    // These attributes are simple aliases for certain elements of the 4x4 matrix
    readonly attribute unrestricted double a;
    readonly attribute unrestricted double b;
    readonly attribute unrestricted double c;
    readonly attribute unrestricted double d;
    readonly attribute unrestricted double e;
    readonly attribute unrestricted double f;

    readonly attribute unrestricted double m11;
    readonly attribute unrestricted double m12;
    readonly attribute unrestricted double m13;
    readonly attribute unrestricted double m14;
    readonly attribute unrestricted double m21;
    readonly attribute unrestricted double m22;
    readonly attribute unrestricted double m23;
    readonly attribute unrestricted double m24;
    readonly attribute unrestricted double m31;
    readonly attribute unrestricted double m32;
    readonly attribute unrestricted double m33;
    readonly attribute unrestricted double m34;
    readonly attribute unrestricted double m41;
    readonly attribute unrestricted double m42;
    readonly attribute unrestricted double m43;
    readonly attribute unrestricted double m44;

    readonly attribute boolean is2D;
    readonly attribute boolean isIdentity;

    // Immutable transform methods
    DOMMatrix translate(optional unrestricted double tx = 0,
                        optional unrestricted double ty = 0,
                        optional unrestricted double tz = 0);
    DOMMatrix scale(optional unrestricted double scaleX = 1,
                    optional unrestricted double scaleY,
                    optional unrestricted double scaleZ = 1,
                    optional unrestricted double originX = 0,
                    optional unrestricted double originY = 0,
                    optional unrestricted double originZ = 0);
    [NewObject] DOMMatrix scaleNonUniform(optional unrestricted double scaleX = 1,
                                          optional unrestricted double scaleY = 1);
    DOMMatrix scale3d(optional unrestricted double scale = 1,
                      optional unrestricted double originX = 0,
                      optional unrestricted double originY = 0,
                      optional unrestricted double originZ = 0);
    DOMMatrix rotate(optional unrestricted double rotX = 0,
                     optional unrestricted double rotY,
                     optional unrestricted double rotZ);
    DOMMatrix rotateFromVector(optional unrestricted double x = 0,
                               optional unrestricted double y = 0);
    DOMMatrix rotateAxisAngle(optional unrestricted double x = 0,
                              optional unrestricted double y = 0,
                              optional unrestricted double z = 0,
                              optional unrestricted double angle = 0);
    DOMMatrix skewX(optional unrestricted double sx = 0);
    DOMMatrix skewY(optional unrestricted double sy = 0);
    [Throws] DOMMatrix multiply(optional DOMMatrixInit other = {});
    DOMMatrix flipX();
    DOMMatrix flipY();
    DOMMatrix inverse();

    DOMPoint            transformPoint(optional DOMPointInit point = {});
    Float32Array        toFloat32Array();
    Float64Array        toFloat64Array();
//    [Exposed=Window] stringifier;
    [Default] object toJSON();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/DOM-Parsing/#the-domparser-interface
 */

enum SupportedType {
  "text/html",
  "text/xml",
  "application/xml",
  "application/xhtml+xml",
  "image/svg+xml"
};

[Exposed=Window]
interface DOMParser {
  [Throws] constructor();
  [Throws]
  Document parseFromString(DOMString str, SupportedType type);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * http://dev.w3.org/fxtf/geometry/
 *
 * Copyright © 2012 W3C® (MIT, ERCIM, Keio), All Rights Reserved. W3C
 * liability, trademark and document use rules apply.
 */

// http://dev.w3.org/fxtf/geometry/Overview.html#dompoint
[Exposed=(Window,Worker,PaintWorklet)]
interface DOMPoint : DOMPointReadOnly {
    [Throws] constructor(optional unrestricted double x = 0, optional unrestricted double y = 0,
                optional unrestricted double z = 0, optional unrestricted double w = 1);
    [NewObject] static DOMPoint fromPoint(optional DOMPointInit other = {});

    inherit attribute unrestricted double x;
    inherit attribute unrestricted double y;
    inherit attribute unrestricted double z;
    inherit attribute unrestricted double w;
};

dictionary DOMPointInit {
    unrestricted double x = 0;
    unrestricted double y = 0;
    unrestricted double z = 0;
    unrestricted double w = 1;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * http://dev.w3.org/fxtf/geometry/
 *
 * Copyright © 2012 W3C® (MIT, ERCIM, Keio), All Rights Reserved. W3C
 * liability, trademark and document use rules apply.
 */

// http://dev.w3.org/fxtf/geometry/Overview.html#dompointreadonly
[Exposed=(Window,Worker,PaintWorklet)]
interface DOMPointReadOnly {
    [Throws] constructor(optional unrestricted double x = 0, optional unrestricted double y = 0,
                optional unrestricted double z = 0, optional unrestricted double w = 1);
    [NewObject] static DOMPointReadOnly fromPoint(optional DOMPointInit other = {});

    readonly attribute unrestricted double x;
    readonly attribute unrestricted double y;
    readonly attribute unrestricted double z;
    readonly attribute unrestricted double w;

    [Default] object toJSON();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://drafts.fxtf.org/geometry/#DOMQuad
 *
 * Copyright:
 * To the extent possible under law, the editors have waived all copyright and
 * related or neighboring rights to this work.
 */

[Exposed=(Window,Worker)]
interface DOMQuad {
    [Throws] constructor(optional DOMPointInit p1 = {}, optional DOMPointInit p2 = {},
                optional DOMPointInit p3 = {}, optional DOMPointInit p4 = {});
    [NewObject] static DOMQuad fromRect(optional DOMRectInit other = {});
    [NewObject] static DOMQuad fromQuad(optional DOMQuadInit other = {});

    [SameObject] readonly attribute DOMPoint p1;
    [SameObject] readonly attribute DOMPoint p2;
    [SameObject] readonly attribute DOMPoint p3;
    [SameObject] readonly attribute DOMPoint p4;
    [NewObject] DOMRect getBounds();

    [Default] object toJSON();
};

dictionary DOMQuadInit {
    DOMPointInit p1 = {};
    DOMPointInit p2 = {};
    DOMPointInit p3 = {};
    DOMPointInit p4 = {};
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

[Exposed=(Window,Worker)]
// https://drafts.fxtf.org/geometry/#domrect
interface DOMRect : DOMRectReadOnly {
    [Throws] constructor(optional unrestricted double x = 0, optional unrestricted double y = 0,
                optional unrestricted double width = 0, optional unrestricted double height = 0);
    inherit attribute unrestricted double x;
    inherit attribute unrestricted double y;
    inherit attribute unrestricted double width;
    inherit attribute unrestricted double height;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

[Exposed=(Window,Worker)]
// https://drafts.fxtf.org/geometry/#domrect
interface DOMRectReadOnly {
  [Throws] constructor(optional unrestricted double x = 0, optional unrestricted double y = 0,
              optional unrestricted double width = 0, optional unrestricted double height = 0);
  // [NewObject] static DOMRectReadOnly fromRect(optional DOMRectInit other);

  readonly attribute unrestricted double x;
  readonly attribute unrestricted double y;
  readonly attribute unrestricted double width;
  readonly attribute unrestricted double height;
  readonly attribute unrestricted double top;
  readonly attribute unrestricted double right;
  readonly attribute unrestricted double bottom;
  readonly attribute unrestricted double left;

  [Default] object toJSON();
};

// https://drafts.fxtf.org/geometry/#dictdef-domrectinit
dictionary DOMRectInit {
  unrestricted double x = 0;
  unrestricted double y = 0;
  unrestricted double width = 0;
  unrestricted double height = 0;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://html.spec.whatwg.org/multipage/#domstringlist
 *
 * Copyright:
 * To the extent possible under law, the editors have waived all copyright and
 * related or neighboring rights to this work.
 */

[Exposed=(Window,Worker)]
interface DOMStringList {
  readonly attribute unsigned long length;
  getter DOMString? item(unsigned long index);
  boolean contains(DOMString string);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-domstringmap-interface
[Exposed=Window, LegacyOverrideBuiltIns]
interface DOMStringMap {
  getter DOMString (DOMString name);
  [CEReactions, Throws]
  setter undefined (DOMString name, DOMString value);
  [CEReactions]
  deleter undefined (DOMString name);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://dom.spec.whatwg.org/#domtokenlist
[Exposed=Window]
interface DOMTokenList {
  [Pure]
  readonly attribute unsigned long length;
  [Pure]
  getter DOMString? item(unsigned long index);

  [Pure]
  boolean contains(DOMString token);
  [CEReactions, Throws]
  undefined add(DOMString... tokens);
  [CEReactions, Throws]
  undefined remove(DOMString... tokens);
  [CEReactions, Throws]
  boolean toggle(DOMString token, optional boolean force);
  [CEReactions, Throws]
  boolean replace(DOMString token, DOMString newToken);
  [Pure, Throws]
  boolean supports(DOMString token);

  [CEReactions, Pure]
  stringifier attribute DOMString value;

  iterable<DOMString?>;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#dedicatedworkerglobalscope
[Global=(Worker,DedicatedWorker), Exposed=DedicatedWorker]
/*sealed*/ interface DedicatedWorkerGlobalScope : WorkerGlobalScope {
  [Throws] undefined postMessage(any message, sequence<object> transfer);
  [Throws] undefined postMessage(any message, optional PostMessageOptions options = {});
  attribute EventHandler onmessage;

  undefined close();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */


// This is a Servo-specific interface, used to represent locations
// that are not similar-origin, so live in another script thread.
// It is based on the interface for Window, but only contains the
// accessors that do not throw security exceptions when called
// cross-origin.
//
// Note that similar-origin locations are kept in the same script
// thread, so this mechanism cannot be relied upon as the only
// way to enforce security policy.

// https://html.spec.whatwg.org/multipage/#location
[Exposed=(Window,DissimilarOriginWindow), LegacyUnforgeable, LegacyNoInterfaceObject]
interface DissimilarOriginLocation {
  [Throws] attribute USVString href;
  [Throws] undefined assign(USVString url);
  [Throws] undefined replace(USVString url);
  [Throws] undefined reload();
  [Throws] stringifier;

  // TODO: finish this interface
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This is a Servo-specific interface, used to represent windows
// that are not similar-origin, so live in another script thread.
// It is based on the interface for Window, but only contains the
// accessors that do not throw security exceptions when called
// cross-origin.
//
// Note that similar-origin windows are kept in the same script
// thread, so this mechanism cannot be relied upon as the only
// way to enforce security policy.

// https://html.spec.whatwg.org/multipage/#window
[Global, Exposed=(Window,DissimilarOriginWindow), LegacyNoInterfaceObject]
interface DissimilarOriginWindow : GlobalScope {
  [LegacyUnforgeable] readonly attribute WindowProxy window;
  [BinaryName="Self_", Replaceable] readonly attribute WindowProxy self;
  [LegacyUnforgeable] readonly attribute WindowProxy? parent;
  [LegacyUnforgeable] readonly attribute WindowProxy? top;
  [Replaceable] readonly attribute WindowProxy frames;
  [Replaceable] readonly attribute unsigned long length;
  [LegacyUnforgeable] readonly attribute DissimilarOriginLocation location;

  undefined close();
  readonly attribute boolean closed;
  [Throws] undefined postMessage(any message, USVString targetOrigin, optional sequence<object> transfer = []);
  [Throws] undefined postMessage(any message, optional WindowPostMessageOptions options = {});
  attribute any opener;
  undefined blur();
  undefined focus();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://dom.spec.whatwg.org/#interface-document
 * https://html.spec.whatwg.org/multipage/#the-document-object
 */

// https://dom.spec.whatwg.org/#interface-document
[Exposed=Window]
interface Document : Node {
  [Throws] constructor();
  [SameObject]
  readonly attribute DOMImplementation implementation;
  [Constant]
  readonly attribute USVString URL;
  [Constant]
  readonly attribute USVString documentURI;
  // readonly attribute USVString origin;
  readonly attribute DOMString compatMode;
  readonly attribute DOMString characterSet;
  readonly attribute DOMString charset; // legacy alias of .characterSet
  readonly attribute DOMString inputEncoding; // legacy alias of .characterSet
  [Constant]
  readonly attribute DOMString contentType;

  [Pure]
  readonly attribute DocumentType? doctype;
  [Pure]
  readonly attribute Element? documentElement;
  HTMLCollection getElementsByTagName(DOMString qualifiedName);
  HTMLCollection getElementsByTagNameNS(DOMString? namespace, DOMString qualifiedName);
  HTMLCollection getElementsByClassName(DOMString classNames);

  [CEReactions, NewObject, Throws]
  Element createElement(DOMString localName, optional (DOMString or ElementCreationOptions) options = {});
  [CEReactions, NewObject, Throws]
  Element createElementNS(DOMString? namespace, DOMString qualifiedName,
                          optional (DOMString or ElementCreationOptions) options = {});
  [NewObject]
  DocumentFragment createDocumentFragment();
  [NewObject]
  Text createTextNode(DOMString data);
  [NewObject, Throws]
  CDATASection createCDATASection(DOMString data);
  [NewObject]
  Comment createComment(DOMString data);
  [NewObject, Throws]
  ProcessingInstruction createProcessingInstruction(DOMString target, DOMString data);

  [CEReactions, NewObject, Throws]
  Node importNode(Node node, optional boolean deep = false);
  [CEReactions, Throws]
  Node adoptNode(Node node);

  [NewObject, Throws]
  Attr createAttribute(DOMString localName);
  [NewObject, Throws]
  Attr createAttributeNS(DOMString? namespace, DOMString qualifiedName);

  [NewObject, Throws]
  Event createEvent(DOMString interface_);

  [NewObject]
  Range createRange();

  // NodeFilter.SHOW_ALL = 0xFFFFFFFF
  [NewObject]
  NodeIterator createNodeIterator(Node root, optional unsigned long whatToShow = 0xFFFFFFFF,
                                  optional NodeFilter? filter = null);
  [NewObject]
  TreeWalker createTreeWalker(Node root, optional unsigned long whatToShow = 0xFFFFFFFF,
                              optional NodeFilter? filter = null);
};

Document includes NonElementParentNode;
Document includes ParentNode;

enum DocumentReadyState { "loading", "interactive", "complete" };

dictionary ElementCreationOptions {
  DOMString is;
};

// https://html.spec.whatwg.org/multipage/#the-document-object
// [LegacyOverrideBuiltIns]
partial /*sealed*/ interface Document {
  // resource metadata management
  [PutForwards=href, LegacyUnforgeable]
  readonly attribute Location? location;
  [SetterThrows] attribute DOMString domain;
  readonly attribute DOMString referrer;
  [Throws]
  attribute DOMString cookie;
  readonly attribute DOMString lastModified;
  readonly attribute DocumentReadyState readyState;

  // DOM tree accessors
  getter NamedPropertyValue (DOMString name);
  [CEReactions]
           attribute DOMString title;
  // [CEReactions]
  //       attribute DOMString dir;
  [CEReactions, SetterThrows]
           attribute HTMLElement? body;
  readonly attribute HTMLHeadElement? head;
  [SameObject]
  readonly attribute HTMLCollection images;
  [SameObject]
  readonly attribute HTMLCollection embeds;
  [SameObject]
  readonly attribute HTMLCollection plugins;
  [SameObject]
  readonly attribute HTMLCollection links;
  [SameObject]
  readonly attribute HTMLCollection forms;
  [SameObject]
  readonly attribute HTMLCollection scripts;
  NodeList getElementsByName(DOMString elementName);
  readonly attribute HTMLScriptElement? currentScript;

  // dynamic markup insertion
  [CEReactions, Throws]
  Document open(optional DOMString unused1, optional DOMString unused2);
  [CEReactions, Throws]
  WindowProxy? open(USVString url, DOMString name, DOMString features);
  [CEReactions, Throws]
  undefined close();
  [CEReactions, Throws]
  undefined write(DOMString... text);
  [CEReactions, Throws]
  undefined writeln(DOMString... text);

  // user interaction
  readonly attribute Window?/*Proxy?*/ defaultView;
  boolean hasFocus();
  // [CEReactions]
  // attribute DOMString designMode;
  // [CEReactions]
  // boolean execCommand(DOMString commandId, optional boolean showUI = false, optional DOMString value = "");
  // boolean queryCommandEnabled(DOMString commandId);
  // boolean queryCommandIndeterm(DOMString commandId);
  // boolean queryCommandState(DOMString commandId);
  boolean queryCommandSupported(DOMString commandId);
  // DOMString queryCommandValue(DOMString commandId);

  // special event handler IDL attributes that only apply to Document objects
  [LegacyLenientThis] attribute EventHandler onreadystatechange;

  // also has obsolete members
};
Document includes GlobalEventHandlers;
Document includes DocumentAndElementEventHandlers;

// https://html.spec.whatwg.org/multipage/#Document-partial
partial interface Document {
  [CEReactions]
  attribute [LegacyNullToEmptyString] DOMString fgColor;

  // https://github.com/servo/servo/issues/8715
  // [CEReactions, LegacyNullToEmptyString]
  // attribute DOMString linkColor;

  // https://github.com/servo/servo/issues/8716
  // [CEReactions, LegacyNullToEmptyString]
  // attribute DOMString vlinkColor;

  // https://github.com/servo/servo/issues/8717
  // [CEReactions, LegacyNullToEmptyString]
  // attribute DOMString alinkColor;

  [CEReactions]
  attribute [LegacyNullToEmptyString] DOMString bgColor;

  [SameObject]
  readonly attribute HTMLCollection anchors;

  [SameObject]
  readonly attribute HTMLCollection applets;

  undefined clear();
  undefined captureEvents();
  undefined releaseEvents();

  // Tracking issue for document.all: https://github.com/servo/servo/issues/7396
  // readonly attribute HTMLAllCollection all;
};

// https://fullscreen.spec.whatwg.org/#api
partial interface Document {
  [LegacyLenientSetter] readonly attribute boolean fullscreenEnabled;
  [LegacyLenientSetter] readonly attribute Element? fullscreenElement;
  [LegacyLenientSetter] readonly attribute boolean fullscreen; // historical

  Promise<undefined> exitFullscreen();

  attribute EventHandler onfullscreenchange;
  attribute EventHandler onfullscreenerror;
};

Document includes DocumentOrShadowRoot;

// https://w3c.github.io/selection-api/#dom-document
partial interface Document {
  Selection? getSelection();
};


// Servo internal API.
partial interface Document {
  [Throws]
  ShadowRoot servoGetMediaControls(DOMString id);
};

// https://html.spec.whatwg.org/multipage/#dom-document-nameditem-filter
typedef (WindowProxy or Element or HTMLCollection) NamedPropertyValue;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://dom.spec.whatwg.org/#interface-documentfragment
[Exposed=Window]
interface DocumentFragment : Node {
  [Throws] constructor();
};

DocumentFragment includes NonElementParentNode;
DocumentFragment includes ParentNode;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#documentorshadowroot
 * https://w3c.github.io/webcomponents/spec/shadow/#extensions-to-the-documentorshadowroot-mixin
 */

interface mixin DocumentOrShadowRoot {
  // Selection? getSelection();
  Element? elementFromPoint (double x, double y);
  sequence<Element> elementsFromPoint (double x, double y);
  // CaretPosition? caretPositionFromPoint (double x, double y);
  readonly attribute Element? activeElement;
  readonly attribute StyleSheetList styleSheets;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#documenttype
 *
 * Copyright © 2012 W3C® (MIT, ERCIM, Keio), All Rights Reserved. W3C
 * liability, trademark and document use rules apply.
 */

[Exposed=Window]
interface DocumentType : Node {
  [Constant]
  readonly attribute DOMString name;
  [Constant]
  readonly attribute DOMString publicId;
  [Constant]
  readonly attribute DOMString systemId;
};

DocumentType includes ChildNode;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

/**
 * This is defined for [`Dynamic Module`](https://html.spec.whatwg.org/multipage/#fetch-an-import()-module-script-graph)
 * so that we can hold a traceable owner for those dynamic modules which don't hold a owner.
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface DynamicModuleOwner {
  readonly attribute Promise<any> promise;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions scraped from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/EXT_blend_minmax/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface EXTBlendMinmax {
  const GLenum MIN_EXT = 0x8007;
  const GLenum MAX_EXT = 0x8008;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/EXT_color_buffer_half_float/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface EXTColorBufferHalfFloat {
  const GLenum RGBA16F_EXT = 0x881A;
  const GLenum RGB16F_EXT = 0x881B;
  const GLenum FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT = 0x8211;
  const GLenum UNSIGNED_NORMALIZED_EXT = 0x8C17;
}; // interface EXT_color_buffer_half_float
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/EXT_frag_depth/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface EXTFragDepth {
}; // interface EXT_frag_depth
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions scraped from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/EXT_shader_texture_lod/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface EXTShaderTextureLod {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/EXT_texture_filter_anisotropic/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface EXTTextureFilterAnisotropic {
  const GLenum TEXTURE_MAX_ANISOTROPY_EXT       = 0x84FE;
  const GLenum MAX_TEXTURE_MAX_ANISOTROPY_EXT   = 0x84FF;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#element and
 * https://w3c.github.io/DOM-Parsing/ and
 * http://dev.w3.org/csswg/cssom-view/ and
 * http://www.w3.org/TR/selectors-api/
 *
 * Copyright © 2012 W3C® (MIT, ERCIM, Keio), All Rights Reserved. W3C
 * liability, trademark and document use rules apply.
 */

[Exposed=Window]
interface Element : Node {
  [Constant]
  readonly attribute DOMString? namespaceURI;
  [Constant]
  readonly attribute DOMString? prefix;
  [Constant]
  readonly attribute DOMString localName;
  // Not [Constant] because it depends on which document we're in
  [Pure]
  readonly attribute DOMString tagName;

  [CEReactions, Pure]
           attribute DOMString id;
  [CEReactions, Pure]
           attribute DOMString className;
  [SameObject, PutForwards=value]
  readonly attribute DOMTokenList classList;

  [Pure]
  boolean hasAttributes();
  [SameObject]
  readonly attribute NamedNodeMap attributes;
  [Pure]
  sequence<DOMString> getAttributeNames();
  [Pure]
  DOMString? getAttribute(DOMString name);
  [Pure]
  DOMString? getAttributeNS(DOMString? namespace, DOMString localName);
  [CEReactions, Throws]
  boolean toggleAttribute(DOMString name, optional boolean force);
  [CEReactions, Throws]
  undefined setAttribute(DOMString name, DOMString value);
  [CEReactions, Throws]
  undefined setAttributeNS(DOMString? namespace, DOMString name, DOMString value);
  [CEReactions]
  undefined removeAttribute(DOMString name);
  [CEReactions]
  undefined removeAttributeNS(DOMString? namespace, DOMString localName);
  boolean hasAttribute(DOMString name);
  boolean hasAttributeNS(DOMString? namespace, DOMString localName);

  [Pure]
  Attr? getAttributeNode(DOMString name);
  [Pure]
  Attr? getAttributeNodeNS(DOMString? namespace, DOMString localName);
  [CEReactions, Throws]
  Attr? setAttributeNode(Attr attr);
  [CEReactions, Throws]
  Attr? setAttributeNodeNS(Attr attr);
  [CEReactions, Throws]
  Attr removeAttributeNode(Attr oldAttr);

  [Pure, Throws]
  Element? closest(DOMString selectors);
  [Pure, Throws]
  boolean matches(DOMString selectors);
  [Pure, Throws]
  boolean webkitMatchesSelector(DOMString selectors); // historical alias of .matches

  HTMLCollection getElementsByTagName(DOMString localName);
  HTMLCollection getElementsByTagNameNS(DOMString? namespace, DOMString localName);
  HTMLCollection getElementsByClassName(DOMString classNames);

  [CEReactions, Throws]
  Element? insertAdjacentElement(DOMString where_, Element element); // historical
  [Throws]
  undefined insertAdjacentText(DOMString where_, DOMString data);
  [CEReactions, Throws]
  undefined insertAdjacentHTML(DOMString position, DOMString html);

  [Throws, Pref="dom.shadowdom.enabled"] ShadowRoot attachShadow();
};

// http://dev.w3.org/csswg/cssom-view/#extensions-to-the-element-interface
partial interface Element {
  sequence<DOMRect> getClientRects();
  [NewObject]
  DOMRect getBoundingClientRect();

  undefined scroll(optional ScrollToOptions options = {});
  undefined scroll(unrestricted double x, unrestricted double y);

  undefined scrollTo(optional ScrollToOptions options = {});
  undefined scrollTo(unrestricted double x, unrestricted double y);
  undefined scrollBy(optional ScrollToOptions options = {});
  undefined scrollBy(unrestricted double x, unrestricted double y);
  attribute unrestricted double scrollTop;
  attribute unrestricted double scrollLeft;
  readonly attribute long scrollWidth;
  readonly attribute long scrollHeight;

  readonly attribute long clientTop;
  readonly attribute long clientLeft;
  readonly attribute long clientWidth;
  readonly attribute long clientHeight;
};

// https://w3c.github.io/DOM-Parsing/#extensions-to-the-element-interface
partial interface Element {
  [CEReactions, Throws]
  attribute [LegacyNullToEmptyString] DOMString innerHTML;
  [CEReactions, Throws]
  attribute [LegacyNullToEmptyString] DOMString outerHTML;
};

// https://fullscreen.spec.whatwg.org/#api
partial interface Element {
  Promise<undefined> requestFullscreen();
};

Element includes ChildNode;
Element includes NonDocumentTypeChildNode;
Element includes ParentNode;
Element includes ActivatableElement;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

//http://dev.w3.org/csswg/cssom/#elementcssinlinestyle

[Exposed=Window]
interface mixin ElementCSSInlineStyle {
  [SameObject, PutForwards=cssText] readonly attribute CSSStyleDeclaration style;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#elementcontenteditable
[Exposed=Window]
interface mixin ElementContentEditable {
  [CEReactions]
  attribute DOMString contentEditable;
  readonly attribute boolean isContentEditable;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#elementinternals
[Exposed=Window]
interface ElementInternals {
  // Form-associated custom elements

  [Throws] undefined setFormValue((File or USVString or FormData)? value,
                    optional (File or USVString or FormData)? state);

  [Throws] readonly attribute HTMLFormElement? form;

  // flags shouldn't be optional here, #25704
  [Throws] undefined setValidity(optional ValidityStateFlags flags = {},
                   optional DOMString message,
                   optional HTMLElement anchor);
  [Throws] readonly attribute boolean willValidate;
  [Throws] readonly attribute ValidityState validity;
  [Throws] readonly attribute DOMString validationMessage;
  [Throws] boolean checkValidity();
  [Throws] boolean reportValidity();

  [Throws] readonly attribute NodeList labels;
};

// https://html.spec.whatwg.org/multipage/#elementinternals
dictionary ValidityStateFlags {
  boolean valueMissing = false;
  boolean typeMismatch = false;
  boolean patternMismatch = false;
  boolean tooLong = false;
  boolean tooShort = false;
  boolean rangeUnderflow = false;
  boolean rangeOverflow = false;
  boolean stepMismatch = false;
  boolean badInput = false;
  boolean customError = false;
};

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-errorevent-interface

[Exposed=(Window,Worker)]
interface ErrorEvent : Event {
  [Throws] constructor(DOMString type, optional ErrorEventInit eventInitDict = {});
  readonly attribute DOMString message;
  readonly attribute DOMString filename;
  readonly attribute unsigned long lineno;
  readonly attribute unsigned long colno;
  readonly attribute any error;
};

dictionary ErrorEventInit : EventInit {
  DOMString message;
  DOMString filename;
  unsigned long lineno;
  unsigned long colno;
  any error;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * For more information on this interface please see
 * https://dom.spec.whatwg.org/#event
 */

[Exposed=(Window,Worker)]
interface Event {
  [Throws] constructor(DOMString type, optional EventInit eventInitDict = {});
  [Pure]
  readonly attribute DOMString type;
  readonly attribute EventTarget? target;
  readonly attribute EventTarget? srcElement;
  readonly attribute EventTarget? currentTarget;
  sequence<EventTarget> composedPath();

  const unsigned short NONE = 0;
  const unsigned short CAPTURING_PHASE = 1;
  const unsigned short AT_TARGET = 2;
  const unsigned short BUBBLING_PHASE = 3;
  readonly attribute unsigned short eventPhase;

  undefined stopPropagation();
  attribute boolean cancelBubble;
  undefined stopImmediatePropagation();

  [Pure]
  readonly attribute boolean bubbles;
  [Pure]
  readonly attribute boolean cancelable;
  attribute boolean returnValue;  // historical
  undefined preventDefault();
  [Pure]
  readonly attribute boolean defaultPrevented;

  [LegacyUnforgeable]
  readonly attribute boolean isTrusted;
  [Constant]
  readonly attribute DOMHighResTimeStamp timeStamp;

  undefined initEvent(DOMString type, optional boolean bubbles = false, optional boolean cancelable = false);
};

dictionary EventInit {
  boolean bubbles = false;
  boolean cancelable = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://html.spec.whatwg.org/multipage/#eventhandler
 *
 * © Copyright 2004-2011 Apple Computer, Inc., Mozilla Foundation, and
 * Opera Software ASA. You are granted a license to use, reproduce
 * and create derivative works of this document.
 */

[LegacyTreatNonObjectAsNull]
callback EventHandlerNonNull = any (Event event);
typedef EventHandlerNonNull? EventHandler;

[LegacyTreatNonObjectAsNull]
// NOTE(rizo): or type causes codegen issues, disable for now
// callback OnErrorEventHandlerNonNull = any ((Event or DOMString) event, optional DOMString source,
callback OnErrorEventHandlerNonNull = any (Event event, optional DOMString source,
                                               optional unsigned long lineno, optional unsigned long column,
                                               optional any error);
typedef OnErrorEventHandlerNonNull? OnErrorEventHandler;

[LegacyTreatNonObjectAsNull]
callback OnBeforeUnloadEventHandlerNonNull = DOMString? (Event event);
typedef OnBeforeUnloadEventHandlerNonNull? OnBeforeUnloadEventHandler;

// https://html.spec.whatwg.org/multipage/#globaleventhandlers
[Exposed=Window]
interface mixin GlobalEventHandlers {
           attribute EventHandler onabort;
           attribute EventHandler onblur;
           attribute EventHandler oncancel;
           attribute EventHandler oncanplay;
           attribute EventHandler oncanplaythrough;
           attribute EventHandler onchange;
           attribute EventHandler onclick;
           attribute EventHandler onclose;
           attribute EventHandler oncontextmenu;
           attribute EventHandler oncuechange;
           attribute EventHandler ondblclick;
           attribute EventHandler ondrag;
           attribute EventHandler ondragend;
           attribute EventHandler ondragenter;
           attribute EventHandler ondragexit;
           attribute EventHandler ondragleave;
           attribute EventHandler ondragover;
           attribute EventHandler ondragstart;
           attribute EventHandler ondrop;
           attribute EventHandler ondurationchange;
           attribute EventHandler onemptied;
           attribute EventHandler onended;
           attribute OnErrorEventHandler onerror;
           attribute EventHandler onfocus;
           attribute EventHandler onformdata;
           attribute EventHandler oninput;
           attribute EventHandler oninvalid;
           attribute EventHandler onkeydown;
           attribute EventHandler onkeypress;
           attribute EventHandler onkeyup;
           attribute EventHandler onload;
           attribute EventHandler onloadeddata;
           attribute EventHandler onloadedmetadata;
           attribute EventHandler onloadstart;
           attribute EventHandler onmousedown;
           [LegacyLenientThis] attribute EventHandler onmouseenter;
           [LegacyLenientThis] attribute EventHandler onmouseleave;
           attribute EventHandler onmousemove;
           attribute EventHandler onmouseout;
           attribute EventHandler onmouseover;
           attribute EventHandler onmouseup;
           attribute EventHandler onwheel;
           attribute EventHandler onpause;
           attribute EventHandler onplay;
           attribute EventHandler onplaying;
           attribute EventHandler onprogress;
           attribute EventHandler onratechange;
           attribute EventHandler onreset;
           attribute EventHandler onresize;
           attribute EventHandler onscroll;
           attribute EventHandler onseeked;
           attribute EventHandler onseeking;
           attribute EventHandler onselect;
           attribute EventHandler onshow;
           attribute EventHandler onstalled;
           attribute EventHandler onsubmit;
           attribute EventHandler onsuspend;
           attribute EventHandler ontimeupdate;
           attribute EventHandler ontoggle;
           attribute EventHandler onvolumechange;
           attribute EventHandler onwaiting;
};

// https://drafts.csswg.org/css-animations/#interface-globaleventhandlers-idl
partial interface mixin GlobalEventHandlers {
           attribute EventHandler onanimationend;
           attribute EventHandler onanimationiteration;
};

// https://drafts.csswg.org/css-transitions/#interface-globaleventhandlers-idl
partial interface mixin GlobalEventHandlers {
           attribute EventHandler ontransitionrun;
           attribute EventHandler ontransitionend;
           attribute EventHandler ontransitioncancel;
};

// https://w3c.github.io/selection-api/#extensions-to-globaleventhandlers-interface
partial interface mixin GlobalEventHandlers {
          attribute EventHandler onselectstart;
          attribute EventHandler onselectionchange;
};

// https://html.spec.whatwg.org/multipage/#windoweventhandlers
[Exposed=Window]
interface mixin WindowEventHandlers {
           attribute EventHandler onafterprint;
           attribute EventHandler onbeforeprint;
           attribute OnBeforeUnloadEventHandler onbeforeunload;
           attribute EventHandler onhashchange;
           attribute EventHandler onlanguagechange;
           attribute EventHandler onmessage;
           attribute EventHandler onmessageerror;
           attribute EventHandler onoffline;
           attribute EventHandler ononline;
           attribute EventHandler onpagehide;
           attribute EventHandler onpageshow;
           attribute EventHandler onpopstate;
           attribute EventHandler onrejectionhandled;
           attribute EventHandler onstorage;
           attribute EventHandler onunhandledrejection;
           attribute EventHandler onunload;
};

// https://html.spec.whatwg.org/multipage/#documentandelementeventhandlers
[Exposed=Window]
interface mixin DocumentAndElementEventHandlers {
          attribute EventHandler oncopy;
          attribute EventHandler oncut;
          attribute EventHandler onpaste;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * https://dom.spec.whatwg.org/#callbackdef-eventlistener
 */

[Exposed=Window]
callback interface EventListener {
  undefined handleEvent(Event event);
};

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/uievents/#dictdef-eventmodifierinit
dictionary EventModifierInit : UIEventInit {
    boolean ctrlKey = false;
    boolean shiftKey = false;
    boolean altKey = false;
    boolean metaKey = false;
    boolean keyModifierStateAltGraph = false;
    boolean keyModifierStateCapsLock = false;
    boolean keyModifierStateFn = false;
    boolean keyModifierStateFnLock = false;
    boolean keyModifierStateHyper = false;
    boolean keyModifierStateNumLock = false;
    boolean keyModifierStateOS = false;
    boolean keyModifierStateScrollLock = false;
    boolean keyModifierStateSuper = false;
    boolean keyModifierStateSymbol = false;
    boolean keyModifierStateSymbolLock = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://html.spec.whatwg.org/multipage/#eventsource
 */

[Exposed=(Window,Worker)]
interface EventSource : EventTarget {
  [Throws] constructor(DOMString url, optional EventSourceInit eventSourceInitDict = {});
  readonly attribute DOMString url;
  readonly attribute boolean withCredentials;

  // ready state
  const unsigned short CONNECTING = 0;
  const unsigned short OPEN = 1;
  const unsigned short CLOSED = 2;
  readonly attribute unsigned short readyState;

  // networking
  attribute EventHandler onopen;
  attribute EventHandler onmessage;
  attribute EventHandler onerror;
  undefined close();
};

dictionary EventSourceInit {
  boolean withCredentials = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * https://dom.spec.whatwg.org/#interface-eventtarget
 */

[Exposed=(Window,Worker,Worklet,DissimilarOriginWindow)]
interface EventTarget {
  [Throws] constructor();
  undefined addEventListener(
    DOMString type,
    EventListener? callback,
    optional (AddEventListenerOptions or boolean) options = {}
  );

  undefined removeEventListener(
    DOMString type,
    EventListener? callback,
    optional (EventListenerOptions or boolean) options = {}
  );

  [Throws]
  boolean dispatchEvent(Event event);
};

dictionary EventListenerOptions {
  boolean capture = false;
};

dictionary AddEventListenerOptions : EventListenerOptions {
  // boolean passive = false;
  boolean once = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/ServiceWorker/#extendable-event

[Exposed=ServiceWorker,
 Pref="dom.serviceworker.enabled"]
interface ExtendableEvent : Event {
  [Throws] constructor(DOMString type,
 optional ExtendableEventInit eventInitDict = {});
  [Throws] undefined waitUntil(/*Promise<*/any/*>*/ f);
};

dictionary ExtendableEventInit : EventInit {
  // Defined for the forward compatibility across the derived events
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/ServiceWorker/#extendablemessage-event-section

[Exposed=ServiceWorker,
 Pref="dom.serviceworker.enabled"]
interface ExtendableMessageEvent : ExtendableEvent {
  [Throws] constructor(DOMString type, optional ExtendableMessageEventInit eventInitDict = {});
  readonly attribute any data;
  readonly attribute DOMString origin;
  readonly attribute DOMString lastEventId;
  // [SameObject] readonly attribute (Client or ServiceWorker /*or MessagePort*/)? source;
  readonly attribute /*FrozenArray<MessagePort>*/any ports;
};

dictionary ExtendableMessageEventInit : ExtendableEventInit {
  any data = null;
  DOMString origin = "";
  DOMString lastEventId = "";
  // (Client or ServiceWorker /*or MessagePort*/)? source;
  sequence<MessagePort> ports = [];
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://github.com/immersive-web/webxr-test-api/

[Exposed=Window, Pref="dom.webxr.test"]
interface FakeXRDevice {
  // Sets the values to be used for subsequent
  // requestAnimationFrame() callbacks.
  [Throws] undefined setViews(sequence<FakeXRViewInit> views);

  [Throws] undefined setViewerOrigin(FakeXRRigidTransformInit origin, optional boolean emulatedPosition = false);
  undefined clearViewerOrigin();

  [Throws] undefined setFloorOrigin(FakeXRRigidTransformInit origin);
  undefined clearFloorOrigin();

  // // Simulates devices focusing and blurring sessions.
  undefined simulateVisibilityChange(XRVisibilityState state);

  // void setBoundsGeometry(sequence<FakeXRBoundsPoint> boundsCoodinates);

  [Throws] FakeXRInputController simulateInputSourceConnection(FakeXRInputSourceInit init);

  // behaves as if device was disconnected
  Promise<undefined> disconnect();

  // Hit test extensions:
  [Throws] undefined setWorld(FakeXRWorldInit world);
  undefined clearWorld();
};

// https://immersive-web.github.io/webxr/#dom-xrwebgllayer-getviewport
dictionary FakeXRViewInit {
  required XREye eye;
  // https://immersive-web.github.io/webxr/#view-projection-matrix
  required sequence<float> projectionMatrix;
  // https://immersive-web.github.io/webxr/#view-offset
  required FakeXRRigidTransformInit viewOffset;
  // https://immersive-web.github.io/webxr/#dom-xrwebgllayer-getviewport
  required FakeXRDeviceResolution resolution;

  FakeXRFieldOfViewInit fieldOfView;
};

// https://immersive-web.github.io/webxr/#xrviewport
dictionary FakeXRDeviceResolution {
    required long width;
    required long height;
};

dictionary FakeXRBoundsPoint {
  double x; double z;
};

dictionary FakeXRRigidTransformInit {
    required sequence<float> position;
    required sequence<float> orientation;
};

dictionary FakeXRFieldOfViewInit {
  required float upDegrees;
  required float downDegrees;
  required float leftDegrees;
  required float rightDegrees;
};

// hit testing
dictionary FakeXRWorldInit {
  required sequence<FakeXRRegionInit> hitTestRegions;
};


dictionary FakeXRRegionInit {
  required sequence<FakeXRTriangleInit> faces;
  required FakeXRRegionType type;
};


dictionary FakeXRTriangleInit {
  required sequence<DOMPointInit> vertices;  // size = 3
};


enum FakeXRRegionType {
  "point",
  "plane",
  "mesh"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr-test-api/#fakexrinputcontroller

[Exposed=Window, Pref="dom.webxr.test"]
interface FakeXRInputController {
  undefined setHandedness(XRHandedness handedness);
  undefined setTargetRayMode(XRTargetRayMode targetRayMode);
  undefined setProfiles(sequence<DOMString> profiles);
  [Throws] undefined setGripOrigin(FakeXRRigidTransformInit gripOrigin, optional boolean emulatedPosition = false);
  undefined clearGripOrigin();
  [Throws] undefined setPointerOrigin(
    FakeXRRigidTransformInit pointerOrigin,
    optional boolean emulatedPosition = false
  );

  undefined disconnect();
  undefined reconnect();

  undefined startSelection();
  undefined endSelection();
  undefined simulateSelect();

  // void setSupportedButtons(sequence<FakeXRButtonStateInit> supportedButtons);
  // void updateButtonState(FakeXRButtonStateInit buttonState);
};

dictionary FakeXRInputSourceInit {
  required XRHandedness handedness;
  required XRTargetRayMode targetRayMode;
  required FakeXRRigidTransformInit pointerOrigin;
  required sequence<DOMString> profiles;
  boolean selectionStarted = false;
  boolean selectionClicked = false;
  sequence<FakeXRButtonStateInit> supportedButtons;
  FakeXRRigidTransformInit gripOrigin;
};

enum FakeXRButtonType {
  "grip",
  "touchpad",
  "thumbstick",
  "optional-button",
  "optional-thumbstick"
};

dictionary FakeXRButtonStateInit {
  required FakeXRButtonType buttonType;
  required boolean pressed;
  required boolean touched;
  required float pressedValue;
  float xValue = 0.0;
  float yValue = 0.0;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://fetch.spec.whatwg.org/#fetch-method

[Exposed=(Window,Worker)]

partial interface mixin WindowOrWorkerGlobalScope {
  [NewObject] Promise<Response> fetch(RequestInfo input, optional RequestInit init = {});
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/FileAPI/#file

[Exposed=(Window,Worker)]
interface File : Blob {
  [Throws] constructor(sequence<BlobPart> fileBits,
              DOMString fileName,
              optional FilePropertyBag options = {});
  readonly attribute DOMString name;
  readonly attribute long long lastModified;
};

dictionary FilePropertyBag : BlobPropertyBag {
  long long lastModified;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/FileAPI/#dfn-filelist

[Exposed=(Window,Worker)]
interface FileList {
  getter File? item(unsigned long index);
  readonly attribute unsigned long length;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

 // http://dev.w3.org/2006/webapi/FileAPI/#APIASynch

typedef (DOMString or object) FileReaderResult;
[Exposed=(Window,Worker)]
interface FileReader: EventTarget {
  [Throws] constructor();

  // async read methods
  [Throws]
  undefined readAsArrayBuffer(Blob blob);
  [Throws]
  undefined readAsText(Blob blob, optional DOMString label);
  [Throws]
  undefined readAsDataURL(Blob blob);

  undefined abort();

  // states
  const unsigned short EMPTY = 0;
  const unsigned short LOADING = 1;
  const unsigned short DONE = 2;
  readonly attribute unsigned short readyState;

  // File or Blob data
  readonly attribute FileReaderResult? result;

  readonly attribute DOMException? error;

  // event handler attributes
  attribute EventHandler onloadstart;
  attribute EventHandler onprogress;
  attribute EventHandler onload;
  attribute EventHandler onabort;
  attribute EventHandler onerror;
  attribute EventHandler onloadend;

};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/FileAPI/#FileReaderSync

[Exposed=Worker]
interface FileReaderSync {
  [Throws] constructor();
  // Synchronously return strings

  [Throws]
  ArrayBuffer readAsArrayBuffer(Blob blob);
  [Throws]
  DOMString readAsBinaryString(Blob blob);
  [Throws]
  DOMString readAsText(Blob blob, optional DOMString label);
  [Throws]
  DOMString readAsDataURL(Blob blob);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/uievents/#interface-FocusEvent
[Exposed=Window]
interface FocusEvent : UIEvent {
  [Throws] constructor(DOMString typeArg, optional FocusEventInit focusEventInitDict = {});
  readonly attribute EventTarget?   relatedTarget;
};

dictionary FocusEventInit : UIEventInit {
    EventTarget? relatedTarget = null;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://xhr.spec.whatwg.org/#interface-formdata
 */

typedef (File or USVString) FormDataEntryValue;

[Exposed=(Window,Worker)]
interface FormData {
  [Throws] constructor(optional HTMLFormElement form);
  undefined append(USVString name, USVString value);
  undefined append(USVString name, Blob value, optional USVString filename);
  undefined delete(USVString name);
  FormDataEntryValue? get(USVString name);
  sequence<FormDataEntryValue> getAll(USVString name);
  boolean has(USVString name);
  undefined set(USVString name, USVString value);
  undefined set(USVString name, Blob value, optional USVString filename);
  iterable<USVString, FormDataEntryValue>;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-formdataevent-interface
[Exposed=Window]
interface FormDataEvent : Event {
  [Throws] constructor(DOMString type, FormDataEventInit eventInitDict);
  readonly attribute FormData formData;
};

dictionary FormDataEventInit : EventInit {
  required FormData formData;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://heycam.github.io/webidl/#common-Function
 *
 * © Copyright 2004-2011 Apple Computer, Inc., Mozilla Foundation, and
 * Opera Software ASA. You are granted a license to use, reproduce
 * and create derivative works of this document.
 */

callback Function = any(any... arguments);
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#gainnode
 */

dictionary GainOptions : AudioNodeOptions {
  float gain = 1.0;
};

[Exposed=Window]
 interface GainNode : AudioNode {
   [Throws] constructor(BaseAudioContext context, optional GainOptions options = {});
   readonly attribute AudioParam gain;
 };
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/gamepad/#gamepad-interface
[Exposed=Window, Pref="dom.gamepad.enabled"]
interface Gamepad {
    readonly attribute DOMString id;
    readonly attribute long index;
    readonly attribute boolean connected;
    readonly attribute DOMHighResTimeStamp timestamp;
    readonly attribute DOMString mapping;
    readonly attribute Float64Array axes;
    [SameObject] readonly attribute GamepadButtonList buttons;
};

// https://w3c.github.io/gamepad/extensions.html#partial-gamepad-interface
partial interface Gamepad {
  readonly attribute GamepadHand hand;
  // readonly attribute FrozenArray<GamepadHapticActuator> hapticActuators;
  readonly attribute GamepadPose? pose;
};

// https://w3c.github.io/gamepad/extensions.html#gamepadhand-enum
enum GamepadHand {
  "",  /* unknown, both hands, or not applicable */
  "left",
  "right"
};

// https://www.w3.org/TR/gamepad/#extensions-to-the-windoweventhandlers-interface-mixin
partial interface mixin WindowEventHandlers {
  attribute EventHandler ongamepadconnected;
  attribute EventHandler ongamepaddisconnected;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/gamepad/#gamepadbutton-interface
[Exposed=Window, Pref="dom.gamepad.enabled"]
interface GamepadButton {
    readonly attribute boolean pressed;
    readonly attribute boolean touched;
    readonly attribute double value;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/gamepad/#dom-gamepad-buttons
[Exposed=Window, Pref="dom.gamepad.enabled"]
interface GamepadButtonList {
  getter GamepadButton? item(unsigned long index);
  readonly attribute unsigned long length;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/gamepad/#gamepadevent-interface
[Exposed=Window, Pref="dom.gamepad.enabled"]
interface GamepadEvent : Event {
  [Throws] constructor(DOMString type, GamepadEventInit eventInitDict);
  readonly attribute Gamepad gamepad;
};

dictionary GamepadEventInit : EventInit {
  required Gamepad gamepad;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/gamepad/extensions.html#gamepadpose-interface
[Exposed=Window, Pref="dom.gamepad.enabled"]
interface GamepadPose {
  readonly attribute boolean hasOrientation;
  readonly attribute boolean hasPosition;

  readonly attribute Float32Array? position;
  readonly attribute Float32Array? linearVelocity;
  readonly attribute Float32Array? linearAcceleration;
  readonly attribute Float32Array? orientation;
  readonly attribute Float32Array? angularVelocity;
  readonly attribute Float32Array? angularAcceleration;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Exposed=(Window,Worker,Worklet,DissimilarOriginWindow),
 Inline]
interface GlobalScope : EventTarget {};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://html.spec.whatwg.org/multipage/#the-a-element
 * https://html.spec.whatwg.org/multipage/#other-elements,-attributes-and-apis
 * © Copyright 2004-2011 Apple Computer, Inc., Mozilla Foundation, and
 * Opera Software ASA. You are granted a license to use, reproduce
 * and create derivative works of this document.
 */

// https://html.spec.whatwg.org/multipage/#htmlanchorelement
[Exposed=Window]
interface HTMLAnchorElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
  attribute DOMString target;
  // [CEReactions]
  //       attribute DOMString download;
  // [CEReactions]
  //       attribute USVString ping;
  [CEReactions]
           attribute DOMString rel;
  [SameObject, PutForwards=value] readonly attribute DOMTokenList relList;
  // [CEReactions]
  //       attribute DOMString hreflang;
  // [CEReactions]
  //       attribute DOMString type;

  [CEReactions, Pure]
           attribute DOMString text;

  // also has obsolete members
};
HTMLAnchorElement includes HTMLHyperlinkElementUtils;

// https://html.spec.whatwg.org/multipage/#HTMLAnchorElement-partial
partial interface HTMLAnchorElement {
  [CEReactions]
  attribute DOMString coords;
  // [CEReactions]
  //          attribute DOMString charset;
  [CEReactions]
  attribute DOMString name;
  [CEReactions]
  attribute DOMString rev;
  [CEReactions]
  attribute DOMString shape;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlareaelement
[Exposed=Window]
interface HTMLAreaElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute DOMString alt;
  // [CEReactions]
  //         attribute DOMString coords;
  // [CEReactions]
  //         attribute DOMString shape;
  [CEReactions]
             attribute DOMString target;
  // [CEReactions]
  //         attribute DOMString download;
  // [CEReactions]
  //         attribute USVString ping;
  [CEReactions]
             attribute DOMString rel;
  [SameObject, PutForwards=value] readonly attribute DOMTokenList relList;
  // hreflang and type are not reflected
};
//HTMLAreaElement includes HTMLHyperlinkElementUtils;

// https://html.spec.whatwg.org/multipage/#HTMLAreaElement-partial
partial interface HTMLAreaElement {
  // [CEReactions]
  //          attribute boolean noHref;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlaudioelement
[Exposed=Window, LegacyFactoryFunction=Audio(optional DOMString src)]
interface HTMLAudioElement : HTMLMediaElement {
  [HTMLConstructor] constructor();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlbrelement
[Exposed=Window]
interface HTMLBRElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLBRElement-partial
partial interface HTMLBRElement {
  //         attribute DOMString clear;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlbaseelement
[Exposed=Window]
interface HTMLBaseElement : HTMLElement {
    [HTMLConstructor] constructor();

    [CEReactions]
    attribute DOMString href;
    // [CEReactions]
    // attribute DOMString target;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-body-element
[Exposed=Window]
interface HTMLBodyElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};
HTMLBodyElement includes WindowEventHandlers;

// https://html.spec.whatwg.org/multipage/#HTMLBodyElement-partial
partial interface HTMLBodyElement {
  [CEReactions] attribute [LegacyNullToEmptyString] DOMString text;

  // https://github.com/servo/servo/issues/8715
  //[CEReactions, LegacyNullToEmptyString] attribute DOMString link;

  // https://github.com/servo/servo/issues/8716
  //[CEReactions, LegacyNullToEmptyString] attribute DOMString vLink;

  // https://github.com/servo/servo/issues/8717
  //[CEReactions, LegacyNullToEmptyString] attribute DOMString aLink;

  [CEReactions] attribute [LegacyNullToEmptyString] DOMString bgColor;
  [CEReactions] attribute DOMString background;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlbuttonelement
[Exposed=Window]
interface HTMLButtonElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute boolean autofocus;
  [CEReactions]
           attribute boolean disabled;
  readonly attribute HTMLFormElement? form;
  [CEReactions]
           attribute DOMString formAction;
  [CEReactions]
           attribute DOMString formEnctype;
  [CEReactions]
           attribute DOMString formMethod;
  [CEReactions]
           attribute boolean formNoValidate;
  [CEReactions]
           attribute DOMString formTarget;
  [CEReactions]
           attribute DOMString name;
  [CEReactions]
           attribute DOMString type;
  [CEReactions]
           attribute DOMString value;
  //         attribute HTMLMenuElement? menu;

  readonly attribute boolean willValidate;
  readonly attribute ValidityState validity;
  readonly attribute DOMString validationMessage;
  boolean checkValidity();
  boolean reportValidity();
  undefined setCustomValidity(DOMString error);

  readonly attribute NodeList labels;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlcanvaselement
typedef (CanvasRenderingContext2D
  or WebGLRenderingContext
  or WebGL2RenderingContext
  or GPUCanvasContext) RenderingContext;

[Exposed=Window]
interface HTMLCanvasElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions, Pure] attribute unsigned long width;
  [CEReactions, Pure] attribute unsigned long height;

  RenderingContext? getContext(DOMString contextId, optional any options = null);

  [Throws]
  USVString toDataURL(optional DOMString type, optional any quality);
  //void toBlob(BlobCallback _callback, optional DOMString type, optional any quality);
  //OffscreenCanvas transferControlToOffscreen();
};

partial interface HTMLCanvasElement {
    [Pref="dom.canvas_capture.enabled"]
    MediaStream captureStream (optional double frameRequestRate);
};

//callback BlobCallback = void (Blob? blob);
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://dom.spec.whatwg.org/#interface-htmlcollection

[Exposed=Window, LegacyUnenumerableNamedProperties]
interface HTMLCollection {
  [Pure]
  readonly attribute unsigned long length;
  [Pure]
  getter Element? item(unsigned long index);
  [Pure]
  getter Element? namedItem(DOMString name);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmldlistelement
[Exposed=Window]
interface HTMLDListElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLDListElement-partial
partial interface HTMLDListElement {
  // [CEReactions]
  //         attribute boolean compact;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmldataelement
[Exposed=Window]
interface HTMLDataElement : HTMLElement {
    [HTMLConstructor] constructor();

    [CEReactions]
           attribute DOMString value;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmldatalistelement
[Exposed=Window]
interface HTMLDataListElement : HTMLElement {
  [HTMLConstructor] constructor();

  readonly attribute HTMLCollection options;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmldetailselement
[Exposed=Window]
interface HTMLDetailsElement : HTMLElement {
    [HTMLConstructor] constructor();

    [CEReactions]
    attribute boolean open;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmldialogelement
[Exposed=Window]
interface HTMLDialogElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
  attribute boolean open;
  attribute DOMString returnValue;
  // [CEReactions]
  // void show();
  // [CEReactions]
  // void showModal();
  [CEReactions]
  undefined close(optional DOMString returnValue);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmldirectoryelement
[Exposed=Window]
interface HTMLDirectoryElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute boolean compact;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmldivelement
[Exposed=Window]
interface HTMLDivElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLDivElement-partial
partial interface HTMLDivElement {
  [CEReactions]
  attribute DOMString align;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlelement
[Exposed=Window]
interface HTMLElement : Element {
  [HTMLConstructor] constructor();

  // metadata attributes
  [CEReactions]
           attribute DOMString title;
  [CEReactions]
           attribute DOMString lang;
  [CEReactions]
           attribute boolean translate;
  [CEReactions]
           attribute DOMString dir;
  readonly attribute DOMStringMap dataset;

  // microdata
  //         attribute boolean itemScope;

  //         attribute DOMString itemId;
  //readonly attribute HTMLPropertiesCollection properties;
  //         attribute any itemValue; // acts as DOMString on setting
  [Pref="dom.microdata.testing.enabled"]
  sequence<DOMString>? propertyNames();
  [Pref="dom.microdata.testing.enabled"]
  sequence<DOMString>? itemtypes();

  // user interaction
  [CEReactions]
           attribute boolean hidden;
  undefined click();
  // [CEReactions]
  //         attribute long tabIndex;
  undefined focus();
  undefined blur();
  // [CEReactions]
  //         attribute DOMString accessKey;
  //readonly attribute DOMString accessKeyLabel;
  // [CEReactions]
  //         attribute boolean draggable;
  // [SameObject, PutForwards=value] readonly attribute DOMTokenList dropzone;
  //         attribute HTMLMenuElement? contextMenu;
  // [CEReactions]
  //         attribute boolean spellcheck;
  // void forceSpellCheck();

  attribute [LegacyNullToEmptyString] DOMString innerText;

  [Throws] ElementInternals attachInternals();

  // command API
  // readonly attribute DOMString? commandType;
  // readonly attribute DOMString? commandLabel;
  // readonly attribute DOMString? commandIcon;
  // readonly attribute boolean? commandHidden;
  // readonly attribute boolean? commandDisabled;
  // readonly attribute boolean? commandChecked;
};

// http://dev.w3.org/csswg/cssom-view/#extensions-to-the-htmlelement-interface
partial interface HTMLElement {
  // CSSOM things are not [Pure] because they can flush
  readonly attribute Element? offsetParent;
  readonly attribute long offsetTop;
  readonly attribute long offsetLeft;
  readonly attribute long offsetWidth;
  readonly attribute long offsetHeight;
};

HTMLElement includes GlobalEventHandlers;
HTMLElement includes DocumentAndElementEventHandlers;
HTMLElement includes ElementContentEditable;
HTMLElement includes ElementCSSInlineStyle;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlembedelement
[Exposed=Window]
interface HTMLEmbedElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute DOMString src;
  // [CEReactions]
  //         attribute DOMString type;
  // [CEReactions]
  //         attribute DOMString width;
  // [CEReactions]
  //         attribute DOMString height;
  //legacycaller any (any... arguments);

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLEmbedElement-partial
partial interface HTMLEmbedElement {
  // [CEReactions]
  //         attribute DOMString align;
  // [CEReactions]
  //         attribute DOMString name;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlfieldsetelement
[Exposed=Window]
interface HTMLFieldSetElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute boolean disabled;
  readonly attribute HTMLFormElement? form;
  [CEReactions]
           attribute DOMString name;

  //readonly attribute DOMString type;

  [SameObject] readonly attribute HTMLCollection elements;

  readonly attribute boolean willValidate;
  [SameObject] readonly attribute ValidityState validity;
  readonly attribute DOMString validationMessage;
  boolean checkValidity();
  boolean reportValidity();
  undefined setCustomValidity(DOMString error);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlfontelement
[Exposed=Window]
interface HTMLFontElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
  attribute [LegacyNullToEmptyString] DOMString color;
  [CEReactions]
  attribute DOMString face;
  [CEReactions]
  attribute DOMString size;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlformcontrolscollection
[Exposed=Window]
interface HTMLFormControlsCollection : HTMLCollection {
  // inherits length and item()
  getter (RadioNodeList or Element)? namedItem(DOMString name); // shadows inherited namedItem()
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlformelement
[Exposed=Window, LegacyUnenumerableNamedProperties]
interface HTMLFormElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute DOMString acceptCharset;
  [CEReactions]
           attribute DOMString action;
  [CEReactions]
           attribute DOMString autocomplete;
  [CEReactions]
           attribute DOMString enctype;
  [CEReactions]
           attribute DOMString encoding;
  [CEReactions]
           attribute DOMString method;
  [CEReactions]
           attribute DOMString name;
  [CEReactions]
           attribute boolean noValidate;
  [CEReactions]
           attribute DOMString target;
  [CEReactions]
           attribute DOMString rel;
  [SameObject, PutForwards=value] readonly attribute DOMTokenList relList;

  [SameObject] readonly attribute HTMLFormControlsCollection elements;
  readonly attribute unsigned long length;
  getter Element? (unsigned long index);
  getter (RadioNodeList or Element) (DOMString name);

  undefined submit();
  [Throws] undefined requestSubmit(optional HTMLElement? submitter = null);
  [CEReactions]
  undefined reset();
  boolean checkValidity();
  boolean reportValidity();
};

// https://html.spec.whatwg.org/multipage/#selectionmode
enum SelectionMode {
  "preserve", // default
  "select",
  "start",
  "end"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlframeelement
[Exposed=Window]
interface HTMLFrameElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //          attribute DOMString name;
  // [CEReactions]
  //          attribute DOMString scrolling;
  // [CEReactions]
  //          attribute DOMString src;
  // [CEReactions]
  //          attribute DOMString frameBorder;
  // [CEReactions]
  //          attribute DOMString longDesc;
  // [CEReactions]
  //          attribute boolean noResize;
  // readonly attribute Document? contentDocument;
  // readonly attribute WindowProxy? contentWindow;

  // [CEReactions, LegacyNullToEmptyString]
  // attribute DOMString marginHeight;
  // [CEReactions, LegacyNullToEmptyString]
  // attribute DOMString marginWidth;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlframesetelement
[Exposed=Window]
interface HTMLFrameSetElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute DOMString cols;
  // [CEReactions]
  //         attribute DOMString rows;
};

HTMLFrameSetElement includes WindowEventHandlers;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlhrelement
[Exposed=Window]
interface HTMLHRElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLHRElement-partial
partial interface HTMLHRElement {
  [CEReactions]
  attribute DOMString align;
  [CEReactions]
  attribute DOMString color;
  // [CEReactions]
  // attribute boolean noShade;
  // [CEReactions]
  // attribute DOMString size;
  [CEReactions]
  attribute DOMString width;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlheadelement
[Exposed=Window]
interface HTMLHeadElement : HTMLElement {
  [HTMLConstructor] constructor();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlheadingelement
[Exposed=Window]
interface HTMLHeadingElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLHeadingElement-partial
partial interface HTMLHeadingElement {
  // [CEReactions]
  //         attribute DOMString align;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlhtmlelement
[Exposed=Window]
interface HTMLHtmlElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLHtmlElement-partial
partial interface HTMLHtmlElement {
  // [CEReactions]
  //         attribute DOMString version;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlhyperlinkelementutils
interface mixin HTMLHyperlinkElementUtils {
  [CEReactions]
  stringifier attribute USVString href;
  readonly attribute USVString origin;
  [CEReactions]
           attribute USVString protocol;
  [CEReactions]
           attribute USVString username;
  [CEReactions]
           attribute USVString password;
  [CEReactions]
           attribute USVString host;
  [CEReactions]
           attribute USVString hostname;
  [CEReactions]
           attribute USVString port;
  [CEReactions]
           attribute USVString pathname;
  [CEReactions]
           attribute USVString search;
  [CEReactions]
           attribute USVString hash;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmliframeelement
[Exposed=Window]
interface HTMLIFrameElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute USVString src;
  [CEReactions]
           attribute DOMString srcdoc;

  [CEReactions]
  attribute DOMString name;

  [SameObject, PutForwards=value]
           readonly attribute DOMTokenList sandbox;
  // [CEReactions]
  //         attribute boolean seamless;
  [CEReactions]
           attribute boolean allowFullscreen;
  [CEReactions]
           attribute DOMString width;
  [CEReactions]
           attribute DOMString height;
  readonly attribute Document? contentDocument;
  readonly attribute WindowProxy? contentWindow;

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLIFrameElement-partial
partial interface HTMLIFrameElement {
  // [CEReactions]
  //         attribute DOMString align;
  // [CEReactions]
  //         attribute DOMString scrolling;
  [CEReactions]
           attribute DOMString frameBorder;
  // [CEReactions]
  //         attribute DOMString longDesc;

  // [CEReactions, LegacyNullToEmptyString]
  // attribute DOMString marginHeight;
  // [CEReactions, LegacyNullToEmptyString]
  // attribute DOMString marginWidth;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlimageelement
[Exposed=Window, LegacyFactoryFunction=Image(optional unsigned long width, optional unsigned long height)]
interface HTMLImageElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute DOMString alt;
  [CEReactions]
           attribute USVString src;
  [CEReactions]
           attribute USVString srcset;
  [CEReactions]
           attribute DOMString? crossOrigin;
  [CEReactions]
           attribute DOMString useMap;
  [CEReactions]
           attribute boolean isMap;
  [CEReactions]
           attribute unsigned long width;
  [CEReactions]
           attribute unsigned long height;
  readonly attribute unsigned long naturalWidth;
  readonly attribute unsigned long naturalHeight;
  readonly attribute boolean complete;
  readonly attribute USVString currentSrc;
  [CEReactions]
           attribute DOMString referrerPolicy;
  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLImageElement-partial
partial interface HTMLImageElement {
  [CEReactions]
           attribute DOMString name;
  // [CEReactions]
  //          attribute DOMString lowsrc;
  [CEReactions]
           attribute DOMString align;
  [CEReactions]
           attribute unsigned long hspace;
  [CEReactions]
           attribute unsigned long vspace;
  [CEReactions]
           attribute DOMString longDesc;

  [CEReactions]
  attribute [LegacyNullToEmptyString] DOMString border;
};

// https://drafts.csswg.org/cssom-view/#extensions-to-the-htmlimageelement-interface
partial interface HTMLImageElement {
  // readonly attribute long x;
  // readonly attribute long y;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlinputelement
[Exposed=Window]
interface HTMLInputElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute DOMString accept;
  [CEReactions]
           attribute DOMString alt;
  // [CEReactions]
  //         attribute DOMString autocomplete;
  // [CEReactions]
  //         attribute boolean autofocus;
  [CEReactions]
           attribute boolean defaultChecked;
           attribute boolean checked;
  [CEReactions]
           attribute DOMString dirName;
  [CEReactions]
           attribute boolean disabled;
  readonly attribute HTMLFormElement? form;
  attribute FileList? files;
  [CEReactions]
           attribute DOMString formAction;
  [CEReactions]
           attribute DOMString formEnctype;
  [CEReactions]
           attribute DOMString formMethod;
  [CEReactions]
           attribute boolean formNoValidate;
  [CEReactions]
           attribute DOMString formTarget;
  // [CEReactions]
  //          attribute unsigned long height;
           attribute boolean indeterminate;
  // [CEReactions]
  //          attribute DOMString inputMode;
  readonly attribute HTMLDataListElement? list;
  [CEReactions]
           attribute DOMString max;
  [CEReactions, SetterThrows]
           attribute long maxLength;
  [CEReactions]
           attribute DOMString min;
  [CEReactions, SetterThrows]
           attribute long minLength;
  [CEReactions]
           attribute boolean multiple;
  [CEReactions]
           attribute DOMString name;
  [CEReactions]
           attribute DOMString pattern;
  [CEReactions]
           attribute DOMString placeholder;
  [CEReactions]
           attribute boolean readOnly;
  [CEReactions]
           attribute boolean required;
  [CEReactions, SetterThrows]
           attribute unsigned long size;
  [CEReactions]
           attribute USVString src;
  [CEReactions]
           attribute DOMString step;
  [CEReactions]
           attribute DOMString type;
  [CEReactions]
           attribute DOMString defaultValue;
  [CEReactions, SetterThrows]
           attribute [LegacyNullToEmptyString] DOMString value;
  [SetterThrows]
           attribute object? valueAsDate;
  [SetterThrows]
           attribute unrestricted double valueAsNumber;
  // [CEReactions]
  //          attribute unsigned long width;

  [Throws] undefined stepUp(optional long n = 1);
  [Throws] undefined stepDown(optional long n = 1);

  readonly attribute boolean willValidate;
  readonly attribute ValidityState validity;
  readonly attribute DOMString validationMessage;
  boolean checkValidity();
  boolean reportValidity();
  undefined setCustomValidity(DOMString error);

  readonly attribute NodeList? labels;

  undefined select();
  [SetterThrows]
           attribute unsigned long? selectionStart;
  [SetterThrows]
           attribute unsigned long? selectionEnd;
  [SetterThrows]
           attribute DOMString? selectionDirection;
  [Throws]
           undefined setRangeText(DOMString replacement);
  [Throws]
           undefined setRangeText(DOMString replacement, unsigned long start, unsigned long end,
                             optional SelectionMode selectionMode = "preserve");
  [Throws]
           undefined setSelectionRange(unsigned long start, unsigned long end, optional DOMString direction);

  // also has obsolete members

  // Select with file-system paths for testing purpose
  [Pref="dom.testing.htmlinputelement.select_files.enabled"]
  undefined selectFiles(sequence<DOMString> path);
};

// https://html.spec.whatwg.org/multipage/#HTMLInputElement-partial
partial interface HTMLInputElement {
  //         attribute DOMString align;
  //         attribute DOMString useMap;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmllielement
[Exposed=Window]
interface HTMLLIElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
  attribute long value;

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLLIElement-partial
partial interface HTMLLIElement {
  // [CEReactions]
  //         attribute DOMString type;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmllabelelement
[Exposed=Window]
interface HTMLLabelElement : HTMLElement {
  [HTMLConstructor] constructor();

  readonly attribute HTMLFormElement? form;
  [CEReactions]
  attribute DOMString htmlFor;
  readonly attribute HTMLElement? control;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmllegendelement
[Exposed=Window]
interface HTMLLegendElement : HTMLElement {
  [HTMLConstructor] constructor();

  readonly attribute HTMLFormElement? form;

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLLegendElement-partial
partial interface HTMLLegendElement {
  // [CEReactions]
  //         attribute DOMString align;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmllinkelement
[Exposed=Window]
interface HTMLLinkElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute USVString href;
  [CEReactions]
           attribute DOMString? crossOrigin;
  [CEReactions]
           attribute DOMString rel;
  [SameObject, PutForwards=value] readonly attribute DOMTokenList relList;
  [CEReactions]
           attribute DOMString media;
  [CEReactions]
           attribute DOMString hreflang;
  [CEReactions]
           attribute DOMString type;
  [CEReactions]
           attribute DOMString integrity;
  [CEReactions]
           attribute DOMString referrerPolicy;

  // also has obsolete members
};
HTMLLinkElement includes LinkStyle;

// https://html.spec.whatwg.org/multipage/#HTMLLinkElement-partial
partial interface HTMLLinkElement {
  [CEReactions]
  attribute DOMString charset;
  [CEReactions]
  attribute DOMString rev;
  [CEReactions]
  attribute DOMString target;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlmapelement
[Exposed=Window]
interface HTMLMapElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //          attribute DOMString name;
  // readonly attribute HTMLCollection areas;
  // readonly attribute HTMLCollection images;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlmediaelement

enum CanPlayTypeResult { "" /* empty string */, "maybe", "probably" };
typedef (MediaStream /*or MediaSource */ or Blob) MediaProvider;

[Exposed=Window, Abstract]
interface HTMLMediaElement : HTMLElement {
  // error state
  readonly attribute MediaError? error;

  // network state
  [CEReactions] attribute USVString src;
  attribute MediaProvider? srcObject;
  readonly attribute USVString currentSrc;
  [CEReactions] attribute DOMString? crossOrigin;
  const unsigned short NETWORK_EMPTY = 0;
  const unsigned short NETWORK_IDLE = 1;
  const unsigned short NETWORK_LOADING = 2;
  const unsigned short NETWORK_NO_SOURCE = 3;
  readonly attribute unsigned short networkState;
  [CEReactions] attribute DOMString preload;
  readonly attribute TimeRanges buffered;
  undefined load();
  CanPlayTypeResult canPlayType(DOMString type);

  // ready state
  const unsigned short HAVE_NOTHING = 0;
  const unsigned short HAVE_METADATA = 1;
  const unsigned short HAVE_CURRENT_DATA = 2;
  const unsigned short HAVE_FUTURE_DATA = 3;
  const unsigned short HAVE_ENOUGH_DATA = 4;
  readonly attribute unsigned short readyState;
  readonly attribute boolean seeking;

  // playback state
  attribute double currentTime;
  undefined fastSeek(double time);
  readonly attribute unrestricted double duration;
  // Date getStartDate();
  readonly attribute boolean paused;
  [Throws] attribute double defaultPlaybackRate;
  [Throws] attribute double playbackRate;
  readonly attribute TimeRanges played;
  // readonly attribute TimeRanges seekable;
  readonly attribute boolean ended;
  [CEReactions] attribute boolean autoplay;
  [CEReactions] attribute boolean loop;
  Promise<undefined> play();
  undefined pause();

  // controls
  [CEReactions] attribute boolean controls;
  [Throws] attribute double volume;
  attribute boolean muted;
  [CEReactions] attribute boolean defaultMuted;

  // tracks
  readonly attribute AudioTrackList audioTracks;
  readonly attribute VideoTrackList videoTracks;
  readonly attribute TextTrackList textTracks;
  TextTrack addTextTrack(TextTrackKind kind, optional DOMString label = "", optional DOMString language = "");
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlmenuelement
[Exposed=Window]
interface HTMLMenuElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLMenuElement-partial
partial interface HTMLMenuElement {
   [CEReactions]
            attribute boolean compact;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlmetaelement
[Exposed=Window]
interface HTMLMetaElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
             attribute DOMString name;
  [CEReactions]
          attribute DOMString httpEquiv;
  [CEReactions]
             attribute DOMString content;

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLMetaElement-partial
partial interface HTMLMetaElement {
  // [CEReactions]
  //         attribute DOMString scheme;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlmeterelement
[Exposed=Window]
interface HTMLMeterElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute double value;
  // [CEReactions]
  //         attribute double min;
  // [CEReactions]
  //         attribute double max;
  // [CEReactions]
  //         attribute double low;
  // [CEReactions]
  //         attribute double high;
  // [CEReactions]
  //         attribute double optimum;
  readonly attribute NodeList labels;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlmodelement
[Exposed=Window]
interface HTMLModElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute DOMString cite;
  // [CEReactions]
  //         attribute DOMString dateTime;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlolistelement
[Exposed=Window]
interface HTMLOListElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute boolean reversed;
  // [CEReactions]
  //         attribute long start;
  // [CEReactions]
  //         attribute DOMString type;

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLOListElement-partial
partial interface HTMLOListElement {
  // [CEReactions]
  //         attribute boolean compact;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlobjectelement
[Exposed=Window]
interface HTMLObjectElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute DOMString data;
  [CEReactions]
           attribute DOMString type;
  // [CEReactions]
  //         attribute boolean typeMustMatch;
  // [CEReactions]
  //         attribute DOMString name;
  // [CEReactions]
  //         attribute DOMString useMap;
  readonly attribute HTMLFormElement? form;
  // [CEReactions]
  //         attribute DOMString width;
  // [CEReactions]
  //         attribute DOMString height;
  //readonly attribute Document? contentDocument;
  //readonly attribute WindowProxy? contentWindow;

  readonly attribute boolean willValidate;
  readonly attribute ValidityState validity;
  readonly attribute DOMString validationMessage;
  boolean checkValidity();
  boolean reportValidity();
  undefined setCustomValidity(DOMString error);

  //legacycaller any (any... arguments);

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLObjectElement-partial
partial interface HTMLObjectElement {
  //         attribute DOMString align;
  //         attribute DOMString archive;
  //         attribute DOMString code;
  //         attribute boolean declare;
  //         attribute unsigned long hspace;
  //         attribute DOMString standby;
  //         attribute unsigned long vspace;
  //         attribute DOMString codeBase;
  //         attribute DOMString codeType;

  //[LegacyNullToEmptyString] attribute DOMString border;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmloptgroupelement
[Exposed=Window]
interface HTMLOptGroupElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute boolean disabled;
  // [CEReactions]
  //          attribute DOMString label;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmloptionelement
[Exposed=Window, LegacyFactoryFunction=Option(optional DOMString text = "", optional DOMString value,
                         optional boolean defaultSelected = false,
                         optional boolean selected = false)]
interface HTMLOptionElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute boolean disabled;
  readonly attribute HTMLFormElement? form;
  [CEReactions]
           attribute DOMString label;
  [CEReactions]
           attribute boolean defaultSelected;
           attribute boolean selected;
  [CEReactions]
           attribute DOMString value;

  [CEReactions]
           attribute DOMString text;
  readonly attribute long index;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmloptionscollection
[Exposed=Window]
interface HTMLOptionsCollection : HTMLCollection {
  // inherits item(), namedItem()
  [CEReactions]
  attribute unsigned long length; // shadows inherited length
  [CEReactions, Throws]
  setter undefined (unsigned long index, HTMLOptionElement? option);
  [CEReactions, Throws]
  undefined add((HTMLOptionElement or HTMLOptGroupElement) element, optional (HTMLElement or long)? before = null);
  [CEReactions]
  undefined remove(long index);
  attribute long selectedIndex;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmloutputelement
[Exposed=Window]
interface HTMLOutputElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [SameObject, PutForwards=value] readonly attribute DOMTokenList htmlFor;
  readonly attribute HTMLFormElement? form;
  [CEReactions]
           attribute DOMString name;

  [Pure] readonly attribute DOMString type;
  [CEReactions]
           attribute DOMString defaultValue;
  [CEReactions]
           attribute DOMString value;

  readonly attribute boolean willValidate;
  readonly attribute ValidityState validity;
  readonly attribute DOMString validationMessage;
  boolean checkValidity();
  boolean reportValidity();
  undefined setCustomValidity(DOMString error);

  readonly attribute NodeList labels;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlparagraphelement
[Exposed=Window]
interface HTMLParagraphElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLParagraphElement-partial
partial interface HTMLParagraphElement {
  // [CEReactions]
  //         attribute DOMString align;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlparamelement
[Exposed=Window]
interface HTMLParamElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //         attribute DOMString name;
  // [CEReactions]
  //         attribute DOMString value;

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLParamElement-partial
partial interface HTMLParamElement {
  // [CEReactions]
  //         attribute DOMString type;
  // [CEReactions]
  //         attribute DOMString valueType;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlpictureelement
[Exposed=Window]
interface HTMLPictureElement : HTMLElement {
  [HTMLConstructor] constructor();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlpreelement
[Exposed=Window]
interface HTMLPreElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLPreElement-partial
partial interface HTMLPreElement {
  [CEReactions] attribute long width;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlprogresselement
[Exposed=Window]
interface HTMLProgressElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute double value;
  [CEReactions]
           attribute double max;
  readonly attribute double position;
  readonly attribute NodeList labels;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlquoteelement
[Exposed=Window]
interface HTMLQuoteElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //          attribute DOMString cite;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlscriptelement
[Exposed=Window]
interface HTMLScriptElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute USVString src;
  [CEReactions]
           attribute DOMString type;
  [CEReactions]
           attribute boolean noModule;
  [CEReactions]
           attribute DOMString charset;
  [CEReactions]
           attribute boolean async;
  [CEReactions]
           attribute boolean defer;
  [CEReactions]
           attribute DOMString? crossOrigin;
  [CEReactions, Pure]
           attribute DOMString text;
  [CEReactions]
           attribute DOMString integrity;
  [CEReactions]
           attribute DOMString referrerPolicy;

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLScriptElement-partial
partial interface HTMLScriptElement {
  [CEReactions]
           attribute DOMString event;
  [CEReactions]
           attribute DOMString htmlFor;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlselectelement
[Exposed=Window]
interface HTMLSelectElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //          attribute boolean autofocus;
  [CEReactions]
           attribute boolean disabled;
  readonly attribute HTMLFormElement? form;
  [CEReactions]
           attribute boolean multiple;
  [CEReactions]
           attribute DOMString name;
  [CEReactions]
           attribute boolean required;
  [CEReactions]
           attribute unsigned long size;

  readonly attribute DOMString type;

  readonly attribute HTMLOptionsCollection options;
  [CEReactions]
           attribute unsigned long length;
  getter Element? item(unsigned long index);
  HTMLOptionElement? namedItem(DOMString name);

  [CEReactions, Throws]
  undefined add((HTMLOptionElement or HTMLOptGroupElement) element, optional (HTMLElement or long)? before = null);
  [CEReactions]
  undefined remove(); // ChildNode overload
  [CEReactions]
  undefined remove(long index);
  [CEReactions, Throws] setter undefined (unsigned long index, HTMLOptionElement? option);

  // readonly attribute HTMLCollection selectedOptions;
  attribute long selectedIndex;
  attribute DOMString value;

  readonly attribute boolean willValidate;
  readonly attribute ValidityState validity;
  readonly attribute DOMString validationMessage;
  boolean checkValidity();
  boolean reportValidity();
  undefined setCustomValidity(DOMString error);

  readonly attribute NodeList labels;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlsourceelement
[Exposed=Window]
interface HTMLSourceElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute DOMString src;
  [CEReactions]
           attribute DOMString type;
  [CEReactions]
            attribute DOMString srcset;
  [CEReactions]
            attribute DOMString sizes;
  [CEReactions]
            attribute DOMString media;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlspanelement
[Exposed=Window]
interface HTMLSpanElement : HTMLElement {
  [HTMLConstructor] constructor();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlstyleelement
[Exposed=Window]
interface HTMLStyleElement : HTMLElement {
  [HTMLConstructor] constructor();

  attribute boolean disabled;
  // [CEReactions]
  //          attribute DOMString media;
  // [CEReactions]
  //          attribute DOMString type;
  // [CEReactions]
  //          attribute boolean scoped;
};
HTMLStyleElement includes LinkStyle;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltablecaptionelement
[Exposed=Window]
interface HTMLTableCaptionElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLTableCaptionElement-partial
partial interface HTMLTableCaptionElement {
  // [CEReactions]
  //          attribute DOMString align;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltablecellelement
[Exposed=Window]
interface HTMLTableCellElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute unsigned long colSpan;
  [CEReactions]
           attribute unsigned long rowSpan;
  // [CEReactions]
  //          attribute DOMString headers;
  readonly attribute long cellIndex;

  // [CEReactions]
  //          attribute DOMString scope; // only conforming for th elements
  // [CEReactions]
  //          attribute DOMString abbr;  // only conforming for th elements

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLTableCellElement-partial
partial interface HTMLTableCellElement {
  // [CEReactions]
  //          attribute DOMString align;
  // [CEReactions]
  //          attribute DOMString axis;
  // [CEReactions]
  //          attribute DOMString height;
  [CEReactions]
  attribute DOMString width;

  //          attribute DOMString ch;
  // [CEReactions]
  //          attribute DOMString chOff;
  // [CEReactions]
  //          attribute boolean noWrap;
  // [CEReactions]
  //          attribute DOMString vAlign;

  [CEReactions]
  attribute [LegacyNullToEmptyString] DOMString bgColor;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltablecolelement
[Exposed=Window]
interface HTMLTableColElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
            attribute unsigned long span;

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLTableColElement-partial
partial interface HTMLTableColElement {
  // [CEReactions]
  //          attribute DOMString align;
  // [CEReactions]
  //          attribute DOMString ch;
  // [CEReactions]
  //          attribute DOMString chOff;
  // [CEReactions]
  //          attribute DOMString vAlign;
  // [CEReactions]
  //          attribute DOMString width;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltableelement
[Exposed=Window]
interface HTMLTableElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions, SetterThrows]
           attribute HTMLTableCaptionElement? caption;
  HTMLTableCaptionElement createCaption();
  [CEReactions]
  undefined deleteCaption();

  [CEReactions, SetterThrows]
           attribute HTMLTableSectionElement? tHead;
  HTMLTableSectionElement createTHead();
  [CEReactions]
  undefined deleteTHead();

  [CEReactions, SetterThrows]
           attribute HTMLTableSectionElement? tFoot;
  HTMLTableSectionElement createTFoot();
  [CEReactions]
  undefined deleteTFoot();

  readonly attribute HTMLCollection tBodies;
  HTMLTableSectionElement createTBody();

  readonly attribute HTMLCollection rows;
  [Throws] HTMLTableRowElement insertRow(optional long index = -1);
  [CEReactions, Throws] undefined deleteRow(long index);

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLTableElement-partial
partial interface HTMLTableElement {
  // [CEReactions]
  //          attribute DOMString align;
  // [CEReactions]
  //          attribute DOMString border;
  // [CEReactions]
  //          attribute DOMString frame;
  // [CEReactions]
  //          attribute DOMString rules;
  // [CEReactions]
  //          attribute DOMString summary;
  [CEReactions]
  attribute DOMString width;

  [CEReactions]
           attribute [LegacyNullToEmptyString] DOMString bgColor;
  // [CEReactions, LegacyNullToEmptyString]
  //          attribute DOMString cellPadding;
  // [CEReactions, LegacyNullToEmptyString]
  //          attribute DOMString cellSpacing;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltablerowelement
[Exposed=Window]
interface HTMLTableRowElement : HTMLElement {
  [HTMLConstructor] constructor();

  readonly attribute long rowIndex;
  readonly attribute long sectionRowIndex;
  readonly attribute HTMLCollection cells;
  [Throws]
  HTMLElement insertCell(optional long index = -1);
  [CEReactions, Throws]
  undefined deleteCell(long index);

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLTableRowElement-partial
partial interface HTMLTableRowElement {
  // [CEReactions]
  //          attribute DOMString align;
  // [CEReactions]
  //          attribute DOMString ch;
  // [CEReactions]
  //          attribute DOMString chOff;
  // [CEReactions]
  //          attribute DOMString vAlign;

  [CEReactions]
           attribute [LegacyNullToEmptyString] DOMString bgColor;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltablesectionelement
[Exposed=Window]
interface HTMLTableSectionElement : HTMLElement {
  [HTMLConstructor] constructor();

  readonly attribute HTMLCollection rows;
  [Throws]
  HTMLElement insertRow(optional long index = -1);
  [CEReactions, Throws]
  undefined deleteRow(long index);

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLTableSectionElement-partial
partial interface HTMLTableSectionElement {
  // [CEReactions]
  //          attribute DOMString align;
  // [CEReactions]
  //          attribute DOMString ch;
  // [CEReactions]
  //          attribute DOMString chOff;
  // [CEReactions]
  //          attribute DOMString vAlign;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltemplateelement
[Exposed=Window]
interface HTMLTemplateElement : HTMLElement {
  [HTMLConstructor] constructor();

  readonly attribute DocumentFragment content;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltextareaelement
[Exposed=Window]
interface HTMLTextAreaElement : HTMLElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //          attribute DOMString autocomplete;
  // [CEReactions]
  //          attribute boolean autofocus;
  [CEReactions, SetterThrows]
           attribute unsigned long cols;
  [CEReactions]
           attribute DOMString dirName;
  [CEReactions]
           attribute boolean disabled;
  readonly attribute HTMLFormElement? form;
  // [CEReactions]
  //          attribute DOMString inputMode;
  [CEReactions, SetterThrows]
           attribute long maxLength;
  [CEReactions, SetterThrows]
           attribute long minLength;
  [CEReactions]
           attribute DOMString name;
  [CEReactions]
           attribute DOMString placeholder;
  [CEReactions]
           attribute boolean readOnly;
  [CEReactions]
           attribute boolean required;
  [CEReactions, SetterThrows]
           attribute unsigned long rows;
  [CEReactions]
           attribute DOMString wrap;

  readonly attribute DOMString type;
  [CEReactions]
           attribute DOMString defaultValue;
           attribute [LegacyNullToEmptyString] DOMString value;
  readonly attribute unsigned long textLength;

  readonly attribute boolean willValidate;
  readonly attribute ValidityState validity;
  readonly attribute DOMString validationMessage;
  boolean checkValidity();
  boolean reportValidity();
  undefined setCustomValidity(DOMString error);

  readonly attribute NodeList labels;

  undefined select();
  [SetterThrows]
           attribute unsigned long? selectionStart;
  [SetterThrows]
           attribute unsigned long? selectionEnd;
  [SetterThrows]
           attribute DOMString? selectionDirection;
  [Throws]
           undefined setRangeText(DOMString replacement);
  [Throws]
           undefined setRangeText(DOMString replacement, unsigned long start, unsigned long end,
                             optional SelectionMode selectionMode = "preserve");
  [Throws]
           undefined setSelectionRange(unsigned long start, unsigned long end, optional DOMString direction);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltimeelement
[Exposed=Window]
interface HTMLTimeElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
  attribute DOMString dateTime;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltitleelement
[Exposed=Window]
interface HTMLTitleElement : HTMLElement {
    [HTMLConstructor] constructor();

    [CEReactions, Pure]
    attribute DOMString text;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmltrackelement
[Exposed=Window]
interface HTMLTrackElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions]
           attribute DOMString kind;
  [CEReactions]
           attribute USVString src;
  [CEReactions]
           attribute DOMString srclang;
  [CEReactions]
           attribute DOMString label;
  [CEReactions]
           attribute boolean default;

  const unsigned short NONE = 0;
  const unsigned short LOADING = 1;
  const unsigned short LOADED = 2;
  const unsigned short ERROR = 3;
  readonly attribute unsigned short readyState;

  readonly attribute TextTrack track;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlulistelement
[Exposed=Window]
interface HTMLUListElement : HTMLElement {
  [HTMLConstructor] constructor();

  // also has obsolete members
};

// https://html.spec.whatwg.org/multipage/#HTMLUListElement-partial
partial interface HTMLUListElement {
  // [CEReactions]
  //          attribute boolean compact;
  // [CEReactions]
  //          attribute DOMString type;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://html.spec.whatwg.org/multipage/#htmlunknownelement and
 * http://dev.w3.org/csswg/cssom-view/
 *
 * © Copyright 2004-2011 Apple Computer, Inc., Mozilla Foundation, and
 * Opera Software ASA. You are granted a license to use, reproduce
 * and create derivative works of this document.
 */

[Exposed=Window]
interface HTMLUnknownElement : HTMLElement {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#htmlvideoelement
[Exposed=Window]
interface HTMLVideoElement : HTMLMediaElement {
  [HTMLConstructor] constructor();

  // [CEReactions]
  //          attribute unsigned long width;
  // [CEReactions]
  //          attribute unsigned long height;
  readonly attribute unsigned long videoWidth;
  readonly attribute unsigned long videoHeight;
  [CEReactions] attribute DOMString poster;
};

partial interface HTMLVideoElement {
  [Pref="media.testing.enabled"]
  attribute EventHandler onpostershown;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#hashchangeevent
[Exposed=Window]
interface HashChangeEvent : Event {
  [Throws] constructor(DOMString type, optional HashChangeEventInit eventInitDict = {});
  readonly attribute USVString oldURL;
  readonly attribute USVString newURL;
};

dictionary HashChangeEventInit : EventInit {
  USVString oldURL = "";
  USVString newURL = "";
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://fetch.spec.whatwg.org/#headers-class

typedef (sequence<sequence<ByteString>> or record<ByteString, ByteString>) HeadersInit;

[Exposed=(Window,Worker)]
interface Headers {
  [Throws] constructor(optional HeadersInit init);
  [Throws]
  undefined append(ByteString name, ByteString value);
  [Throws]
  undefined delete(ByteString name);
  [Throws]
  ByteString? get(ByteString name);
  sequence<ByteString> getSetCookie();
  [Throws]
  boolean has(ByteString name);
  [Throws]
  undefined set(ByteString name, ByteString value);
  iterable<ByteString, ByteString>;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// enum ScrollRestoration { "auto", "manual" };

// https://html.spec.whatwg.org/multipage/#the-history-interface
[Exposed=(Window,Worker)]
interface History {
  [Throws]
  readonly attribute unsigned long length;
  // [Throws]
  // attribute ScrollRestoration scrollRestoration;
  [Throws]
  readonly attribute any state;
  [Throws]
  undefined go(optional long delta = 0);
  [Throws]
  undefined back();
  [Throws]
  undefined forward();
  [Throws]
  undefined pushState(any data, DOMString title, optional USVString? url = null);
  [Throws]
  undefined replaceState(any data, DOMString title, optional USVString? url = null);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://html.spec.whatwg.org/multipage/#imagebitmap
 *
 * © Copyright 2004-2011 Apple Computer, Inc., Mozilla Foundation, and Opera Software ASA.
 * You are granted a license to use, reproduce and create derivative works of this document.
 */

//[Exposed=(Window,Worker), Serializable, Transferable]
[Exposed=(Window,Worker), Pref="dom.imagebitmap.enabled"]
interface ImageBitmap {
  readonly attribute unsigned long width;
  readonly attribute unsigned long height;
  //void close();
};

typedef (CanvasImageSource or
         Blob or
         ImageData) ImageBitmapSource;

enum ImageOrientation { "none", "flipY" };
enum PremultiplyAlpha { "none", "premultiply", "default" };
enum ColorSpaceConversion { "none", "default" };
enum ResizeQuality { "pixelated", "low", "medium", "high" };

dictionary ImageBitmapOptions {
  ImageOrientation imageOrientation = "none";
  PremultiplyAlpha premultiplyAlpha = "default";
  ColorSpaceConversion colorSpaceConversion = "default";
  [EnforceRange] unsigned long resizeWidth;
  [EnforceRange] unsigned long resizeHeight;
  ResizeQuality resizeQuality = "low";
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/uievents/#idl-inputevent
 *
 */

// https://w3c.github.io/uievents/#idl-inputevent
[Exposed=Window]
interface InputEvent : UIEvent {
  [Throws] constructor(DOMString type, optional InputEventInit eventInitDict = {});
  readonly attribute DOMString? data;
  readonly attribute boolean isComposing;
};

// https://w3c.github.io/uievents/#idl-inputeventinit
dictionary InputEventInit : UIEventInit {
  DOMString? data = null;
  boolean isComposing = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

dictionary IterableKeyOrValueResult {
  any value;
  boolean done = false;
};

dictionary IterableKeyAndValueResult {
  sequence<any> value;
  boolean done = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/uievents/#interface-keyboardevent
 *
 */

[Exposed=Window]
interface KeyboardEvent : UIEvent {
    [Throws] constructor(DOMString typeArg, optional KeyboardEventInit keyboardEventInitDict = {});
    // KeyLocationCode
    const unsigned long DOM_KEY_LOCATION_STANDARD = 0x00;
    const unsigned long DOM_KEY_LOCATION_LEFT = 0x01;
    const unsigned long DOM_KEY_LOCATION_RIGHT = 0x02;
    const unsigned long DOM_KEY_LOCATION_NUMPAD = 0x03;
    readonly    attribute DOMString     key;
    readonly    attribute DOMString     code;
    readonly    attribute unsigned long location;
    readonly    attribute boolean       ctrlKey;
    readonly    attribute boolean       shiftKey;
    readonly    attribute boolean       altKey;
    readonly    attribute boolean       metaKey;
    readonly    attribute boolean       repeat;
    readonly    attribute boolean       isComposing;
    boolean getModifierState (DOMString keyArg);
};

// https://w3c.github.io/uievents/#idl-interface-KeyboardEvent-initializers
partial interface KeyboardEvent {
    // Originally introduced (and deprecated) in DOM Level 3
    undefined initKeyboardEvent (DOMString typeArg, boolean bubblesArg, boolean cancelableArg, Window? viewArg,
                            DOMString keyArg, unsigned long locationArg, DOMString modifiersListArg,
                            boolean repeat, DOMString locale);
};

// https://w3c.github.io/uievents/#legacy-interface-KeyboardEvent
partial interface KeyboardEvent {
    // The following support legacy user agents
    readonly    attribute unsigned long charCode;
    readonly    attribute unsigned long keyCode;
    readonly    attribute unsigned long which;
};

// https://w3c.github.io/uievents/#dictdef-keyboardeventinit
dictionary KeyboardEventInit : EventModifierInit {
    DOMString     key = "";
    DOMString     code = "";
    unsigned long location = 0;
    boolean       repeat = false;
    boolean       isComposing = false;
};

// https://w3c.github.io/uievents/#legacy-dictionary-KeyboardEventInit
/*partial dictionary KeyboardEventInit {
    unsigned long charCode = 0;
    unsigned long keyCode = 0;
    unsigned long which = 0;
};*/
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#location
[Exposed=Window, LegacyUnforgeable] interface Location {
  [Throws, CrossOriginWritable]
        stringifier attribute USVString href;
  [Throws] readonly attribute USVString origin;
  [Throws]          attribute USVString protocol;
  [Throws]          attribute USVString host;
  [Throws]          attribute USVString hostname;
  [Throws]          attribute USVString port;
  [Throws]          attribute USVString pathname;
  [Throws]          attribute USVString search;
  [Throws]          attribute USVString hash;

  [Throws] undefined assign(USVString url);
  [Throws, CrossOriginCallable]
           undefined replace(USVString url);
  [Throws] undefined reload();

  //[SameObject] readonly attribute USVString[] ancestorOrigins;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

 // https://w3c.github.io/mediacapture-main/#device-info

[Exposed=Window,
SecureContext, Pref="dom.webrtc.enabled"]
interface MediaDeviceInfo {
  readonly attribute DOMString deviceId;
  readonly attribute MediaDeviceKind kind;
  readonly attribute DOMString label;
  readonly attribute DOMString groupId;
  [Default] object toJSON();
};

enum MediaDeviceKind {
  "audioinput",
  "audiooutput",
  "videoinput"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/mediacapture-main/#dom-mediadevices

[Exposed=Window,
SecureContext, Pref="dom.webrtc.enabled"]
interface MediaDevices : EventTarget {
    //                attribute EventHandler ondevicechange;
    Promise<sequence<MediaDeviceInfo>> enumerateDevices();
};

partial interface Navigator {
    // [SameObject, SecureContext]
    [Pref="dom.webrtc.enabled"] readonly        attribute MediaDevices mediaDevices;
};

partial interface MediaDevices {
    // MediaTrackSupportedConstraints getSupportedConstraints();
    Promise<MediaStream> getUserMedia(optional MediaStreamConstraints constraints = {});
};


dictionary MediaStreamConstraints {
        (boolean or MediaTrackConstraints) video = false;
        (boolean or MediaTrackConstraints) audio = false;
};

dictionary DoubleRange {
             double max;
             double min;
};

dictionary ConstrainDoubleRange : DoubleRange {
             double exact;
             double ideal;
};

dictionary ULongRange {
             [Clamp] unsigned long max;
             [Clamp] unsigned long min;
};

dictionary ConstrainULongRange : ULongRange {
             [Clamp] unsigned long exact;
             [Clamp] unsigned long ideal;
};

// dictionary ConstrainBooleanParameters {
//              boolean exact;
//              boolean ideal;
// };

// dictionary ConstrainDOMStringParameters {
//              (DOMString or sequence<DOMString>) exact;
//              (DOMString or sequence<DOMString>) ideal;
// };

dictionary MediaTrackConstraints : MediaTrackConstraintSet {
             sequence<MediaTrackConstraintSet> advanced;
};

typedef ([Clamp] unsigned long or ConstrainULongRange) ConstrainULong;
typedef (double or ConstrainDoubleRange) ConstrainDouble;
// typedef (boolean or ConstrainBooleanParameters) ConstrainBoolean;
// typedef (DOMString or sequence<DOMString> or ConstrainDOMStringParameters) ConstrainDOMString;

dictionary MediaTrackConstraintSet {
             ConstrainULong width;
             ConstrainULong height;
             ConstrainDouble aspectRatio;
             ConstrainDouble frameRate;
             // ConstrainDOMString facingMode;
             // ConstrainDOMString resizeMode;
             // ConstrainDouble volume;
             ConstrainULong sampleRate;
             // ConstrainULong sampleSize;
             // ConstrainBoolean echoCancellation;
             // ConstrainBoolean autoGainControl;
             // ConstrainBoolean noiseSuppression;
             // ConstrainDouble latency;
             // ConstrainULong channelCount;
             // ConstrainDOMString deviceId;
             // ConstrainDOMString groupId;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#mediaelementaudiosourcenode
 */

dictionary MediaElementAudioSourceOptions {
  required HTMLMediaElement mediaElement;
};

[Exposed=Window]
interface MediaElementAudioSourceNode : AudioNode {
  [Throws] constructor (AudioContext context, MediaElementAudioSourceOptions options);
  [SameObject] readonly attribute HTMLMediaElement mediaElement;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#mediaerror

[Exposed=Window]
interface MediaError {
  const unsigned short MEDIA_ERR_ABORTED = 1;
  const unsigned short MEDIA_ERR_NETWORK = 2;
  const unsigned short MEDIA_ERR_DECODE = 3;
  const unsigned short MEDIA_ERR_SRC_NOT_SUPPORTED = 4;
  readonly attribute unsigned short code;
  readonly attribute DOMString message;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-medialist-interface
[Exposed=Window]
interface MediaList {
  stringifier attribute [LegacyNullToEmptyString] DOMString mediaText;
  readonly attribute unsigned long length;
  getter DOMString? item(unsigned long index);
  undefined appendMedium(DOMString medium);
  undefined deleteMedium(DOMString medium);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/mediasession/#mediametadata
 */

dictionary MediaImage {
  required USVString src;
  DOMString sizes = "";
  DOMString type = "";
};

[Exposed=Window]
interface MediaMetadata {
  [Throws] constructor(optional MediaMetadataInit init = {});
  attribute DOMString title;
  attribute DOMString artist;
  attribute DOMString album;
  // TODO: https://github.com/servo/servo/issues/10072
  // attribute FrozenArray<MediaImage> artwork;
};

dictionary MediaMetadataInit {
  DOMString title = "";
  DOMString artist = "";
  DOMString album = "";
  sequence<MediaImage> artwork = [];
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom-view/#mediaquerylist

[Exposed=(Window)]
interface MediaQueryList : EventTarget {
  readonly attribute DOMString media;
  readonly attribute boolean matches;
  undefined addListener(EventListener? listener);
  undefined removeListener(EventListener? listener);
           attribute EventHandler onchange;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom-view/#dom-mediaquerylistevent-mediaquerylistevent
[Exposed=(Window)]
interface MediaQueryListEvent : Event {
  [Throws] constructor(DOMString type, optional MediaQueryListEventInit eventInitDict = {});
  readonly attribute DOMString media;
  readonly attribute boolean matches;
};

dictionary MediaQueryListEventInit : EventInit {
  DOMString media = "";
  boolean matches = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/mediasession/#mediasession
 */

[Exposed=Window]
partial interface Navigator {
  [SameObject] readonly attribute MediaSession mediaSession;
};

enum MediaSessionPlaybackState {
  "none",
  "paused",
  "playing"
};

enum MediaSessionAction {
  "play",
  "pause",
  "seekbackward",
  "seekforward",
  "previoustrack",
  "nexttrack",
  "skipad",
  "stop",
  "seekto"
};

dictionary MediaSessionActionDetails {
  required MediaSessionAction action;
};

dictionary MediaSessionSeekActionDetails : MediaSessionActionDetails {
  double? seekOffset;
};

dictionary MediaSessionSeekToActionDetails : MediaSessionActionDetails {
  required double seekTime;
  boolean? fastSeek;
};

dictionary MediaPositionState {
  double duration;
  double playbackRate;
  double position;
};

callback MediaSessionActionHandler = undefined(/*MediaSessionActionDetails details*/);

[Exposed=Window]
interface MediaSession {
  attribute MediaMetadata? metadata;

  attribute MediaSessionPlaybackState playbackState;

  undefined setActionHandler(MediaSessionAction action, MediaSessionActionHandler? handler);

  [Throws] undefined setPositionState(optional MediaPositionState state = {});
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/mediacapture-main/#dom-mediastream

[Exposed=Window]
interface MediaStream : EventTarget {
    [Throws] constructor();
    [Throws] constructor(MediaStream stream);
    [Throws] constructor(sequence<MediaStreamTrack> tracks);
    // readonly        attribute DOMString id;
    sequence<MediaStreamTrack> getAudioTracks();
    sequence<MediaStreamTrack> getVideoTracks();
    sequence<MediaStreamTrack> getTracks();
    MediaStreamTrack? getTrackById(DOMString trackId);
    undefined addTrack(MediaStreamTrack track);
    undefined removeTrack(MediaStreamTrack track);
    MediaStream clone();
    // readonly        attribute boolean active;
    //                 attribute EventHandler onaddtrack;
    //                 attribute EventHandler onremovetrack;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#mediastreamaudiodestinationnode
 */

[Exposed=Window]
interface MediaStreamAudioDestinationNode : AudioNode {
  [Throws] constructor (AudioContext context, optional AudioNodeOptions options = {});
  readonly attribute MediaStream stream;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#mediastreamaudiosourcenode
 */

dictionary MediaStreamAudioSourceOptions {
  required MediaStream mediaStream;
};

[Exposed=Window]
interface MediaStreamAudioSourceNode : AudioNode {
  [Throws] constructor (AudioContext context, MediaStreamAudioSourceOptions options);
  [SameObject] readonly attribute MediaStream mediaStream;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/mediacapture-main/#dom-mediastreamtrack

[Exposed=Window]
interface MediaStreamTrack : EventTarget {
    readonly        attribute DOMString kind;
    readonly        attribute DOMString id;
    // readonly        attribute DOMString label;
    //                 attribute boolean enabled;
    // readonly        attribute boolean muted;
    //                 attribute EventHandler onmute;
    //                 attribute EventHandler onunmute;
    // readonly        attribute MediaStreamTrackState readyState;
    //                 attribute EventHandler onended;
    MediaStreamTrack clone();
    // void stop();
    // MediaTrackCapabilities getCapabilities();
    // MediaTrackConstraints getConstraints();
    // MediaTrackSettings getSettings();
    // Promise<void> applyConstraints(optional MediaTrackConstraints constraints);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#mediastreamtrackaudiosourcenode
 */

dictionary MediaStreamTrackAudioSourceOptions {
  required MediaStreamTrack mediaStreamTrack;
};

[Exposed=Window]
interface MediaStreamTrackAudioSourceNode : AudioNode {
  [Throws] constructor (AudioContext context, MediaStreamTrackAudioSourceOptions options);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://html.spec.whatwg.org/multipage/#messagechannel
 */

[Exposed=(Window,Worker)]
interface MessageChannel {
  constructor();
  readonly attribute MessagePort port1;
  readonly attribute MessagePort port2;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#messageevent
[Exposed=(Window,Worker)]
interface MessageEvent : Event {
  [Throws] constructor(DOMString type, optional MessageEventInit eventInitDict = {});
  readonly attribute any data;
  readonly attribute DOMString origin;
  readonly attribute DOMString lastEventId;
  readonly attribute MessageEventSource? source;
  readonly attribute /*FrozenArray<MessagePort>*/any ports;

  undefined initMessageEvent(
    DOMString type,
    optional boolean bubbles = false,
    optional boolean cancelable = false,
    optional any data = null,
    optional DOMString origin = "",
    optional DOMString lastEventId = "",
    optional MessageEventSource? source = null,
    optional sequence<MessagePort> ports = []
  );
};

dictionary MessageEventInit : EventInit {
  any data = null;
  DOMString origin = "";
  DOMString lastEventId = "";
  //DOMString channel;
  MessageEventSource? source = null;
  sequence<MessagePort> ports = [];
};

typedef (WindowProxy or MessagePort or ServiceWorker) MessageEventSource;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://html.spec.whatwg.org/multipage/#messageport
 */

[Exposed=(Window,Worker)]
interface MessagePort : EventTarget {
  [Throws] undefined postMessage(any message, sequence<object> transfer);
  [Throws] undefined postMessage(any message, optional PostMessageOptions options = {});
  undefined start();
  undefined close();

  // event handlers
  attribute EventHandler onmessage;
  attribute EventHandler onmessageerror;
};

dictionary PostMessageOptions {
  sequence<object> transfer = [];
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#mimetype
[Exposed=Window]
interface MimeType {
  readonly attribute DOMString type;
  readonly attribute DOMString description;
  readonly attribute DOMString suffixes; // comma-separated
  readonly attribute Plugin enabledPlugin;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#mimetypearray
[LegacyUnenumerableNamedProperties, Exposed=Window]
interface MimeTypeArray {
  readonly attribute unsigned long length;
  getter MimeType? item(unsigned long index);
  getter MimeType? namedItem(DOMString name);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/uievents/#interface-mouseevent
[Exposed=Window]
interface MouseEvent : UIEvent {
    [Throws] constructor(DOMString typeArg, optional MouseEventInit mouseEventInitDict = {});
    readonly    attribute long           screenX;
    readonly    attribute long           screenY;
    readonly    attribute long           clientX;
    readonly    attribute long           clientY;
    readonly    attribute long           pageX;
    readonly    attribute long           pageY;
    readonly    attribute long           x;
    readonly    attribute long           y;
    readonly    attribute long           offsetX;
    readonly    attribute long           offsetY;
    readonly    attribute boolean        ctrlKey;
    readonly    attribute boolean        shiftKey;
    readonly    attribute boolean        altKey;
    readonly    attribute boolean        metaKey;
    readonly    attribute short          button;
    readonly    attribute EventTarget?   relatedTarget;
    // Introduced in DOM Level 3
    readonly    attribute unsigned short buttons;
    //boolean getModifierState (DOMString keyArg);

    [Pref="dom.mouseevent.which.enabled"]
    readonly    attribute long           which;
};

// https://w3c.github.io/uievents/#dictdef-eventmodifierinit
dictionary MouseEventInit : EventModifierInit {
    long           screenX = 0;
    long           screenY = 0;
    long           clientX = 0;
    long           clientY = 0;
    short          button = 0;
    unsigned short buttons = 0;
    EventTarget?   relatedTarget = null;
};

// https://w3c.github.io/uievents/#idl-interface-MouseEvent-initializers
partial interface MouseEvent {
    // Deprecated in DOM Level 3
    undefined initMouseEvent (DOMString typeArg, boolean bubblesArg, boolean cancelableArg,
                         Window? viewArg, long detailArg,
                         long screenXArg, long screenYArg,
                         long clientXArg, long clientYArg,
                         boolean ctrlKeyArg, boolean altKeyArg,
                         boolean shiftKeyArg, boolean metaKeyArg,
                         short buttonArg, EventTarget? relatedTargetArg);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://dom.spec.whatwg.org/#mutationobserver
 */

// https://dom.spec.whatwg.org/#mutationobserver
[Exposed=Window, Pref="dom.mutation_observer.enabled"]
interface MutationObserver {
    [Throws] constructor(MutationCallback callback);
    [Throws]
    undefined observe(Node target, optional MutationObserverInit options = {});
    undefined disconnect();
    sequence<MutationRecord> takeRecords();
};

callback MutationCallback = undefined (sequence<MutationRecord> mutations, MutationObserver observer);

dictionary MutationObserverInit {
    boolean childList = false;
    boolean attributes;
    boolean characterData;
    boolean subtree = false;
    boolean attributeOldValue;
    boolean characterDataOldValue;
    sequence<DOMString> attributeFilter;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://dom.spec.whatwg.org/#mutationrecord
 */

// https://dom.spec.whatwg.org/#mutationrecord
[Pref="dom.mutation_observer.enabled", Exposed=Window]
interface MutationRecord {
    readonly attribute DOMString type;
    [SameObject]
    readonly attribute Node target;
    [SameObject]
    readonly attribute NodeList addedNodes;
    [SameObject]
    readonly attribute NodeList removedNodes;
    readonly attribute Node? previousSibling;
    readonly attribute Node? nextSibling;
    readonly attribute DOMString? attributeName;
    readonly attribute DOMString? attributeNamespace;
    readonly attribute DOMString? oldValue;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://dom.spec.whatwg.org/#interface-namednodemap

[Exposed=Window, LegacyUnenumerableNamedProperties]
interface NamedNodeMap {
  [Pure]
  readonly attribute unsigned long length;
  [Pure]
  getter Attr? item(unsigned long index);
  [Pure]
  getter Attr? getNamedItem(DOMString qualifiedName);
  [Pure]
  Attr? getNamedItemNS(DOMString? namespace, DOMString localName);
  [CEReactions, Throws]
  Attr? setNamedItem(Attr attr);
  [CEReactions, Throws]
  Attr? setNamedItemNS(Attr attr);
  [CEReactions, Throws]
  Attr removeNamedItem(DOMString qualifiedName);
  [CEReactions, Throws]
  Attr removeNamedItemNS(DOMString? namespace, DOMString localName);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/ServiceWorker/#navigation-preload-manager
[Pref="dom.serviceworker.enabled", SecureContext, Exposed=(Window,Worker)]
interface NavigationPreloadManager {
  Promise<undefined> enable();
  Promise<undefined> disable();
  Promise<undefined> setHeaderValue(ByteString value);
  Promise<NavigationPreloadState> getState();
};

dictionary NavigationPreloadState {
  boolean enabled = false;
  ByteString headerValue;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#navigator
[Exposed=Window]
interface Navigator {
  // objects implementing this interface also implement the interfaces given below
};
Navigator includes NavigatorID;
Navigator includes NavigatorLanguage;
//Navigator includes NavigatorOnLine;
//Navigator includes NavigatorContentUtils;
//Navigator includes NavigatorStorageUtils;
Navigator includes NavigatorPlugins;
Navigator includes NavigatorCookies;
Navigator includes NavigatorGPU;
Navigator includes NavigatorConcurrentHardware;

// https://html.spec.whatwg.org/multipage/#navigatorid
[Exposed=(Window,Worker)]
interface mixin NavigatorID {
  readonly attribute DOMString appCodeName; // constant "Mozilla"
  readonly attribute DOMString appName;
  readonly attribute DOMString appVersion;
  readonly attribute DOMString platform;
  readonly attribute DOMString product; // constant "Gecko"
  [Exposed=Window] readonly attribute DOMString productSub;
  boolean taintEnabled(); // constant false
  readonly attribute DOMString userAgent;
  [Exposed=Window] readonly attribute DOMString vendor;
  [Exposed=Window] readonly attribute DOMString vendorSub; // constant ""
};

// https://webbluetoothcg.github.io/web-bluetooth/#navigator-extensions
partial interface Navigator {
  [SameObject, Pref="dom.bluetooth.enabled"] readonly attribute Bluetooth bluetooth;
};

// https://w3c.github.io/ServiceWorker/#navigator-service-worker
partial interface Navigator {
  [SameObject, Pref="dom.serviceworker.enabled"] readonly attribute ServiceWorkerContainer serviceWorker;
};

// https://html.spec.whatwg.org/multipage/#navigatorlanguage
[Exposed=(Window,Worker)]
interface mixin NavigatorLanguage {
  readonly attribute DOMString language;
  readonly attribute any languages;
};

// https://html.spec.whatwg.org/multipage/#navigatorplugins
interface mixin NavigatorPlugins {
  [SameObject] readonly attribute PluginArray plugins;
  [SameObject] readonly attribute MimeTypeArray mimeTypes;
  boolean javaEnabled();
};

// https://html.spec.whatwg.org/multipage/#navigatorcookies
interface mixin NavigatorCookies {
  readonly attribute boolean cookieEnabled;
};

// https://w3c.github.io/permissions/#navigator-and-workernavigator-extension
[Exposed=(Window)]
partial interface Navigator {
  [Pref="dom.permissions.enabled"] readonly attribute Permissions permissions;
};

// https://w3c.github.io/gamepad/#navigator-interface-extension
partial interface Navigator {
  [Pref="dom.gamepad.enabled"] sequence<Gamepad?> getGamepads();
};

// https://html.spec.whatwg.org/multipage/#navigatorconcurrenthardware
interface mixin NavigatorConcurrentHardware {
  readonly attribute unsigned long long hardwareConcurrency;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://dom.spec.whatwg.org/#interface-node
 */

[Exposed=Window, Abstract]
interface Node : EventTarget {
  const unsigned short ELEMENT_NODE = 1;
  const unsigned short ATTRIBUTE_NODE = 2; // historical
  const unsigned short TEXT_NODE = 3;
  const unsigned short CDATA_SECTION_NODE = 4; // historical
  const unsigned short ENTITY_REFERENCE_NODE = 5; // historical
  const unsigned short ENTITY_NODE = 6; // historical
  const unsigned short PROCESSING_INSTRUCTION_NODE = 7;
  const unsigned short COMMENT_NODE = 8;
  const unsigned short DOCUMENT_NODE = 9;
  const unsigned short DOCUMENT_TYPE_NODE = 10;
  const unsigned short DOCUMENT_FRAGMENT_NODE = 11;
  const unsigned short NOTATION_NODE = 12; // historical
  [Constant]
  readonly attribute unsigned short nodeType;
  [Pure]
  readonly attribute DOMString nodeName;

  [Pure]
  readonly attribute USVString baseURI;

  [Pure]
  readonly attribute boolean isConnected;

  [Pure]
  readonly attribute Document? ownerDocument;

  [Pure]
  Node getRootNode(optional GetRootNodeOptions options = {});

  [Pure]
  readonly attribute Node? parentNode;
  [Pure]
  readonly attribute Element? parentElement;
  [Pure]
  boolean hasChildNodes();
  [SameObject]
  readonly attribute NodeList childNodes;
  [Pure]
  readonly attribute Node? firstChild;
  [Pure]
  readonly attribute Node? lastChild;
  [Pure]
  readonly attribute Node? previousSibling;
  [Pure]
  readonly attribute Node? nextSibling;

  [CEReactions, Pure]
           attribute DOMString? nodeValue;
  [CEReactions, Pure]
           attribute DOMString? textContent;
  [CEReactions]
  undefined normalize();

  [CEReactions, Throws]
  Node cloneNode(optional boolean deep = false);
  [Pure]
  boolean isEqualNode(Node? node);
  [Pure]
  boolean isSameNode(Node? otherNode); // historical alias of ===

  const unsigned short DOCUMENT_POSITION_DISCONNECTED = 0x01;
  const unsigned short DOCUMENT_POSITION_PRECEDING = 0x02;
  const unsigned short DOCUMENT_POSITION_FOLLOWING = 0x04;
  const unsigned short DOCUMENT_POSITION_CONTAINS = 0x08;
  const unsigned short DOCUMENT_POSITION_CONTAINED_BY = 0x10;
  const unsigned short DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC = 0x20;
  [Pure]
  unsigned short compareDocumentPosition(Node other);
  [Pure]
  boolean contains(Node? other);

  [Pure]
  DOMString? lookupPrefix(DOMString? namespace);
  [Pure]
  DOMString? lookupNamespaceURI(DOMString? prefix);
  [Pure]
  boolean isDefaultNamespace(DOMString? namespace);

  [CEReactions, Throws]
  Node insertBefore(Node node, Node? child);
  [CEReactions, Throws]
  Node appendChild(Node node);
  [CEReactions, Throws]
  Node replaceChild(Node node, Node child);
  [CEReactions, Throws]
  Node removeChild(Node child);
};

dictionary GetRootNodeOptions {
  boolean composed = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-nodefilter
 */
// Import from http://hg.mozilla.org/mozilla-central/file/a5a720259d79/dom/webidl/NodeFilter.webidl

[Exposed=Window]
callback interface NodeFilter {
  // Constants for acceptNode()
  const unsigned short FILTER_ACCEPT = 1;
  const unsigned short FILTER_REJECT = 2;
  const unsigned short FILTER_SKIP = 3;

  // Constants for whatToShow
  const unsigned long SHOW_ALL = 0xFFFFFFFF;
  const unsigned long SHOW_ELEMENT = 0x1;
  const unsigned long SHOW_ATTRIBUTE = 0x2; // historical
  const unsigned long SHOW_TEXT = 0x4;
  const unsigned long SHOW_CDATA_SECTION = 0x8; // historical
  const unsigned long SHOW_ENTITY_REFERENCE = 0x10; // historical
  const unsigned long SHOW_ENTITY = 0x20; // historical
  const unsigned long SHOW_PROCESSING_INSTRUCTION = 0x40;
  const unsigned long SHOW_COMMENT = 0x80;
  const unsigned long SHOW_DOCUMENT = 0x100;
  const unsigned long SHOW_DOCUMENT_TYPE = 0x200;
  const unsigned long SHOW_DOCUMENT_FRAGMENT = 0x400;
  const unsigned long SHOW_NOTATION = 0x800; // historical

  unsigned short acceptNode(Node node);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * https://dom.spec.whatwg.org/#nodeiterator
 */
// Import from http://hg.mozilla.org/mozilla-central/raw-file/a5a720259d79/dom/webidl/NodeIterator.webidl

[Exposed=Window]
interface NodeIterator {
  [SameObject]
  readonly attribute Node root;
  [Pure]
  readonly attribute Node referenceNode;
  [Pure]
  readonly attribute boolean pointerBeforeReferenceNode;
  [Constant]
  readonly attribute unsigned long whatToShow;
  [Constant]
  readonly attribute NodeFilter? filter;

  [Throws]
  Node? nextNode();
  [Throws]
  Node? previousNode();

  [Pure]
  undefined detach();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://dom.spec.whatwg.org/#interface-nodelist
 */

[Exposed=Window]
interface NodeList {
  [Pure]
  getter Node? item(unsigned long index);
  [Pure]
  readonly attribute unsigned long length;
  iterable<Node?>;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://dom.spec.whatwg.org/#nonelementparentnode
interface mixin NonElementParentNode {
  [Pure]
  Element? getElementById(DOMString elementId);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/OES_element_index_uint/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface OESElementIndexUint {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/OES_standard_derivatives/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface OESStandardDerivatives {
    const GLenum FRAGMENT_SHADER_DERIVATIVE_HINT_OES = 0x8B8B;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/OES_texture_float/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface OESTextureFloat {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/OES_texture_float_linear/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface OESTextureFloatLinear {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/OES_texture_half_float/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface OESTextureHalfFloat {
    const GLenum HALF_FLOAT_OES = 0x8D61;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/OES_texture_half_float_linear/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface OESTextureHalfFloatLinear {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/OES_vertex_array_object/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface OESVertexArrayObject {
    const unsigned long VERTEX_ARRAY_BINDING_OES = 0x85B5;

    WebGLVertexArrayObjectOES? createVertexArrayOES();
    undefined deleteVertexArrayOES(WebGLVertexArrayObjectOES? arrayObject);
    boolean isVertexArrayOES(WebGLVertexArrayObjectOES? arrayObject);
    undefined bindVertexArrayOES(WebGLVertexArrayObjectOES? arrayObject);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * For more information on this interface please see
 * https://webaudio.github.io/web-audio-api/#offlineaudiocompletionevent
 */

dictionary OfflineAudioCompletionEventInit : EventInit {
  required AudioBuffer renderedBuffer;
};

[Exposed=Window]
interface OfflineAudioCompletionEvent : Event {
  [Throws] constructor(DOMString type, OfflineAudioCompletionEventInit eventInitDict);
  readonly attribute AudioBuffer renderedBuffer;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#OfflineAudioContext
 */

dictionary OfflineAudioContextOptions {
  unsigned long numberOfChannels = 1;
  required unsigned long length;
  required float sampleRate;
};

[Exposed=Window]
interface OfflineAudioContext : BaseAudioContext {
  [Throws] constructor(OfflineAudioContextOptions contextOptions);
  [Throws] constructor(unsigned long numberOfChannels, unsigned long length, float sampleRate);
  readonly attribute unsigned long length;
  attribute EventHandler oncomplete;

  Promise<AudioBuffer> startRendering();
//  Promise<void> suspend(double suspendTime);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-offscreencanvas-interface
typedef (OffscreenCanvasRenderingContext2D or WebGLRenderingContext or WebGL2RenderingContext)
OffscreenRenderingContext;

dictionary ImageEncodeOptions {
  DOMString type = "image/png";
  unrestricted double quality = 1.0;
};

//enum OffscreenRenderingContextId { "2d", "webgl", "webgl2" };

[Exposed=(Window,Worker)/*, Transferable*/, Pref="dom.offscreen_canvas.enabled"]
interface OffscreenCanvas : EventTarget {
  [Throws] constructor([EnforceRange] unsigned long long width, [EnforceRange] unsigned long long height);
  attribute /*[EnforceRange]*/ unsigned long long width;
  attribute /*[EnforceRange]*/ unsigned long long height;

  OffscreenRenderingContext? getContext(DOMString contextId, optional any options = null);
  //ImageBitmap transferToImageBitmap();
  //Promise<Blob> convertToBlob(optional ImageEncodeOptions options);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-offscreen-2d-rendering-context
[Exposed=(Window,Worker), Pref="dom.offscreen_canvas.enabled"]
interface OffscreenCanvasRenderingContext2D {
  //void commit();
  readonly attribute OffscreenCanvas canvas;
};
OffscreenCanvasRenderingContext2D includes CanvasState;
OffscreenCanvasRenderingContext2D includes CanvasCompositing;
OffscreenCanvasRenderingContext2D includes CanvasImageSmoothing;
OffscreenCanvasRenderingContext2D includes CanvasFillStrokeStyles;
OffscreenCanvasRenderingContext2D includes CanvasShadowStyles;
OffscreenCanvasRenderingContext2D includes CanvasFilters;
OffscreenCanvasRenderingContext2D includes CanvasRect;

OffscreenCanvasRenderingContext2D includes CanvasTransform;
OffscreenCanvasRenderingContext2D includes CanvasDrawPath;
OffscreenCanvasRenderingContext2D includes CanvasText;
OffscreenCanvasRenderingContext2D includes CanvasDrawImage;
OffscreenCanvasRenderingContext2D includes CanvasImageData;
OffscreenCanvasRenderingContext2D includes CanvasPathDrawingStyles;
OffscreenCanvasRenderingContext2D includes CanvasTextDrawingStyles;
OffscreenCanvasRenderingContext2D includes CanvasPath;




/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#oscillatornode
 */

enum OscillatorType {
  "sine",
  "square",
  "sawtooth",
  "triangle",
  "custom"
};

dictionary OscillatorOptions : AudioNodeOptions {
  OscillatorType type = "sine";
  float frequency = 440;
  float detune = 0;
  // PeriodicWave periodicWave;
};

[Exposed=Window]
interface OscillatorNode : AudioScheduledSourceNode {
  [Throws] constructor(BaseAudioContext context, optional OscillatorOptions options = {});
  [SetterThrows]
  attribute OscillatorType type;

  readonly attribute AudioParam frequency;
  readonly attribute AudioParam detune;

//  void setPeriodicWave (PeriodicWave periodicWave);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-pagetransitionevent-interface
[Exposed=Window]
interface PageTransitionEvent : Event {
  [Throws] constructor(DOMString type, optional PageTransitionEventInit eventInitDict = {});
  readonly attribute boolean persisted;
};

dictionary PageTransitionEventInit : EventInit {
  boolean persisted = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.css-houdini.org/css-paint-api/#paintrenderingcontext2d
[Pref="dom.worklet.enabled", Exposed=PaintWorklet]
interface PaintRenderingContext2D {
};
PaintRenderingContext2D includes CanvasState;
PaintRenderingContext2D includes CanvasTransform;
PaintRenderingContext2D includes CanvasCompositing;
PaintRenderingContext2D includes CanvasImageSmoothing;
PaintRenderingContext2D includes CanvasFillStrokeStyles;
PaintRenderingContext2D includes CanvasShadowStyles;
PaintRenderingContext2D includes CanvasRect;
PaintRenderingContext2D includes CanvasDrawPath;
PaintRenderingContext2D includes CanvasDrawImage;
PaintRenderingContext2D includes CanvasPathDrawingStyles;
PaintRenderingContext2D includes CanvasPath;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.css-houdini.org/css-paint-api/#paintsize
[Pref="dom.worklet.enabled", Exposed=PaintWorklet]
interface PaintSize {
    readonly attribute double width;
    readonly attribute double height;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.css-houdini.org/css-paint-api/#paintworkletglobalscope
[Global=(Worklet,PaintWorklet), Pref="dom.worklet.enabled", Exposed=PaintWorklet]
interface PaintWorkletGlobalScope : WorkletGlobalScope {
    [Throws] undefined registerPaint(DOMString name, VoidFunction paintCtor);
    // This function is to be used only for testing, and should not be
    // accessible outside of that use.
    [Pref="dom.worklet.blockingsleep.enabled"]
    undefined sleep(unsigned long long ms);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#pannernode
 */

dictionary PannerOptions : AudioNodeOptions {
  PanningModelType panningModel = "equalpower";
  DistanceModelType distanceModel = "inverse";
  float positionX = 0;
  float positionY = 0;
  float positionZ = 0;
  float orientationX = 1;
  float orientationY = 0;
  float orientationZ = 0;
  double refDistance = 1;
  double maxDistance = 10000;
  double rolloffFactor = 1;
  double coneInnerAngle = 360;
  double coneOuterAngle = 360;
  double coneOuterGain = 0;
};

enum DistanceModelType {
  "linear",
  "inverse",
  "exponential"
};

enum PanningModelType {
    "equalpower",
    "HRTF"
};

[Exposed=Window]
interface PannerNode : AudioNode {
  [Throws] constructor(BaseAudioContext context, optional PannerOptions options = {});
  attribute PanningModelType panningModel;
  readonly attribute AudioParam positionX;
  readonly attribute AudioParam positionY;
  readonly attribute AudioParam positionZ;
  readonly attribute AudioParam orientationX;
  readonly attribute AudioParam orientationY;
  readonly attribute AudioParam orientationZ;
  attribute DistanceModelType distanceModel;
  [SetterThrows] attribute double refDistance;
  [SetterThrows] attribute double maxDistance;
  [SetterThrows] attribute double rolloffFactor;
  attribute double coneInnerAngle;
  attribute double coneOuterAngle;
  [SetterThrows] attribute double coneOuterGain;
  undefined setPosition (float x, float y, float z);
  undefined setOrientation (float x, float y, float z);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-parentnode
 */

interface mixin ParentNode {
  [SameObject]
  readonly attribute HTMLCollection children;
  [Pure]
  readonly attribute Element? firstElementChild;
  [Pure]
  readonly attribute Element? lastElementChild;
  [Pure]
  readonly attribute unsigned long childElementCount;

  [CEReactions, Throws, Unscopable]
  undefined prepend((Node or DOMString)... nodes);
  [CEReactions, Throws, Unscopable]
  undefined append((Node or DOMString)... nodes);
  [CEReactions, Throws, Unscopable]
  undefined replaceChildren((Node or DOMString)... nodes);

  [Pure, Throws]
  Element? querySelector(DOMString selectors);
  [NewObject, Throws]
  NodeList querySelectorAll(DOMString selectors);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/hr-time/#sec-performance
 */

typedef double DOMHighResTimeStamp;
typedef sequence<PerformanceEntry> PerformanceEntryList;

[Exposed=(Window, Worker)]
interface Performance : EventTarget {
  DOMHighResTimeStamp now();
  readonly attribute DOMHighResTimeStamp timeOrigin;
  [Default] object toJSON();
};

// https://w3c.github.io/performance-timeline/#extensions-to-the-performance-interface
[Exposed=(Window, Worker)]
partial interface Performance {
  PerformanceEntryList getEntries();
  PerformanceEntryList getEntriesByType(DOMString type);
  PerformanceEntryList getEntriesByName(DOMString name,
                                        optional DOMString type);
};

// https://w3c.github.io/user-timing/#extensions-performance-interface
[Exposed=(Window,Worker)]
partial interface Performance {
  [Throws]
  undefined mark(DOMString markName);
  undefined clearMarks(optional DOMString markName);
  [Throws]
  undefined measure(DOMString measureName, optional DOMString startMark, optional DOMString endMark);
  undefined clearMeasures(optional DOMString measureName);
};

//https://w3c.github.io/resource-timing/#sec-extensions-performance-interface
partial interface Performance {
  undefined clearResourceTimings ();
  undefined setResourceTimingBufferSize (unsigned long maxSize);
              attribute EventHandler onresourcetimingbufferfull;
};

// https://w3c.github.io/navigation-timing/#extensions-to-the-performance-interface
[Exposed=Window]
partial interface Performance {
  [SameObject]
  readonly attribute PerformanceNavigationTiming timing;
  [SameObject]
  readonly attribute PerformanceNavigation navigation;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * https://w3c.github.io/performance-timeline/#the-performanceentry-interface
 */

[Exposed=(Window,Worker)]
interface PerformanceEntry {
  readonly attribute DOMString           name;
  readonly attribute DOMString           entryType;
  readonly attribute DOMHighResTimeStamp startTime;
  readonly attribute DOMHighResTimeStamp duration;
  [Default] object toJSON();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * https://w3c.github.io/user-timing/#performancemark
 */

[Exposed=(Window,Worker)]
interface PerformanceMark : PerformanceEntry {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * https://w3c.github.io/user-timing/#performancemeasure
 */

[Exposed=(Window,Worker)]
interface PerformanceMeasure : PerformanceEntry {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/navigation-timing/#the-performancenavigation-interface
 */

[Exposed=Window]
interface PerformanceNavigation {
  const unsigned short TYPE_NAVIGATE = 0;
  const unsigned short TYPE_RELOAD = 1;
  const unsigned short TYPE_BACK_FORWARD = 2;
  const unsigned short TYPE_RESERVED = 255;
  readonly attribute unsigned short type;
  readonly attribute unsigned short redirectCount;
  [Default] object toJSON();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/navigation-timing/#dom-performancenavigationtiming
 */

enum NavigationType {
    "navigate",
    "reload",
    "back_forward",
    "prerender"
};

[Exposed=Window]
interface PerformanceNavigationTiming : PerformanceResourceTiming {
    readonly attribute DOMHighResTimeStamp unloadEventStart;
    readonly attribute DOMHighResTimeStamp unloadEventEnd;
    readonly attribute DOMHighResTimeStamp domInteractive;
    readonly attribute DOMHighResTimeStamp domContentLoadedEventStart;
    readonly attribute DOMHighResTimeStamp domContentLoadedEventEnd;
    readonly attribute DOMHighResTimeStamp domComplete;
    readonly attribute DOMHighResTimeStamp loadEventStart;
    readonly attribute DOMHighResTimeStamp loadEventEnd;
    readonly attribute NavigationType      type;
    readonly attribute unsigned short      redirectCount;
    [Default] object toJSON();
    /* Servo-only attribute for measuring when the top-level document (not iframes) is complete. */
    [Pref="dom.testperf.enabled"]
    readonly attribute DOMHighResTimeStamp topLevelDomComplete;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * https://w3c.github.io/performance-timeline/#the-performanceobserver-interface
 */

dictionary PerformanceObserverInit {
  sequence<DOMString> entryTypes;
  DOMString type;
  boolean buffered;
};

callback PerformanceObserverCallback = undefined (PerformanceObserverEntryList entries, PerformanceObserver observer);

[Exposed=(Window,Worker)]
interface PerformanceObserver {
  [Throws] constructor(PerformanceObserverCallback callback);
  [Throws]
  undefined observe(optional PerformanceObserverInit options = {});
  undefined disconnect();
  PerformanceEntryList takeRecords();
  // codegen doesn't like SameObject+static and doesn't know FrozenArray
  /*[SameObject]*/ static readonly attribute /*FrozenArray<DOMString>*/ any supportedEntryTypes;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * https://w3c.github.io/performance-timeline/#performanceobserverentrylist-interface
 */

[Exposed=(Window,Worker)]
interface PerformanceObserverEntryList {
  PerformanceEntryList getEntries();
  PerformanceEntryList getEntriesByType(DOMString entryType);
  PerformanceEntryList getEntriesByName(DOMString name,
                                        optional DOMString entryType);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * https://wicg.github.io/paint-timing/#sec-PerformancePaintTiming
 */

[Exposed=(Window,Worker)]
interface PerformancePaintTiming : PerformanceEntry {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/resource-timing/
 */

// https://w3c.github.io/resource-timing/#sec-performanceresourcetiming
[Exposed=(Window,Worker)]
interface PerformanceResourceTiming : PerformanceEntry {
    readonly attribute DOMString           initiatorType;
    readonly attribute DOMString           nextHopProtocol;
    // readonly attribute DOMHighResTimeStamp workerStart;
    readonly attribute DOMHighResTimeStamp redirectStart;
    readonly attribute DOMHighResTimeStamp redirectEnd;
    readonly attribute DOMHighResTimeStamp fetchStart;
    readonly attribute DOMHighResTimeStamp domainLookupStart;
    readonly attribute DOMHighResTimeStamp domainLookupEnd;
    readonly attribute DOMHighResTimeStamp connectStart;
    readonly attribute DOMHighResTimeStamp connectEnd;
    readonly attribute DOMHighResTimeStamp secureConnectionStart;
    readonly attribute DOMHighResTimeStamp requestStart;
    readonly attribute DOMHighResTimeStamp responseStart;
    readonly attribute DOMHighResTimeStamp responseEnd;
    readonly attribute unsigned long long  transferSize;
    readonly attribute unsigned long long  encodedBodySize;
    readonly attribute unsigned long long  decodedBodySize;
    [Default] object toJSON();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

 // https://w3c.github.io/permissions/#permissionstatus

dictionary PermissionDescriptor {
  required PermissionName name;
};

enum PermissionState {
  "granted",
  "denied",
  "prompt",
};

enum PermissionName {
  "geolocation",
  "notifications",
  "push",
  "midi",
  "camera",
  "microphone",
  "speaker",
  "device-info",
  "background-sync",
  "bluetooth",
  "persistent-storage",
};

[Pref="dom.permissions.enabled", Exposed=(Window,Worker)]
interface PermissionStatus : EventTarget {
  readonly attribute PermissionState state;
  attribute EventHandler onchange;
};

dictionary PushPermissionDescriptor : PermissionDescriptor {
  boolean userVisibleOnly = false;
};

dictionary MidiPermissionDescriptor : PermissionDescriptor {
  boolean sysex = false;
};

dictionary DevicePermissionDescriptor : PermissionDescriptor {
  DOMString deviceId;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/permissions/#permissions-interface

[Pref="dom.permissions.enabled", Exposed=(Window,Worker)]
interface Permissions {
  Promise<PermissionStatus> query(object permissionDesc);

  Promise<PermissionStatus> request(object permissionDesc);

  Promise<PermissionStatus> revoke(object permissionDesc);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#dom-plugin
[LegacyUnenumerableNamedProperties, Exposed=Window]
interface Plugin {
  readonly attribute DOMString name;
  readonly attribute DOMString description;
  readonly attribute DOMString filename;
  readonly attribute unsigned long length;
  getter MimeType? item(unsigned long index);
  getter MimeType? namedItem(DOMString name);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#pluginarray
[LegacyUnenumerableNamedProperties, Exposed=Window]
interface PluginArray {
  undefined refresh(optional boolean reload = false);
  readonly attribute unsigned long length;
  getter Plugin? item(unsigned long index);
  getter Plugin? namedItem(DOMString name);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-popstateevent-interface
[Exposed=Window]
interface PopStateEvent : Event {
  [Throws] constructor(DOMString type, optional PopStateEventInit eventInitDict = {});
  readonly attribute any state;
};

dictionary PopStateEventInit : EventInit {
  any state = null;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-processinginstruction
 */

[Exposed=Window]
interface ProcessingInstruction : CharacterData {
  [Constant]
  readonly attribute DOMString target;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://xhr.spec.whatwg.org/#interface-progressevent
 *
 * To the extent possible under law, the editor has waived all copyright
 * and related or neighboring rights to this work. In addition, as of 1 May 2014,
 * the editor has made this specification available under the Open Web Foundation
 * Agreement Version 1.0, which is available at
 * http://www.openwebfoundation.org/legal/the-owf-1-0-agreements/owfa-1-0.
 */

[Exposed=(Window,Worker)]
interface ProgressEvent : Event {
  [Throws] constructor(DOMString type, optional ProgressEventInit eventInitDict = {});
  readonly attribute boolean lengthComputable;
  readonly attribute unsigned long long loaded;
  readonly attribute unsigned long long total;
};

dictionary ProgressEventInit : EventInit {
  boolean lengthComputable = false;
  unsigned long long loaded = 0;
  unsigned long long total = 0;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

callback PromiseJobCallback = undefined();

[TreatNonCallableAsNull]
callback AnyCallback = any (any value);

// NOTE(rizo): breaks codegen, is it needed?
// Need to escape "Promise" so it's treated as an identifier.
//[LegacyNoInterfaceObject, Exposed=(Window,Worker)]
//interface _Promise {
//};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

// Hack to allow us to have JS owning and properly tracing/CCing/etc a
// PromiseNativeHandler.
[LegacyNoInterfaceObject,
 Exposed=(Window,Worker)]
interface PromiseNativeHandler {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-promiserejectionevent-interface

[Exposed=(Window,Worker)]
interface PromiseRejectionEvent : Event {
  [Throws] constructor(DOMString type, PromiseRejectionEventInit eventInitDict);
  readonly attribute Promise<any> promise;
  readonly attribute any reason;
};

dictionary PromiseRejectionEventInit : EventInit {
  required Promise<any> promise;
  any reason;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#dom-rtcdatachannel

[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCDataChannel : EventTarget {
  readonly attribute USVString label;
  readonly attribute boolean ordered;
  readonly attribute unsigned short? maxPacketLifeTime;
  readonly attribute unsigned short? maxRetransmits;
  readonly attribute USVString protocol;
  readonly attribute boolean negotiated;
  readonly attribute unsigned short? id;
  readonly attribute RTCDataChannelState readyState;
  //readonly attribute unsigned long bufferedAmount;
  //attribute unsigned long bufferedAmountLowThreshold;
  attribute EventHandler onopen;
  attribute EventHandler onbufferedamountlow;
  attribute EventHandler onerror;
  attribute EventHandler onclosing;
  attribute EventHandler onclose;
  undefined close();
  attribute EventHandler onmessage;
  [SetterThrows] attribute DOMString binaryType;
  [Throws] undefined send(USVString data);
  [Throws] undefined send(Blob data);
  [Throws] undefined send(ArrayBuffer data);
  [Throws] undefined send(ArrayBufferView data);
};

// https://www.w3.org/TR/webrtc/#dom-rtcdatachannelinit
dictionary RTCDataChannelInit {
  boolean ordered = true;
  unsigned short maxPacketLifeTime;
  unsigned short maxRetransmits;
  USVString protocol = "";
  boolean negotiated = false;
  unsigned short id;
};

// https://www.w3.org/TR/webrtc/#dom-rtcdatachannelstate
enum RTCDataChannelState {
  "connecting",
  "open",
  "closing",
  "closed"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#dom-rtcdatachannelevent

[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCDataChannelEvent : Event {
  constructor(DOMString type, RTCDataChannelEventInit eventInitDict);
  readonly attribute RTCDataChannel channel;
};

dictionary RTCDataChannelEventInit : EventInit {
  required RTCDataChannel channel;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#dom-rtcerror

[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCError : DOMException {
  constructor(RTCErrorInit init, optional DOMString message = "");
  readonly attribute RTCErrorDetailType errorDetail;
  readonly attribute long? sdpLineNumber;
  readonly attribute long? httpRequestStatusCode;
  readonly attribute long? sctpCauseCode;
  readonly attribute unsigned long? receivedAlert;
  readonly attribute unsigned long? sentAlert;
};

dictionary RTCErrorInit {
  required RTCErrorDetailType errorDetail;
  long sdpLineNumber;
  long httpRequestStatusCode;
  long sctpCauseCode;
  unsigned long receivedAlert;
  unsigned long sentAlert;
};

enum RTCErrorDetailType {
  "data-channel-failure",
  "dtls-failure",
  "fingerprint-failure",
  "sctp-failure",
  "sdp-syntax-error",
  "hardware-encoder-not-available",
  "hardware-encoder-error"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#dom-rtcerrorevent

[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCErrorEvent : Event {
  constructor(DOMString type, RTCErrorEventInit eventInitDict);
  [SameObject] readonly attribute RTCError error;
};

dictionary RTCErrorEventInit : EventInit {
  required RTCError error;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#rtcicecandidate-interface


[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCIceCandidate {
    [Throws] constructor(optional RTCIceCandidateInit candidateInitDict = {});
    readonly attribute DOMString               candidate;
    readonly attribute DOMString?              sdpMid;
    readonly attribute unsigned short?         sdpMLineIndex;
    // readonly attribute DOMString?              foundation;
    // readonly attribute RTCIceComponent?        component;
    // readonly attribute unsigned long?          priority;
    // readonly attribute DOMString?              address;
    // readonly attribute RTCIceProtocol?         protocol;
    // readonly attribute unsigned short?         port;
    // readonly attribute RTCIceCandidateType?    type;
    // readonly attribute RTCIceTcpCandidateType? tcpType;
    // readonly attribute DOMString?              relatedAddress;
    // readonly attribute unsigned short?         relatedPort;
    readonly attribute DOMString?              usernameFragment;
    RTCIceCandidateInit toJSON();
};

dictionary RTCIceCandidateInit {
    DOMString       candidate = "";
    DOMString?      sdpMid = null;
    unsigned short? sdpMLineIndex = null;
    DOMString       usernameFragment;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#interface-definition

[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCPeerConnection : EventTarget {
    [Throws] constructor(optional RTCConfiguration configuration = {});
    Promise<RTCSessionDescriptionInit> createOffer(optional RTCOfferOptions options = {});
    Promise<RTCSessionDescriptionInit> createAnswer(optional RTCAnswerOptions options = {});
    Promise<undefined>                      setLocalDescription(RTCSessionDescriptionInit description);
    readonly attribute RTCSessionDescription? localDescription;
    // readonly attribute RTCSessionDescription? currentLocalDescription;
    // readonly attribute RTCSessionDescription? pendingLocalDescription;
    Promise<undefined>                      setRemoteDescription(RTCSessionDescriptionInit description);
    readonly attribute RTCSessionDescription? remoteDescription;
    // readonly attribute RTCSessionDescription? currentRemoteDescription;
    // readonly attribute RTCSessionDescription? pendingRemoteDescription;
    Promise<undefined>                      addIceCandidate(optional RTCIceCandidateInit candidate = {});
    readonly attribute RTCSignalingState      signalingState;
    readonly attribute RTCIceGatheringState   iceGatheringState;
    readonly attribute RTCIceConnectionState  iceConnectionState;
    // readonly attribute RTCPeerConnectionState connectionState;
    // readonly attribute boolean?               canTrickleIceCandidates;
    // static sequence<RTCIceServer>      getDefaultIceServers();
    // RTCConfiguration                   getConfiguration();
    // void                               setConfiguration(RTCConfiguration configuration);
    undefined                               close();
             attribute EventHandler           onnegotiationneeded;
             attribute EventHandler           onicecandidate;
    //          attribute EventHandler           onicecandidateerror;
             attribute EventHandler           onsignalingstatechange;
             attribute EventHandler           oniceconnectionstatechange;
             attribute EventHandler           onicegatheringstatechange;
    //          attribute EventHandler           onconnectionstatechange;

    // removed from spec, but still shipped by browsers
    undefined addStream (MediaStream stream);
};

dictionary RTCConfiguration {
    sequence<RTCIceServer>   iceServers;
    RTCIceTransportPolicy    iceTransportPolicy = "all";
    RTCBundlePolicy          bundlePolicy = "balanced";
    RTCRtcpMuxPolicy         rtcpMuxPolicy = "require";
    DOMString                peerIdentity;
    // sequence<RTCCertificate> certificates;
    [EnforceRange]
    octet                    iceCandidatePoolSize = 0;
};

enum RTCIceTransportPolicy {
    "relay",
    "all"
};

enum RTCBundlePolicy {
    "balanced",
    "max-compat",
    "max-bundle"
};

enum RTCRtcpMuxPolicy {
    // At risk due to lack of implementers' interest.
    "negotiate",
    "require"
};

dictionary RTCIceServer {
    required (DOMString or sequence<DOMString>) urls;
             DOMString                          username;
             DOMString /*(DOMString or RTCOAuthCredential)*/  credential;
             RTCIceCredentialType               credentialType = "password";
};

enum RTCIceCredentialType {
    "password",
    "oauth"
};

dictionary RTCOfferAnswerOptions {
    boolean voiceActivityDetection = true;
};

dictionary RTCOfferOptions : RTCOfferAnswerOptions {
    boolean iceRestart = false;
};

dictionary RTCAnswerOptions : RTCOfferAnswerOptions {
};

enum RTCIceGatheringState {
    "new",
    "gathering",
    "complete"
};

enum RTCIceConnectionState {
    "new",
    "checking",
    "connected",
    "completed",
    "disconnected",
    "failed",
    "closed"
};

enum RTCSignalingState {
    "stable",
    "have-local-offer",
    "have-remote-offer",
    "have-local-pranswer",
    "have-remote-pranswer",
    "closed"
};

dictionary RTCRtpCodingParameters {
  DOMString rid;
};

dictionary RTCRtpEncodingParameters : RTCRtpCodingParameters {
  boolean active = true;
  unsigned long maxBitrate;
  double scaleResolutionDownBy;
};

dictionary RTCRtpTransceiverInit {
  RTCRtpTransceiverDirection direction = "sendrecv";
  sequence<MediaStream> streams = [];
  sequence<RTCRtpEncodingParameters> sendEncodings = [];
};

partial interface RTCPeerConnection {
    // sequence<RTCRtpSender>      getSenders();
    // sequence<RTCRtpReceiver>    getReceivers();
    // sequence<RTCRtpTransceiver> getTransceivers();
    // RTCRtpSender                addTrack(MediaStreamTrack track,
    //                                      MediaStream... streams);
    // void                        removeTrack(RTCRtpSender sender);
    [Pref="dom.webrtc.transceiver.enabled"]
    RTCRtpTransceiver           addTransceiver((MediaStreamTrack or DOMString) trackOrKind,
                                               optional RTCRtpTransceiverInit init = {});
    attribute EventHandler ontrack;
};

// https://www.w3.org/TR/webrtc/#rtcpeerconnection-interface-extensions-0
partial interface RTCPeerConnection {
  // readonly attribute RTCSctpTransport? sctp;
  RTCDataChannel createDataChannel(USVString label,
                                   optional RTCDataChannelInit dataChannelDict = {});
  attribute EventHandler ondatachannel;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#rtcpeerconnectioniceevent

[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCPeerConnectionIceEvent : Event {
    [Throws] constructor(DOMString type, optional RTCPeerConnectionIceEventInit eventInitDict = {});
    readonly attribute RTCIceCandidate? candidate;
    readonly attribute DOMString?       url;
};

dictionary RTCPeerConnectionIceEventInit : EventInit {
    RTCIceCandidate? candidate;
    DOMString?       url;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#dom-rtcrtpsender

dictionary RTCRtpHeaderExtensionParameters {
  required DOMString uri;
  required unsigned short id;
  boolean encrypted = false;
};

dictionary RTCRtcpParameters {
  DOMString cname;
  boolean reducedSize;
};

dictionary RTCRtpCodecParameters {
  required octet payloadType;
  required DOMString mimeType;
  required unsigned long clockRate;
  unsigned short channels;
  DOMString sdpFmtpLine;
};

dictionary RTCRtpParameters {
  required sequence<RTCRtpHeaderExtensionParameters> headerExtensions;
  required RTCRtcpParameters rtcp;
  required sequence<RTCRtpCodecParameters> codecs;
};

// NOTE(rizo): dict inheritence isn't implemented yet
// dictionary RTCRtpSendParameters : RTCRtpParameters {
dictionary RTCRtpSendParameters {
  required DOMString transactionId;
  required sequence<RTCRtpEncodingParameters> encodings;
};

[Exposed=Window, Pref="dom.webrtc.transceiver.enabled"]
interface RTCRtpSender {
  //readonly attribute MediaStreamTrack? track;
  //readonly attribute RTCDtlsTransport? transport;
  //static RTCRtpCapabilities? getCapabilities(DOMString kind);
  Promise<undefined> setParameters(RTCRtpSendParameters parameters);
  RTCRtpSendParameters getParameters();
  //Promise<void> replaceTrack(MediaStreamTrack? withTrack);
  //void setStreams(MediaStream... streams);
  //Promise<RTCStatsReport> getStats();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#rtcrtptransceiver-interface

[Exposed=Window, Pref="dom.webrtc.transceiver.enabled"]
interface RTCRtpTransceiver {
  //readonly attribute DOMString? mid;
  [SameObject] readonly attribute RTCRtpSender sender;
  //[SameObject] readonly attribute RTCRtpReceiver receiver;
  attribute RTCRtpTransceiverDirection direction;
  //readonly attribute RTCRtpTransceiverDirection? currentDirection;
  //void stop();
  //void setCodecPreferences(sequence<RTCRtpCodecCapability> codecs);
};

enum RTCRtpTransceiverDirection {
  "sendrecv",
  "sendonly",
  "recvonly",
  "inactive",
  "stopped"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#rtcsessiondescription-class

[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCSessionDescription {
    [Throws] constructor(RTCSessionDescriptionInit descriptionInitDict);
    readonly attribute RTCSdpType type;
    readonly attribute DOMString  sdp;
    [Default] object toJSON();
};

dictionary RTCSessionDescriptionInit {
    required RTCSdpType type;
             DOMString  sdp = "";
};

enum RTCSdpType {
    "offer",
    "pranswer",
    "answer",
    "rollback"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webrtc-pc/#dom-rtctrackevent

[Exposed=Window, Pref="dom.webrtc.enabled"]
interface RTCTrackEvent : Event {
    [Throws] constructor(DOMString type, RTCTrackEventInit eventInitDict);
    // readonly attribute RTCRtpReceiver           receiver;
    readonly attribute MediaStreamTrack         track;
    // [SameObject]
    // readonly attribute FrozenArray<MediaStream> streams;
    // readonly attribute RTCRtpTransceiver        transceiver;
};

// https://www.w3.org/TR/webrtc/#dom-rtctrackeventinit
dictionary RTCTrackEventInit : EventInit {
    // required RTCRtpReceiver        receiver;
    required MediaStreamTrack      track;
             // sequence<MediaStream> streams = [];
    // required RTCRtpTransceiver     transceiver;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#radionodelist
[Exposed=Window]
interface RadioNodeList : NodeList {
  attribute DOMString value;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#range
 * https://w3c.github.io/DOM-Parsing/#dom-range-createcontextualfragment
 * http://dvcs.w3.org/hg/csswg/raw-file/tip/cssom-view/Overview.html#extensions-to-the-range-interface
 */

[Exposed=Window]
interface Range : AbstractRange {
  [Throws] constructor();
  [Pure]
  readonly attribute Node commonAncestorContainer;

  [Throws]
  undefined setStart(Node refNode, unsigned long offset);
  [Throws]
  undefined setEnd(Node refNode, unsigned long offset);
  [Throws]
  undefined setStartBefore(Node refNode);
  [Throws]
  undefined setStartAfter(Node refNode);
  [Throws]
  undefined setEndBefore(Node refNode);
  [Throws]
  undefined setEndAfter(Node refNode);
  undefined collapse(optional boolean toStart = false);
  [Throws]
  undefined selectNode(Node refNode);
  [Throws]
  undefined selectNodeContents(Node refNode);

  const unsigned short START_TO_START = 0;
  const unsigned short START_TO_END = 1;
  const unsigned short END_TO_END = 2;
  const unsigned short END_TO_START = 3;
  [Pure, Throws]
  short compareBoundaryPoints(unsigned short how, Range sourceRange);
  [CEReactions, Throws]
  undefined deleteContents();
  [CEReactions, NewObject, Throws]
  DocumentFragment extractContents();
  [CEReactions, NewObject, Throws]
  DocumentFragment cloneContents();
  [CEReactions, Throws]
  undefined insertNode(Node node);
  [CEReactions, Throws]
  undefined surroundContents(Node newParent);

  [NewObject]
  Range cloneRange();
  [Pure]
  undefined detach();

  [Pure, Throws]
  boolean isPointInRange(Node node, unsigned long offset);
  [Pure, Throws]
  short comparePoint(Node node, unsigned long offset);

  [Pure]
  boolean intersectsNode(Node node);

  stringifier;
};

// https://dvcs.w3.org/hg/innerhtml/raw-file/tip/index.html#extensions-to-the-range-interface
partial interface Range {
  [CEReactions, NewObject, Throws]
  DocumentFragment createContextualFragment(DOMString fragment);
};

// http://dev.w3.org/csswg/cssom-view/#extensions-to-the-range-interface
partial interface Range {
  // sequence<DOMRect> getClientRects();
  // [NewObject]
  // DOMRect getBoundingClientRect();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

// NOTE(rizo): breaks codegen, is this needed? kept without _; used
//[LegacyNoInterfaceObject, Exposed=(Window,Worker)]
// Need to escape "ReadableStream" so it's treated as an identifier.
//interface _ReadableStream {
interface ReadableStream {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://fetch.spec.whatwg.org/#request-class

typedef (Request or USVString) RequestInfo;

[Exposed=(Window,Worker)]
interface Request {
  [Throws] constructor(RequestInfo input, optional RequestInit init = {});
  readonly attribute ByteString method;
  readonly attribute USVString url;
  [SameObject] readonly attribute Headers headers;

  readonly attribute RequestDestination destination;
  readonly attribute USVString referrer;
  readonly attribute ReferrerPolicy referrerPolicy;
  readonly attribute RequestMode mode;
  readonly attribute RequestCredentials credentials;
  readonly attribute RequestCache cache;
  readonly attribute RequestRedirect redirect;
  readonly attribute DOMString integrity;

  [NewObject, Throws] Request clone();
};

Request includes Body;

dictionary RequestInit {
  ByteString method;
  HeadersInit headers;
  BodyInit? body;
  USVString referrer;
  ReferrerPolicy referrerPolicy;
  RequestMode mode;
  RequestCredentials credentials;
  RequestCache cache;
  RequestRedirect redirect;
  DOMString integrity;
  any window; // can only be set to null
};

enum RequestDestination {
  "",
  "audio",
  "document",
  "embed",
  "font",
  "image",
  "manifest",
  "object",
  "report",
  "script",
  "sharedworker",
  "style",
  "track",
  "video",
  "worker",
  "xslt"
};

enum RequestMode {
  "navigate",
  "same-origin",
  "no-cors",
  "cors"
};

enum RequestCredentials {
  "omit",
  "same-origin",
  "include"
};

enum RequestCache {
  "default",
  "no-store",
  "reload",
  "no-cache",
  "force-cache",
  "only-if-cached"
};

enum RequestRedirect {
  "follow",
  "error",
  "manual"
};

enum ReferrerPolicy {
  "",
  "no-referrer",
  "no-referrer-when-downgrade",
  "origin",
  "origin-when-cross-origin",
  "unsafe-url",
  "same-origin",
  "strict-origin",
  "strict-origin-when-cross-origin"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://fetch.spec.whatwg.org/#response-class

 [Exposed=(Window,Worker)]
interface Response {
  [Throws] constructor(optional BodyInit? body = null, optional ResponseInit init = {});
  [NewObject] static Response error();
  [NewObject, Throws] static Response redirect(USVString url, optional unsigned short status = 302);

  readonly attribute ResponseType type;

  readonly attribute USVString url;
  readonly attribute boolean redirected;
  readonly attribute unsigned short status;
  readonly attribute boolean ok;
  readonly attribute ByteString statusText;
  [SameObject] readonly attribute Headers headers;
  // readonly attribute ReadableStream? body;
  // [SameObject] readonly attribute Promise<Headers> trailer;

  [NewObject, Throws] Response clone();
};
Response includes Body;

dictionary ResponseInit {
  unsigned short status = 200;
  ByteString statusText = "";
  HeadersInit headers;
};

enum ResponseType { "basic", "cors", "default", "error", "opaque", "opaqueredirect" };

// typedef (BodyInit or ReadableStream) ResponseBodyInit;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://svgwg.org/svg2-draft/types.html#InterfaceSVGElement
[Exposed=Window, Pref="dom.svg.enabled"]
interface SVGElement : Element {

  //[SameObject] readonly attribute SVGAnimatedString className;

  //[SameObject] readonly attribute DOMStringMap dataset;

  //readonly attribute SVGSVGElement? ownerSVGElement;
  //readonly attribute SVGElement? viewportElement;

  //attribute long tabIndex;
  //void focus();
  //void blur();
};

//SVGElement includes GlobalEventHandlers;
//SVGElement includes SVGElementInstance;
SVGElement includes ElementCSSInlineStyle;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://svgwg.org/svg2-draft/types.html#InterfaceSVGGraphicsElement
//dictionary SVGBoundingBoxOptions {
//  boolean fill = true;
//  boolean stroke = false;
//  boolean markers = false;
//  boolean clipped = false;
//};

[Exposed=Window, Abstract, Pref="dom.svg.enabled"]
interface SVGGraphicsElement : SVGElement {
  //[SameObject] readonly attribute SVGAnimatedTransformList transform;

  //DOMRect getBBox(optional SVGBoundingBoxOptions options);
  //DOMMatrix? getCTM();
  //DOMMatrix? getScreenCTM();
};

//SVGGraphicsElement includes SVGTests;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://svgwg.org/svg2-draft/struct.html#InterfaceSVGSVGElement
[Exposed=Window, Pref="dom.svg.enabled"]
interface SVGSVGElement : SVGGraphicsElement {

  //[SameObject] readonly attribute SVGAnimatedLength x;
  //[SameObject] readonly attribute SVGAnimatedLength y;
  //[SameObject] readonly attribute SVGAnimatedLength width;
  //[SameObject] readonly attribute SVGAnimatedLength height;

  //attribute float currentScale;
  //[SameObject] readonly attribute DOMPointReadOnly currentTranslate;

  //NodeList getIntersectionList(DOMRectReadOnly rect, SVGElement? referenceElement);
  //NodeList getEnclosureList(DOMRectReadOnly rect, SVGElement? referenceElement);
  //boolean checkIntersection(SVGElement element, DOMRectReadOnly rect);
  //boolean checkEnclosure(SVGElement element, DOMRectReadOnly rect);

  //void deselectAll();

  //SVGNumber createSVGNumber();
  //SVGLength createSVGLength();
  //SVGAngle createSVGAngle();
  //DOMPoint createSVGPoint();
  //DOMMatrix createSVGMatrix();
  //DOMRect createSVGRect();
  //SVGTransform createSVGTransform();
  //SVGTransform createSVGTransformFromMatrix(DOMMatrixReadOnly matrix);

  //Element getElementById(DOMString elementId);

  // Deprecated methods that have no effect when called,
  // but which are kept for compatibility reasons.
  //unsigned long suspendRedraw(unsigned long maxWaitMilliseconds);
  //void unsuspendRedraw(unsigned long suspendHandleID);
  //void unsuspendRedrawAll();
  //void forceRedraw();
};

//SVGSVGElement includes SVGFitToViewBox;
//SVGSVGElement includes SVGZoomAndPan;
//SVGSVGElement includes WindowEventHandlers;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// http://dev.w3.org/csswg/cssom-view/#the-screen-interface
[Exposed=Window]
interface Screen {
  readonly attribute double availWidth;
  readonly attribute double availHeight;
  readonly attribute double width;
  readonly attribute double height;
  readonly attribute unsigned long colorDepth;
  readonly attribute unsigned long pixelDepth;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/selection-api/#selection-interface
[Exposed=Window]
interface Selection {
readonly attribute Node? anchorNode;
  readonly attribute unsigned long anchorOffset;
  readonly attribute Node? focusNode;
  readonly attribute unsigned long focusOffset;
  readonly attribute boolean isCollapsed;
  readonly attribute unsigned long rangeCount;
  readonly attribute DOMString type;
  [Throws] Range getRangeAt(unsigned long index);
  undefined addRange(Range range);
  [Throws] undefined removeRange(Range range);
  undefined removeAllRanges();
  undefined empty();
  [Throws] undefined collapse(Node? node, optional unsigned long offset = 0);
  [Throws] undefined setPosition(Node? node, optional unsigned long offset = 0);
  [Throws] undefined collapseToStart();
  [Throws] undefined collapseToEnd();
  [Throws] undefined extend(Node node, optional unsigned long offset = 0);
  [Throws]
  undefined setBaseAndExtent(Node anchorNode, unsigned long anchorOffset, Node focusNode, unsigned long focusOffset);
  [Throws] undefined selectAllChildren(Node node);
  [CEReactions, Throws]
  undefined deleteFromDocument();
  boolean containsNode(Node node, optional boolean allowPartialContainment = false);
  // NOTE(rizo): https://github.com/whatwg/webidl/pull/941
  // stringifier DOMString ();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/ServiceWorker/#serviceworker-interface
[Pref="dom.serviceworker.enabled", SecureContext, Exposed=(Window,Worker)]
interface ServiceWorker : EventTarget {
  readonly attribute USVString scriptURL;
  readonly attribute ServiceWorkerState state;
  [Throws] undefined postMessage(any message, sequence<object> transfer);
  [Throws] undefined postMessage(any message, optional PostMessageOptions options = {});

  // event
  attribute EventHandler onstatechange;
};

// FIXME: use `includes` instead of `implements` after #22539 is fixed.
ServiceWorker includes AbstractWorker;

enum ServiceWorkerState {
  "installing",
  "installed",
  "activating",
  "activated",
  "redundant"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/ServiceWorker/#serviceworkercontainer-interface
[Pref="dom.serviceworker.enabled", Exposed=(Window,Worker)]
interface ServiceWorkerContainer : EventTarget {
  readonly attribute ServiceWorker? controller;
  //readonly attribute Promise<ServiceWorkerRegistration> ready;

  [NewObject] Promise<ServiceWorkerRegistration> register(USVString scriptURL,
                                                          optional RegistrationOptions options = {});

  //[NewObject] Promise<any> getRegistration(optional USVString clientURL = "");
  //[NewObject] Promise<FrozenArray<ServiceWorkerRegistration>> getRegistrations();

  //void startMessages();

  // events
  //attribute EventHandler oncontrollerchange;
  //attribute EventHandler onerror;
  //attribute EventHandler onmessage; // event.source of message events is ServiceWorker object
  //attribute EventHandler onmessageerror;
};

dictionary RegistrationOptions {
  USVString scope;
  WorkerType type = "classic";
  ServiceWorkerUpdateViaCache updateViaCache = "imports";
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/ServiceWorker/#serviceworkerglobalscope

[Global=(Worker,ServiceWorker), Exposed=ServiceWorker,
 Pref="dom.serviceworker.enabled"]
interface ServiceWorkerGlobalScope : WorkerGlobalScope {
  // A container for a list of Client objects that correspond to
  // browsing contexts (or shared workers) that are on the origin of this SW
  //[SameObject] readonly attribute Clients clients;
  //[SameObject] readonly attribute ServiceWorkerRegistration registration;

  //[NewObject] Promise<void> skipWaiting();

  //attribute EventHandler oninstall;
  //attribute EventHandler onactivate;
  //attribute EventHandler onfetch;

  // event
  attribute EventHandler onmessage; // event.source of the message events is Client object
  attribute EventHandler onmessageerror;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/ServiceWorker/#serviceworkerregistration-interface
[Pref="dom.serviceworker.enabled", SecureContext, Exposed=(Window,Worker)]
interface ServiceWorkerRegistration : EventTarget {
  readonly attribute ServiceWorker? installing;
  readonly attribute ServiceWorker? waiting;
  readonly attribute ServiceWorker? active;
  [SameObject] readonly attribute NavigationPreloadManager navigationPreload;

  readonly attribute USVString scope;
  readonly attribute ServiceWorkerUpdateViaCache updateViaCache;

  // [NewObject] Promise<void> update();
  // [NewObject] Promise<boolean> unregister();

  // event
  // attribute EventHandler onupdatefound;
};

enum ServiceWorkerUpdateViaCache {
  "imports",
  "all",
  "none"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Exposed=(Window,Worker),
 LegacyNoInterfaceObject]
interface ServoParser {};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://dom.spec.whatwg.org/#interface-shadowroot
 */

[Exposed=Window]
interface ShadowRoot : DocumentFragment {
  readonly attribute ShadowRootMode mode;
  readonly attribute Element host;
};

enum ShadowRootMode { "open", "closed"};

ShadowRoot includes DocumentOrShadowRoot;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-staticrange
 */

dictionary StaticRangeInit {
  required Node startContainer;
  required unsigned long startOffset;
  required Node endContainer;
  required unsigned long endOffset;
};

[Exposed=Window]
interface StaticRange : AbstractRange {
  [Throws] constructor(StaticRangeInit init);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://webaudio.github.io/web-audio-api/#StereoPannerNode
 */

dictionary StereoPannerOptions: AudioNodeOptions {
  float pan = 0;
};

[Exposed=Window]
interface StereoPannerNode : AudioScheduledSourceNode {
  [Throws] constructor(BaseAudioContext context, optional StereoPannerOptions options = {});
  readonly attribute AudioParam pan;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://html.spec.whatwg.org/multipage/#the-storage-interface
 *
 */

[Exposed=Window]
interface Storage {

  readonly attribute unsigned long length;

  DOMString? key(unsigned long index);

  getter DOMString? getItem(DOMString name);

  [Throws]
  setter undefined setItem(DOMString name, DOMString value);

  deleter undefined removeItem(DOMString name);

  undefined clear();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * Interface for a client side storage. See
 * https://html.spec.whatwg.org/multipage/#the-storageevent-interface
 * for more information.
 *
 * Event sent to a window when a storage area changes.
 */

[Exposed=Window]
interface StorageEvent : Event {
  [Throws] constructor(DOMString type, optional StorageEventInit eventInitDict = {});
  readonly attribute DOMString? key;
  readonly attribute DOMString? oldValue;
  readonly attribute DOMString? newValue;
  readonly attribute DOMString url;
  readonly attribute Storage? storageArea;


  undefined initStorageEvent(DOMString type, optional boolean bubbles = false,
  optional boolean cancelable = false, optional DOMString? key = null, optional
  DOMString? oldValue = null, optional DOMString? newValue = null, optional
  USVString url = "", optional Storage? storageArea = null);
};

dictionary StorageEventInit : EventInit {
  DOMString? key = null;
  DOMString? oldValue = null;
  DOMString? newValue = null;
  DOMString url = "";
  Storage? storageArea = null;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.css-houdini.org/css-typed-om-1/#stylepropertymapreadonly
// NOTE: should this be exposed to Window?
[Pref="dom.worklet.enabled", Exposed=(Worklet)]
interface StylePropertyMapReadOnly {
    CSSStyleValue? get(DOMString property);
    // sequence<CSSStyleValue> getAll(DOMString property);
    boolean has(DOMString property);
    // iterable<DOMString, (CSSStyleValue or sequence<CSSStyleValue>)>;
    sequence<DOMString> getProperties();
    // https://github.com/w3c/css-houdini-drafts/issues/268
    // stringifier;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-stylesheet-interface
[Exposed=Window]
interface StyleSheet {
  readonly attribute DOMString type_;
  readonly attribute DOMString? href;

  readonly attribute Element? ownerNode;
  // readonly attribute StyleSheet? parentStyleSheet;
  readonly attribute DOMString? title;

  [SameObject, PutForwards=mediaText] readonly attribute MediaList media;
  attribute boolean disabled;
};

// https://drafts.csswg.org/cssom/#the-linkstyle-interface
interface mixin LinkStyle {
  readonly attribute StyleSheet? sheet;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.csswg.org/cssom/#the-stylesheetlist-interface
// [ArrayClass]
[Exposed=Window]
interface StyleSheetList {
  getter StyleSheet? item(unsigned long index);
  readonly attribute unsigned long length;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#submitevent
[Exposed=Window]
interface SubmitEvent : Event {
    constructor(DOMString typeArg, optional SubmitEventInit eventInitDict = {});

    readonly attribute HTMLElement? submitter;
};

dictionary SubmitEventInit : EventInit {
    HTMLElement? submitter = null;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

enum TestEnum { "", "foo", "bar" };
typedef (DOMString or URL or Blob) TestTypedef;
typedef (DOMString or URL or Blob)? TestTypedefNullableUnion;
typedef DOMString TestTypedefString;
typedef Blob TestTypedefInterface;

dictionary TestDictionary {
  required boolean requiredValue;
  boolean booleanValue;
  byte byteValue;
  octet octetValue;
  short shortValue;
  unsigned short unsignedShortValue;
  long longValue;
  unsigned long unsignedLongValue;
  long long longLongValue;
  unsigned long long unsignedLongLongValue;
  unrestricted float unrestrictedFloatValue;
  float floatValue;
  unrestricted double unrestrictedDoubleValue;
  double doubleValue;
  DOMString stringValue;
  USVString usvstringValue;
  TestEnum enumValue;
  Blob interfaceValue;
  any anyValue;
  object objectValue;
  TestDictionaryDefaults dict = {};
  sequence<TestDictionaryDefaults> seqDict;
  // Testing codegen to import Element correctly, ensure no other code references Element directly
  sequence<Element> elementSequence;
  // Reserved rust keyword
  DOMString type;
  // These are used to test bidirectional conversion
  // and differentiation of non-required and nullable types
  // in dictionaries.
  DOMString? nonRequiredNullable;
  DOMString? nonRequiredNullable2;
};

dictionary TestDictionaryParent {
  DOMString parentStringMember;
};

// NOTE(rizo): dict inheritence not implemented yet
// dictionary TestDictionaryWithParent : TestDictionaryParent {
dictionary TestDictionaryWithParent {
  DOMString stringMember;
};

dictionary TestDictionaryDefaults {
  boolean booleanValue = false;
  byte byteValue = 7;
  octet octetValue = 7;
  short shortValue = 7;
  unsigned short unsignedShortValue = 7;
  long longValue = 7;
  unsigned long unsignedLongValue = 7;
  long long longLongValue = 7;
  unsigned long long unsignedLongLongValue = 7;
  unrestricted float unrestrictedFloatValue = 7.0;
  float floatValue = 7.0;
  unrestricted double UnrestrictedDoubleValue = 7.0;
  double doubleValue = 7.0;
  ByteString bytestringValue = "foo";
  DOMString stringValue = "foo";
  USVString usvstringValue = "foo";
  TestEnum enumValue = "bar";
  any anyValue = null;
  sequence<object> arrayValue = [];

  boolean? nullableBooleanValue = false;
  byte? nullableByteValue = 7;
  octet? nullableOctetValue = 7;
  short? nullableShortValue = 7;
  unsigned short? nullableUnsignedShortValue = 7;
  long? nullableLongValue = 7;
  unsigned long? nullableUnsignedLongValue = 7;
  long long? nullableLongLongValue = 7;
  unsigned long long? nullableUnsignedLongLongValue = 7;
  unrestricted float? nullableUnrestrictedFloatValue = 7.0;
  float? nullableFloatValue = 7.0;
  unrestricted double? nullableUnrestrictedDoubleValue = 7.0;
  double? nullableDoubleValue = 7.0;
  ByteString? nullableBytestringValue = "foo";
  DOMString? nullableStringValue = "foo";
  USVString? nullableUsvstringValue = "foo";
  // TestEnum? nullableEnumValue = "bar";
  object? nullableObjectValue = null;
};

dictionary TestURLLike {
  required DOMString href;
};

[Pref="dom.testbinding.enabled",
 Exposed=(Window,Worker)
]
interface TestBinding {
           [Throws] constructor();
           [Throws] constructor(sequence<unrestricted double> numberSequence);
           [Throws] constructor(unrestricted double num);
           attribute boolean booleanAttribute;
           attribute byte byteAttribute;
           attribute octet octetAttribute;
           attribute short shortAttribute;
           attribute unsigned short unsignedShortAttribute;
           attribute long longAttribute;
           attribute unsigned long unsignedLongAttribute;
           attribute long long longLongAttribute;
           attribute unsigned long long unsignedLongLongAttribute;
           attribute unrestricted float unrestrictedFloatAttribute;
           attribute float floatAttribute;
           attribute unrestricted double unrestrictedDoubleAttribute;
           attribute double doubleAttribute;
           attribute DOMString stringAttribute;
           attribute USVString usvstringAttribute;
           attribute ByteString byteStringAttribute;
           attribute TestEnum enumAttribute;
           attribute Blob interfaceAttribute;
           attribute (HTMLElement or long) unionAttribute;
           attribute (Event or DOMString) union2Attribute;
           attribute (Event or USVString) union3Attribute;
           attribute (DOMString or unsigned long) union4Attribute;
           attribute (DOMString or boolean) union5Attribute;
           attribute (unsigned long or boolean) union6Attribute;
           attribute (Blob or boolean) union7Attribute;
           attribute (Blob or unsigned long) union8Attribute;
           attribute (ByteString or long) union9Attribute;
  readonly attribute Uint8ClampedArray arrayAttribute;
           attribute any anyAttribute;
           attribute object objectAttribute;

           attribute boolean? booleanAttributeNullable;
           attribute byte? byteAttributeNullable;
           attribute octet? octetAttributeNullable;
           attribute short? shortAttributeNullable;
           attribute unsigned short? unsignedShortAttributeNullable;
           attribute long? longAttributeNullable;
           attribute unsigned long? unsignedLongAttributeNullable;
           attribute long long? longLongAttributeNullable;
           attribute unsigned long long? unsignedLongLongAttributeNullable;
           attribute unrestricted float? unrestrictedFloatAttributeNullable;
           attribute float? floatAttributeNullable;
           attribute unrestricted double? unrestrictedDoubleAttributeNullable;
           attribute double? doubleAttributeNullable;
           attribute DOMString? stringAttributeNullable;
           attribute USVString? usvstringAttributeNullable;
           attribute ByteString? byteStringAttributeNullable;
  readonly attribute TestEnum? enumAttributeNullable;
           attribute Blob? interfaceAttributeNullable;
           attribute URL? interfaceAttributeWeak;
           attribute object? objectAttributeNullable;
           attribute (HTMLElement or long)? unionAttributeNullable;
           attribute (Event or DOMString)? union2AttributeNullable;
           attribute (Blob or boolean)? union3AttributeNullable;
           attribute (unsigned long or boolean)? union4AttributeNullable;
           attribute (DOMString or boolean)? union5AttributeNullable;
           attribute (ByteString or long)? union6AttributeNullable;
  [BinaryName="BinaryRenamedAttribute"] attribute DOMString attrToBinaryRename;
  [BinaryName="BinaryRenamedAttribute2"] attribute DOMString attr-to-binary-rename;
  attribute DOMString attr-to-automatically-rename;

  const long long constantInt64 = -1;
  const unsigned long long constantUint64 = 1;
  const float constantFloat32 = 1.0;
  const double constantFloat64 = 1.0;
  const unrestricted float constantUnrestrictedFloat32 = 1.0;
  const unrestricted double constantUnrestrictedFloat64 = 1.0;

  [PutForwards=booleanAttribute]
  readonly attribute TestBinding forwardedAttribute;

  [BinaryName="BinaryRenamedMethod"] undefined methToBinaryRename();
  undefined receiveVoid();
  boolean receiveBoolean();
  byte receiveByte();
  octet receiveOctet();
  short receiveShort();
  unsigned short receiveUnsignedShort();
  long receiveLong();
  unsigned long receiveUnsignedLong();
  long long receiveLongLong();
  unsigned long long receiveUnsignedLongLong();
  unrestricted float receiveUnrestrictedFloat();
  float receiveFloat();
  unrestricted double receiveUnrestrictedDouble();
  double receiveDouble();
  DOMString receiveString();
  USVString receiveUsvstring();
  ByteString receiveByteString();
  TestEnum receiveEnum();
  Blob receiveInterface();
  any receiveAny();
  object receiveObject();
  (HTMLElement or long) receiveUnion();
  (Event or DOMString) receiveUnion2();
  (DOMString or sequence<long>) receiveUnion3();
  (DOMString or sequence<DOMString>) receiveUnion4();
  (Blob or sequence<Blob>) receiveUnion5();
  (DOMString or unsigned long) receiveUnion6();
  (DOMString or boolean) receiveUnion7();
  (unsigned long or boolean) receiveUnion8();
  (HTMLElement or unsigned long or DOMString or boolean) receiveUnion9();
  (ByteString or long) receiveUnion10();
  (sequence<ByteString> or long or DOMString) receiveUnion11();
  sequence<long> receiveSequence();
  sequence<Blob> receiveInterfaceSequence();

  byte? receiveNullableByte();
  boolean? receiveNullableBoolean();
  octet? receiveNullableOctet();
  short? receiveNullableShort();
  unsigned short? receiveNullableUnsignedShort();
  long? receiveNullableLong();
  unsigned long? receiveNullableUnsignedLong();
  long long? receiveNullableLongLong();
  unsigned long long? receiveNullableUnsignedLongLong();
  unrestricted float? receiveNullableUnrestrictedFloat();
  float? receiveNullableFloat();
  unrestricted double? receiveNullableUnrestrictedDouble();
  double? receiveNullableDouble();
  DOMString? receiveNullableString();
  USVString? receiveNullableUsvstring();
  ByteString? receiveNullableByteString();
  TestEnum? receiveNullableEnum();
  Blob? receiveNullableInterface();
  object? receiveNullableObject();
  (HTMLElement or long)? receiveNullableUnion();
  (Event or DOMString)? receiveNullableUnion2();
  (DOMString or sequence<long>)? receiveNullableUnion3();
  (sequence<long> or boolean)? receiveNullableUnion4();
  (unsigned long or boolean)? receiveNullableUnion5();
  (ByteString or long)? receiveNullableUnion6();
  sequence<long>? receiveNullableSequence();
  TestDictionary receiveTestDictionaryWithSuccessOnKeyword();
  boolean dictMatchesPassedValues(TestDictionary arg);

  (DOMString or object) receiveUnionIdentity((DOMString or object) arg);

  undefined passBoolean(boolean arg);
  undefined passByte(byte arg);
  undefined passOctet(octet arg);
  undefined passShort(short arg);
  undefined passUnsignedShort(unsigned short arg);
  undefined passLong(long arg);
  undefined passUnsignedLong(unsigned long arg);
  undefined passLongLong(long long arg);
  undefined passUnsignedLongLong(unsigned long long arg);
  undefined passUnrestrictedFloat(unrestricted float arg);
  undefined passFloat(float arg);
  undefined passUnrestrictedDouble(unrestricted double arg);
  undefined passDouble(double arg);
  undefined passString(DOMString arg);
  undefined passUsvstring(USVString arg);
  undefined passByteString(ByteString arg);
  undefined passEnum(TestEnum arg);
  undefined passInterface(Blob arg);
  undefined passTypedArray(Int8Array arg);
  undefined passTypedArray2(ArrayBuffer arg);
  undefined passTypedArray3(ArrayBufferView arg);
  undefined passUnion((HTMLElement or long) arg);
  undefined passUnion2((Event or DOMString) data);
  undefined passUnion3((Blob or DOMString) data);
  undefined passUnion4((DOMString or sequence<DOMString>) seq);
  undefined passUnion5((DOMString or boolean) data);
  undefined passUnion6((unsigned long or boolean) bool);
  undefined passUnion7((sequence<DOMString> or unsigned long) arg);
  undefined passUnion8((sequence<ByteString> or long) arg);
  undefined passUnion9((TestDictionary or long) arg);
  undefined passUnion10((DOMString or object) arg);
  undefined passUnion11((ArrayBuffer or ArrayBufferView) arg);
  undefined passUnionWithTypedef((Document or TestTypedef) arg);
  undefined passUnionWithTypedef2((sequence<long> or TestTypedef) arg);
  undefined passAny(any arg);
  undefined passObject(object arg);
  undefined passCallbackFunction(Function fun);
  undefined passCallbackInterface(EventListener listener);
  undefined passSequence(sequence<long> seq);
  undefined passAnySequence(sequence<any> seq);
  sequence<any> anySequencePassthrough(sequence<any> seq);
  undefined passObjectSequence(sequence<object> seq);
  undefined passStringSequence(sequence<DOMString> seq);
  undefined passInterfaceSequence(sequence<Blob> seq);

  undefined passOverloaded(ArrayBuffer arg);
  undefined passOverloaded(DOMString arg);

  // https://github.com/servo/servo/pull/26154
  DOMString passOverloadedDict(Node arg);
  DOMString passOverloadedDict(TestURLLike arg);

  undefined passNullableBoolean(boolean? arg);
  undefined passNullableByte(byte? arg);
  undefined passNullableOctet(octet? arg);
  undefined passNullableShort(short? arg);
  undefined passNullableUnsignedShort(unsigned short? arg);
  undefined passNullableLong(long? arg);
  undefined passNullableUnsignedLong(unsigned long? arg);
  undefined passNullableLongLong(long long? arg);
  undefined passNullableUnsignedLongLong(unsigned long long? arg);
  undefined passNullableUnrestrictedFloat(unrestricted float? arg);
  undefined passNullableFloat(float? arg);
  undefined passNullableUnrestrictedDouble(unrestricted double? arg);
  undefined passNullableDouble(double? arg);
  undefined passNullableString(DOMString? arg);
  undefined passNullableUsvstring(USVString? arg);
  undefined passNullableByteString(ByteString? arg);
  // void passNullableEnum(TestEnum? arg);
  undefined passNullableInterface(Blob? arg);
  undefined passNullableObject(object? arg);
  undefined passNullableTypedArray(Int8Array? arg);
  undefined passNullableUnion((HTMLElement or long)? arg);
  undefined passNullableUnion2((Event or DOMString)? data);
  undefined passNullableUnion3((DOMString or sequence<long>)? data);
  undefined passNullableUnion4((sequence<long> or boolean)? bool);
  undefined passNullableUnion5((unsigned long or boolean)? arg);
  undefined passNullableUnion6((ByteString or long)? arg);
  undefined passNullableCallbackFunction(Function? fun);
  undefined passNullableCallbackInterface(EventListener? listener);
  undefined passNullableSequence(sequence<long>? seq);

  undefined passOptionalBoolean(optional boolean arg);
  undefined passOptionalByte(optional byte arg);
  undefined passOptionalOctet(optional octet arg);
  undefined passOptionalShort(optional short arg);
  undefined passOptionalUnsignedShort(optional unsigned short arg);
  undefined passOptionalLong(optional long arg);
  undefined passOptionalUnsignedLong(optional unsigned long arg);
  undefined passOptionalLongLong(optional long long arg);
  undefined passOptionalUnsignedLongLong(optional unsigned long long arg);
  undefined passOptionalUnrestrictedFloat(optional unrestricted float arg);
  undefined passOptionalFloat(optional float arg);
  undefined passOptionalUnrestrictedDouble(optional unrestricted double arg);
  undefined passOptionalDouble(optional double arg);
  undefined passOptionalString(optional DOMString arg);
  undefined passOptionalUsvstring(optional USVString arg);
  undefined passOptionalByteString(optional ByteString arg);
  undefined passOptionalEnum(optional TestEnum arg);
  undefined passOptionalInterface(optional Blob arg);
  undefined passOptionalUnion(optional (HTMLElement or long) arg);
  undefined passOptionalUnion2(optional (Event or DOMString) data);
  undefined passOptionalUnion3(optional (DOMString or sequence<long>) arg);
  undefined passOptionalUnion4(optional (sequence<long> or boolean) data);
  undefined passOptionalUnion5(optional (unsigned long or boolean) bool);
  undefined passOptionalUnion6(optional (ByteString or long) arg);
  undefined passOptionalAny(optional any arg);
  undefined passOptionalObject(optional object arg);
  undefined passOptionalCallbackFunction(optional Function fun);
  undefined passOptionalCallbackInterface(optional EventListener listener);
  undefined passOptionalSequence(optional sequence<long> seq);

  undefined passOptionalNullableBoolean(optional boolean? arg);
  undefined passOptionalNullableByte(optional byte? arg);
  undefined passOptionalNullableOctet(optional octet? arg);
  undefined passOptionalNullableShort(optional short? arg);
  undefined passOptionalNullableUnsignedShort(optional unsigned short? arg);
  undefined passOptionalNullableLong(optional long? arg);
  undefined passOptionalNullableUnsignedLong(optional unsigned long? arg);
  undefined passOptionalNullableLongLong(optional long long? arg);
  undefined passOptionalNullableUnsignedLongLong(optional unsigned long long? arg);
  undefined passOptionalNullableUnrestrictedFloat(optional unrestricted float? arg);
  undefined passOptionalNullableFloat(optional float? arg);
  undefined passOptionalNullableUnrestrictedDouble(optional unrestricted double? arg);
  undefined passOptionalNullableDouble(optional double? arg);
  undefined passOptionalNullableString(optional DOMString? arg);
  undefined passOptionalNullableUsvstring(optional USVString? arg);
  undefined passOptionalNullableByteString(optional ByteString? arg);
  // void passOptionalNullableEnum(optional TestEnum? arg);
  undefined passOptionalNullableInterface(optional Blob? arg);
  undefined passOptionalNullableObject(optional object? arg);
  undefined passOptionalNullableUnion(optional (HTMLElement or long)? arg);
  undefined passOptionalNullableUnion2(optional (Event or DOMString)? data);
  undefined passOptionalNullableUnion3(optional (DOMString or sequence<long>)? arg);
  undefined passOptionalNullableUnion4(optional (sequence<long> or boolean)? data);
  undefined passOptionalNullableUnion5(optional (unsigned long or boolean)? bool);
  undefined passOptionalNullableUnion6(optional (ByteString or long)? arg);
  undefined passOptionalNullableCallbackFunction(optional Function? fun);
  undefined passOptionalNullableCallbackInterface(optional EventListener? listener);
  undefined passOptionalNullableSequence(optional sequence<long>? seq);

  undefined passOptionalBooleanWithDefault(optional boolean arg = false);
  undefined passOptionalByteWithDefault(optional byte arg = 0);
  undefined passOptionalOctetWithDefault(optional octet arg = 19);
  undefined passOptionalShortWithDefault(optional short arg = 5);
  undefined passOptionalUnsignedShortWithDefault(optional unsigned short arg = 2);
  undefined passOptionalLongWithDefault(optional long arg = 7);
  undefined passOptionalUnsignedLongWithDefault(optional unsigned long arg = 6);
  undefined passOptionalLongLongWithDefault(optional long long arg = -12);
  undefined passOptionalUnsignedLongLongWithDefault(optional unsigned long long arg = 17);
  undefined passOptionalBytestringWithDefault(optional ByteString arg = "x");
  undefined passOptionalStringWithDefault(optional DOMString arg = "x");
  undefined passOptionalUsvstringWithDefault(optional USVString arg = "x");
  undefined passOptionalEnumWithDefault(optional TestEnum arg = "foo");
  undefined passOptionalSequenceWithDefault(optional sequence<long> seq = []);
  // void passOptionalUnionWithDefault(optional (HTMLElement or long) arg = 9);
  // void passOptionalUnion2WithDefault(optional(Event or DOMString)? data = "foo");

  undefined passOptionalNullableBooleanWithDefault(optional boolean? arg = null);
  undefined passOptionalNullableByteWithDefault(optional byte? arg = null);
  undefined passOptionalNullableOctetWithDefault(optional octet? arg = null);
  undefined passOptionalNullableShortWithDefault(optional short? arg = null);
  undefined passOptionalNullableUnsignedShortWithDefault(optional unsigned short? arg = null);
  undefined passOptionalNullableLongWithDefault(optional long? arg = null);
  undefined passOptionalNullableUnsignedLongWithDefault(optional unsigned long? arg = null);
  undefined passOptionalNullableLongLongWithDefault(optional long long? arg = null);
  undefined passOptionalNullableUnsignedLongLongWithDefault(optional unsigned long long? arg = null);
  undefined passOptionalNullableStringWithDefault(optional DOMString? arg = null);
  undefined passOptionalNullableUsvstringWithDefault(optional USVString? arg = null);
  undefined passOptionalNullableByteStringWithDefault(optional ByteString? arg = null);
  // void passOptionalNullableEnumWithDefault(optional TestEnum? arg = null);
  undefined passOptionalNullableInterfaceWithDefault(optional Blob? arg = null);
  undefined passOptionalNullableObjectWithDefault(optional object? arg = null);
  undefined passOptionalNullableUnionWithDefault(optional (HTMLElement or long)? arg = null);
  undefined passOptionalNullableUnion2WithDefault(optional (Event or DOMString)? data = null);
  // void passOptionalNullableCallbackFunctionWithDefault(optional Function? fun = null);
  undefined passOptionalNullableCallbackInterfaceWithDefault(optional EventListener? listener = null);
  undefined passOptionalAnyWithDefault(optional any arg = null);

  undefined passOptionalNullableBooleanWithNonNullDefault(optional boolean? arg = false);
  undefined passOptionalNullableByteWithNonNullDefault(optional byte? arg = 7);
  undefined passOptionalNullableOctetWithNonNullDefault(optional octet? arg = 7);
  undefined passOptionalNullableShortWithNonNullDefault(optional short? arg = 7);
  undefined passOptionalNullableUnsignedShortWithNonNullDefault(optional unsigned short? arg = 7);
  undefined passOptionalNullableLongWithNonNullDefault(optional long? arg = 7);
  undefined passOptionalNullableUnsignedLongWithNonNullDefault(optional unsigned long? arg = 7);
  undefined passOptionalNullableLongLongWithNonNullDefault(optional long long? arg = 7);
  undefined passOptionalNullableUnsignedLongLongWithNonNullDefault(optional unsigned long long? arg = 7);
  // void passOptionalNullableUnrestrictedFloatWithNonNullDefault(optional unrestricted float? arg = 0.0);
  // void passOptionalNullableFloatWithNonNullDefault(optional float? arg = 0.0);
  // void passOptionalNullableUnrestrictedDoubleWithNonNullDefault(optional unrestricted double? arg = 0.0);
  // void passOptionalNullableDoubleWithNonNullDefault(optional double? arg = 0.0);
  undefined passOptionalNullableStringWithNonNullDefault(optional DOMString? arg = "x");
  undefined passOptionalNullableUsvstringWithNonNullDefault(optional USVString? arg = "x");
  // void passOptionalNullableEnumWithNonNullDefault(optional TestEnum? arg = "foo");
  // void passOptionalNullableUnionWithNonNullDefault(optional (HTMLElement or long)? arg = 7);
  // void passOptionalNullableUnion2WithNonNullDefault(optional (Event or DOMString)? data = "foo");
  TestBinding passOptionalOverloaded(TestBinding arg0, optional unsigned long arg1 = 0,
                                     optional unsigned long arg2 = 0);
  undefined passOptionalOverloaded(Blob arg0, optional unsigned long arg1 = 0);

  undefined passVariadicBoolean(boolean... args);
  undefined passVariadicBooleanAndDefault(optional boolean arg = true, boolean... args);
  undefined passVariadicByte(byte... args);
  undefined passVariadicOctet(octet... args);
  undefined passVariadicShort(short... args);
  undefined passVariadicUnsignedShort(unsigned short... args);
  undefined passVariadicLong(long... args);
  undefined passVariadicUnsignedLong(unsigned long... args);
  undefined passVariadicLongLong(long long... args);
  undefined passVariadicUnsignedLongLong(unsigned long long... args);
  undefined passVariadicUnrestrictedFloat(unrestricted float... args);
  undefined passVariadicFloat(float... args);
  undefined passVariadicUnrestrictedDouble(unrestricted double... args);
  undefined passVariadicDouble(double... args);
  undefined passVariadicString(DOMString... args);
  undefined passVariadicUsvstring(USVString... args);
  undefined passVariadicByteString(ByteString... args);
  undefined passVariadicEnum(TestEnum... args);
  undefined passVariadicInterface(Blob... args);
  undefined passVariadicUnion((HTMLElement or long)... args);
  undefined passVariadicUnion2((Event or DOMString)... args);
  undefined passVariadicUnion3((Blob or DOMString)... args);
  undefined passVariadicUnion4((Blob or boolean)... args);
  undefined passVariadicUnion5((DOMString or unsigned long)... args);
  undefined passVariadicUnion6((unsigned long or boolean)... args);
  undefined passVariadicUnion7((ByteString or long)... args);
  undefined passVariadicAny(any... args);
  undefined passVariadicObject(object... args);

  undefined passSequenceSequence(sequence<sequence<long>> seq);
  sequence<sequence<long>> returnSequenceSequence();
  undefined passUnionSequenceSequence((long or sequence<sequence<long>>) seq);

  undefined passRecord(record<DOMString, long> arg);
  undefined passRecordWithUSVStringKey(record<USVString, long> arg);
  undefined passRecordWithByteStringKey(record<ByteString, long> arg);
  undefined passNullableRecord(record<DOMString, long>? arg);
  undefined passRecordOfNullableInts(record<DOMString, long?> arg);
  undefined passOptionalRecordOfNullableInts(optional record<DOMString, long?> arg);
  undefined passOptionalNullableRecordOfNullableInts(optional record<DOMString, long?>? arg);
  undefined passCastableObjectRecord(record<DOMString, TestBinding> arg);
  undefined passNullableCastableObjectRecord(record<DOMString, TestBinding?> arg);
  undefined passCastableObjectNullableRecord(record<DOMString, TestBinding>? arg);
  undefined passNullableCastableObjectNullableRecord(record<DOMString, TestBinding?>? arg);
  undefined passOptionalRecord(optional record<DOMString, long> arg);
  undefined passOptionalNullableRecord(optional record<DOMString, long>? arg);
  undefined passOptionalNullableRecordWithDefaultValue(optional record<DOMString, long>? arg = null);
  undefined passOptionalObjectRecord(optional record<DOMString, TestBinding> arg);
  undefined passStringRecord(record<DOMString, DOMString> arg);
  undefined passByteStringRecord(record<DOMString, ByteString> arg);
  undefined passRecordOfRecords(record<DOMString, record<DOMString, long>> arg);

  undefined passRecordUnion((long or record<DOMString, ByteString>) init);
  undefined passRecordUnion2((TestBinding or record<DOMString, ByteString>) init);
  undefined passRecordUnion3((TestBinding or sequence<sequence<ByteString>> or record<DOMString, ByteString>) init);

  record<DOMString, long> receiveRecord();
  record<USVString, long> receiveRecordWithUSVStringKey();
  record<ByteString, long> receiveRecordWithByteStringKey();
  record<DOMString, long>? receiveNullableRecord();
  record<DOMString, long?> receiveRecordOfNullableInts();
  record<DOMString, long?>? receiveNullableRecordOfNullableInts();
  record<DOMString, record<DOMString, long>> receiveRecordOfRecords();
  record<DOMString, any> receiveAnyRecord();

  static attribute boolean booleanAttributeStatic;
  static undefined receiveVoidStatic();
  boolean BooleanMozPreference(DOMString pref_name);
  DOMString StringMozPreference(DOMString pref_name);

  [Pref="dom.testbinding.prefcontrolled.enabled"]
  readonly attribute boolean prefControlledAttributeDisabled;
  [Pref="dom.testbinding.prefcontrolled.enabled"]
  static readonly attribute boolean prefControlledStaticAttributeDisabled;
  [Pref="dom.testbinding.prefcontrolled.enabled"]
  undefined prefControlledMethodDisabled();
  [Pref="dom.testbinding.prefcontrolled.enabled"]
  static undefined prefControlledStaticMethodDisabled();
  [Pref="dom.testbinding.prefcontrolled.enabled"]
  const unsigned short prefControlledConstDisabled = 0;
  [Pref="layout.animations.test.enabled"]
  undefined advanceClock(long millis);

  [Pref="dom.testbinding.prefcontrolled2.enabled"]
  readonly attribute boolean prefControlledAttributeEnabled;
  [Pref="dom.testbinding.prefcontrolled2.enabled"]
  static readonly attribute boolean prefControlledStaticAttributeEnabled;
  [Pref="dom.testbinding.prefcontrolled2.enabled"]
  undefined prefControlledMethodEnabled();
  [Pref="dom.testbinding.prefcontrolled2.enabled"]
  static undefined prefControlledStaticMethodEnabled();
  [Pref="dom.testbinding.prefcontrolled2.enabled"]
  const unsigned short prefControlledConstEnabled = 0;

  [Func="TestBinding::condition_unsatisfied"]
  readonly attribute boolean funcControlledAttributeDisabled;
  [Func="TestBinding::condition_unsatisfied"]
  static readonly attribute boolean funcControlledStaticAttributeDisabled;
  [Func="TestBinding::condition_unsatisfied"]
  undefined funcControlledMethodDisabled();
  [Func="TestBinding::condition_unsatisfied"]
  static undefined funcControlledStaticMethodDisabled();
  [Func="TestBinding::condition_unsatisfied"]
  const unsigned short funcControlledConstDisabled = 0;

  [Func="TestBinding::condition_satisfied"]
  readonly attribute boolean funcControlledAttributeEnabled;
  [Func="TestBinding::condition_satisfied"]
  static readonly attribute boolean funcControlledStaticAttributeEnabled;
  [Func="TestBinding::condition_satisfied"]
  undefined funcControlledMethodEnabled();
  [Func="TestBinding::condition_satisfied"]
  static undefined funcControlledStaticMethodEnabled();
  [Func="TestBinding::condition_satisfied"]
  const unsigned short funcControlledConstEnabled = 0;

  [Throws]
  Promise<any> returnResolvedPromise(any value);
  [Throws]
  Promise<any> returnRejectedPromise(any value);
  readonly attribute Promise<boolean> promiseAttribute;
  undefined acceptPromise(Promise<DOMString> string);
  Promise<any> promiseNativeHandler(SimpleCallback? resolve, SimpleCallback? reject);
  undefined promiseResolveNative(Promise<any> p, any value);
  undefined promiseRejectNative(Promise<any> p, any value);
  undefined promiseRejectWithTypeError(Promise<any> p, USVString message);
  undefined resolvePromiseDelayed(Promise<any> p, DOMString value, unsigned long long ms);

  undefined panic();

  GlobalScope entryGlobal();
  GlobalScope incumbentGlobal();

  [Exposed=(Window)]
  readonly attribute boolean semiExposedBoolFromInterface;

  TestDictionaryWithParent getDictionaryWithParent(DOMString parent, DOMString child);
};

[Exposed=(Window)]
partial interface TestBinding {
  readonly attribute boolean boolFromSemiExposedPartialInterface;
};

partial interface TestBinding {
  [Exposed=(Window)]
  readonly attribute boolean semiExposedBoolFromPartialInterface;
};

callback SimpleCallback = undefined(any value);

partial interface TestBinding {
  [Pref="dom.testable_crash.enabled"]
  undefined crashHard();
};

[Exposed=(Window,Worker), Pref="dom.testbinding.enabled"]
namespace TestNS {
    const unsigned long ONE   = 1;
    const unsigned long TWO   = 0x2;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Pref="dom.testbinding.enabled", Exposed=(Window,Worker)]
interface TestBindingIterable {
  [Throws] constructor();
  undefined add(DOMString arg);
  readonly attribute unsigned long length;
  getter DOMString getItem(unsigned long index);
  iterable<DOMString>;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Pref="dom.testbinding.enabled", Exposed=(Window,Worker)]
interface TestBindingMaplike {
  [Throws]
  constructor();

  maplike<DOMString, long>;
  undefined setInternal(DOMString aKey, long aValue);
  undefined clearInternal();
  boolean deleteInternal(DOMString aKey);
  boolean hasInternal(DOMString aKey);
  [Throws]
  long getInternal(DOMString aKey);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Pref="dom.testbinding.enabled", Exposed=(Window,Worker)]
interface TestBindingPairIterable {
  [Throws] constructor();
  undefined add(DOMString key, unsigned long value);
  iterable<DOMString, unsigned long>;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * This IDL file was created to test the special operations (see
 * https://heycam.github.io/webidl/#idl-special-operations) without converting
 * TestBinding.webidl into a proxy.
 *
 */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Pref="dom.testbinding.enabled", Exposed=(Window,Worker)]
interface TestBindingProxy : TestBinding {
  readonly attribute unsigned long length;

  getter DOMString getNamedItem(DOMString item_name);

  setter undefined setNamedItem(DOMString item_name, DOMString value);

  getter DOMString getItem(unsigned long index);

  setter undefined setItem(unsigned long index, DOMString value);

  deleter undefined removeItem(DOMString name);

  stringifier;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Pref="dom.testbinding.enabled", Exposed=(Window,Worker)]
interface TestBindingSetlike {
  [Throws]
  constructor();

  setlike<DOMString>;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://webbluetoothcg.github.io/web-bluetooth/tests#test-runner

// callback BluetoothManualChooserEventsCallback = void(sequence<DOMString> events);

[Pref="dom.bluetooth.testing.enabled", Exposed=Window]
interface TestRunner {
  [Throws]
  undefined setBluetoothMockDataSet(DOMString dataSetName);
  // void setBluetoothManualChooser();
  // void getBluetoothManualChooserEvents(BluetoothManualChooserEventsCallback callback);
  // void sendBluetoothManualChooserEvent(DOMString event, DOMString argument);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Pref="dom.worklet.testing.enabled", Exposed=(Window)]
interface TestWorklet {
   [Throws] constructor();
   [NewObject] Promise<undefined> addModule(USVString moduleURL, optional WorkletOptions options = {});
   DOMString? lookup(DOMString key);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// This interface is entirely internal to Servo, and should not be accessible to
// web pages.

[Global=(Worklet,TestWorklet), Pref="dom.worklet.enabled", Exposed=TestWorklet]
interface TestWorkletGlobalScope : WorkletGlobalScope {
    undefined registerKeyValue(DOMString key, DOMString value);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/
 *
 * To the extent possible under law, the editors have waived all copyright
 * and related or neighboring rights to this work.
 */

// https://dom.spec.whatwg.org/#text
[Exposed=Window]
interface Text : CharacterData {
  [Throws] constructor(optional DOMString data = "");
  [NewObject, Throws]
  Text splitText(unsigned long offset);
  [Pure]
  readonly attribute DOMString wholeText;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://encoding.spec.whatwg.org/#interface-textdecoder
dictionary TextDecoderOptions {
  boolean fatal = false;
  boolean ignoreBOM = false;
};

dictionary TextDecodeOptions {
  boolean stream = false;
};

[Exposed=(Window,Worker)]
interface TextDecoder {
  [Throws] constructor(optional DOMString label = "utf-8", optional TextDecoderOptions options = {});
  readonly attribute DOMString encoding;
  readonly attribute boolean fatal;
  readonly attribute boolean ignoreBOM;
  [Throws]
  USVString decode(optional BufferSource input, optional TextDecodeOptions options = {});
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

/* https://encoding.spec.whatwg.org/#interface-textencoder */
[Exposed=(Window,Worker)]
interface TextEncoder {
   [Throws] constructor();
   readonly attribute DOMString encoding;
   [NewObject]
   Uint8Array encode(optional USVString input = "");
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#textmetrics
[Exposed=(PaintWorklet, Window, Worker), Pref="dom.canvas_text.enabled"]
interface TextMetrics {
  // x-direction
  readonly attribute double width; // advance width
  readonly attribute double actualBoundingBoxLeft;
  readonly attribute double actualBoundingBoxRight;

  // y-direction
  readonly attribute double fontBoundingBoxAscent;
  readonly attribute double fontBoundingBoxDescent;
  readonly attribute double actualBoundingBoxAscent;
  readonly attribute double actualBoundingBoxDescent;
  readonly attribute double emHeightAscent;
  readonly attribute double emHeightDescent;
  readonly attribute double hangingBaseline;
  readonly attribute double alphabeticBaseline;
  readonly attribute double ideographicBaseline;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#texttrack

enum TextTrackMode { "disabled",  "hidden",  "showing" };
enum TextTrackKind { "subtitles",  "captions",  "descriptions",  "chapters",  "metadata" };

[Exposed=Window]
interface TextTrack : EventTarget {
  readonly attribute TextTrackKind kind;
  readonly attribute DOMString label;
  readonly attribute DOMString language;

  readonly attribute DOMString id;
  // readonly attribute DOMString inBandMetadataTrackDispatchType;

  attribute TextTrackMode mode;

  readonly attribute TextTrackCueList? cues;
  readonly attribute TextTrackCueList? activeCues;

  [Throws]
  undefined addCue(TextTrackCue cue);
  [Throws]
  undefined removeCue(TextTrackCue cue);

  attribute EventHandler oncuechange;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#texttrackcue

[Exposed=Window]
interface TextTrackCue : EventTarget {
  readonly attribute TextTrack? track;

  attribute DOMString id;
  attribute double startTime;
  attribute double endTime;
  attribute boolean pauseOnExit;

  attribute EventHandler onenter;
  attribute EventHandler onexit;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#texttrackcuelist

[Exposed=Window]
interface TextTrackCueList {
  readonly attribute unsigned long length;
  getter TextTrackCue (unsigned long index);
  TextTrackCue? getCueById(DOMString id);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#texttracklist

[Exposed=Window]
interface TextTrackList : EventTarget {
  readonly attribute unsigned long length;
  getter TextTrack (unsigned long index);
  TextTrack? getTrackById(DOMString id);

  attribute EventHandler onchange;
  attribute EventHandler onaddtrack;
  attribute EventHandler onremovetrack;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage#time-ranges

[Exposed=Window]
interface TimeRanges {
  readonly attribute unsigned long length;
  [Throws] double start(unsigned long index);
  [Throws] double end(unsigned long index);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// http://w3c.github.io/touch-events/#idl-def-Touch
[Exposed=Window]
interface Touch {
    readonly    attribute long        identifier;
    readonly    attribute EventTarget target;
    readonly    attribute double      screenX;
    readonly    attribute double      screenY;
    readonly    attribute double      clientX;
    readonly    attribute double      clientY;
    readonly    attribute double      pageX;
    readonly    attribute double      pageY;
    // readonly    attribute float       radiusX;
    // readonly    attribute float       radiusY;
    // readonly    attribute float       rotationAngle;
    // readonly    attribute float       force;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// http://w3c.github.io/touch-events/#idl-def-TouchEvent
[Exposed=Window]
interface TouchEvent : UIEvent {
    readonly    attribute TouchList touches;
    readonly    attribute TouchList targetTouches;
    readonly    attribute TouchList changedTouches;
    readonly    attribute boolean   altKey;
    readonly    attribute boolean   metaKey;
    readonly    attribute boolean   ctrlKey;
    readonly    attribute boolean   shiftKey;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// http://w3c.github.io/touch-events/#idl-def-TouchList
[Exposed=Window]
interface TouchList {
    readonly    attribute unsigned long length;
    getter Touch? item (unsigned long index);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-trackevent-interface

[Exposed=Window]
interface TrackEvent : Event {
  [Throws] constructor(DOMString type, optional TrackEventInit eventInitDict = {});
  readonly attribute (VideoTrack or AudioTrack or TextTrack)? track;
};

dictionary TrackEventInit : EventInit {
  (VideoTrack or AudioTrack or TextTrack)? track = null;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * For more information on this interface please see
 * https://dom.spec.whatwg.org/#event
 */

[Exposed=Window]
interface TransitionEvent : Event {
  [Throws] constructor(DOMString type, optional TransitionEventInit transitionEventInitDict = {});
  readonly attribute DOMString          propertyName;
  readonly attribute float              elapsedTime;
  readonly attribute DOMString          pseudoElement;
};

dictionary TransitionEventInit : EventInit {
  DOMString propertyName = "";
  float elapsedTime = 0.0;
  DOMString pseudoElement = "";
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://dom.spec.whatwg.org/#interface-treewalker
 */

[Exposed=Window]
interface TreeWalker {
  [SameObject]
  readonly attribute Node root;
  [Constant]
  readonly attribute unsigned long whatToShow;
  [Constant]
  readonly attribute NodeFilter? filter;
  [Pure]
           attribute Node currentNode;

  [Throws]
  Node? parentNode();
  [Throws]
  Node? firstChild();
  [Throws]
  Node? lastChild();
  [Throws]
  Node? previousSibling();
  [Throws]
  Node? nextSibling();
  [Throws]
  Node? previousNode();
  [Throws]
  Node? nextNode();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/uievents/#interface-uievent
[Exposed=Window]
interface UIEvent : Event {
  [Throws] constructor(DOMString type, optional UIEventInit eventInitDict = {});
  //  readonly    attribute WindowProxy? view;
  readonly attribute Window? view;
    readonly    attribute long         detail;
};

// https://w3c.github.io/uievents/#dictdef-uieventinit-uieventinit
dictionary UIEventInit : EventInit {
  //  WindowProxy? view = null;
  Window? view = null;
    long         detail = 0;
};

// https://w3c.github.io/uievents/#idl-interface-UIEvent-initializers
partial interface UIEvent {
    // Deprecated in DOM Level 3
    undefined initUIEvent (
      DOMString typeArg,
      boolean bubblesArg,
      boolean cancelableArg,
      Window? viewArg,
      long detailArg
    );
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://url.spec.whatwg.org/#url
[Exposed=(Window,Worker),
 LegacyWindowAlias=webkitURL]
interface URL {
  [Throws] constructor(USVString url, optional USVString base);

  static boolean canParse(USVString url, optional USVString base);

  [SetterThrows]
  stringifier attribute USVString href;
  readonly attribute USVString origin;
           attribute USVString protocol;
           attribute USVString username;
           attribute USVString password;
           attribute USVString host;
           attribute USVString hostname;
           attribute USVString port;
           attribute USVString pathname;
           attribute USVString search;
  readonly attribute URLSearchParams searchParams;
           attribute USVString hash;

  // https://w3c.github.io/FileAPI/#creating-revoking
  static DOMString createObjectURL(Blob blob);
  // static DOMString createFor(Blob blob);
  static undefined revokeObjectURL(DOMString url);

  USVString toJSON();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://url.spec.whatwg.org/#interface-urlsearchparams
 */

[Exposed=(Window,Worker)]
interface URLSearchParams {
  [Throws] constructor(optional (sequence<sequence<USVString>> or record<USVString, USVString> or USVString) init = "");
  readonly attribute unsigned long size;
  undefined append(USVString name, USVString value);
  undefined delete(USVString name, optional USVString value);
  USVString? get(USVString name);
  sequence<USVString> getAll(USVString name);
  boolean has(USVString name, optional USVString value);
  undefined set(USVString name, USVString value);

  undefined sort();

  // Be careful with implementing iterable interface.
  // Search params might be mutated by URL::SetSearch while iterating (discussed in PR #10351).
  iterable<USVString, USVString>;
  stringifier;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webvtt/#the-vttcue-interface

enum AutoKeyword { "auto"};
typedef (double or AutoKeyword) LineAndPositionSetting;
enum DirectionSetting { "" /* horizontal */, "rl", "lr" };
enum LineAlignSetting { "start", "center", "end" };
enum PositionAlignSetting { "line-left", "center", "line-right", "auto" };
enum AlignSetting { "start", "center", "end", "left", "right" };

[Pref="dom.webvtt.enabled", Exposed=Window]
interface VTTCue : TextTrackCue {
  constructor(double startTime, double endTime, DOMString text);
  attribute VTTRegion? region;
  attribute DirectionSetting vertical;
  attribute boolean snapToLines;
  attribute LineAndPositionSetting line;
  attribute LineAlignSetting lineAlign;
  [SetterThrows]
  attribute LineAndPositionSetting position;
  attribute PositionAlignSetting positionAlign;
  [SetterThrows]
  attribute double size;
  attribute AlignSetting align;
  attribute DOMString text;
  DocumentFragment getCueAsHTML();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/webvtt/#the-vttregion-interface

enum ScrollSetting { "" /* none */, "up"};

[Pref="dom.webvtt.enabled", Exposed=Window]
interface VTTRegion {
  [Throws] constructor();
  attribute DOMString id;
  [SetterThrows]
  attribute double width;
  [SetterThrows]
  attribute unsigned long lines;
  [SetterThrows]
  attribute double regionAnchorX;
  [SetterThrows]
  attribute double regionAnchorY;
  [SetterThrows]
  attribute double viewportAnchorX;
  [SetterThrows]
  attribute double viewportAnchorY;
  attribute ScrollSetting scroll;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#validitystate
[Exposed=Window]
interface ValidityState {
  readonly attribute boolean valueMissing;
  readonly attribute boolean typeMismatch;
  readonly attribute boolean patternMismatch;
  readonly attribute boolean tooLong;
  readonly attribute boolean tooShort;
  readonly attribute boolean rangeUnderflow;
  readonly attribute boolean rangeOverflow;
  readonly attribute boolean stepMismatch;
  readonly attribute boolean badInput;
  readonly attribute boolean customError;
  readonly attribute boolean valid;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#videotrack

[Exposed=Window]
interface VideoTrack {
  readonly attribute DOMString id;
  readonly attribute DOMString kind;
  readonly attribute DOMString label;
  readonly attribute DOMString language;
  attribute boolean selected;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#videotracklist

[Exposed=Window]
interface VideoTrackList : EventTarget {
  readonly attribute unsigned long length;
  getter VideoTrack (unsigned long index);
  VideoTrack? getTrackById(DOMString id);
  readonly attribute long selectedIndex;

  attribute EventHandler onchange;
  attribute EventHandler onaddtrack;
  attribute EventHandler onremovetrack;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://heycam.github.io/webidl/#VoidFunction
 *
 * © Copyright 2004-2011 Apple Computer, Inc., Mozilla Foundation, and
 * Opera Software ASA. You are granted a license to use, reproduce
 * and create derivative works of this document.
 */

callback VoidFunction = undefined ();
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/WEBGL_color_buffer_float/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface WEBGLColorBufferFloat {
  const GLenum RGBA32F_EXT = 0x8814;
  const GLenum FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT = 0x8211;
  const GLenum UNSIGNED_NORMALIZED_EXT = 0x8C17;
}; // interface WEBGL_color_buffer_float
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/WEBGL_compressed_texture_etc1/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface WEBGLCompressedTextureETC1 {
    /* Compressed Texture Format */
    const GLenum COMPRESSED_RGB_ETC1_WEBGL = 0x8D64;
}; // interface WEBGLCompressedTextureETC1
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/WEBGL_compressed_texture_s3tc/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface WEBGLCompressedTextureS3TC {
    /* Compressed Texture Formats */
    const GLenum COMPRESSED_RGB_S3TC_DXT1_EXT  = 0x83F0;
    const GLenum COMPRESSED_RGBA_S3TC_DXT1_EXT = 0x83F1;
    const GLenum COMPRESSED_RGBA_S3TC_DXT3_EXT = 0x83F2;
    const GLenum COMPRESSED_RGBA_S3TC_DXT5_EXT = 0x83F3;
}; // interface WEBGLCompressedTextureS3TC
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/
//
// This IDL depends on the typed array specification defined at:
// https://www.khronos.org/registry/typedarray/specs/latest/typedarrays.idl

typedef long long GLint64;
typedef unsigned long long GLuint64;

typedef (/*[AllowShared]*/ Uint32Array or sequence<GLuint>) Uint32List;

interface mixin WebGL2RenderingContextBase
{
  const GLenum READ_BUFFER                                   = 0x0C02;
  const GLenum UNPACK_ROW_LENGTH                             = 0x0CF2;
  const GLenum UNPACK_SKIP_ROWS                              = 0x0CF3;
  const GLenum UNPACK_SKIP_PIXELS                            = 0x0CF4;
  const GLenum PACK_ROW_LENGTH                               = 0x0D02;
  const GLenum PACK_SKIP_ROWS                                = 0x0D03;
  const GLenum PACK_SKIP_PIXELS                              = 0x0D04;
  const GLenum COLOR                                         = 0x1800;
  const GLenum DEPTH                                         = 0x1801;
  const GLenum STENCIL                                       = 0x1802;
  const GLenum RED                                           = 0x1903;
  const GLenum RGB8                                          = 0x8051;
  const GLenum RGBA8                                         = 0x8058;
  const GLenum RGB10_A2                                      = 0x8059;
  const GLenum TEXTURE_BINDING_3D                            = 0x806A;
  const GLenum UNPACK_SKIP_IMAGES                            = 0x806D;
  const GLenum UNPACK_IMAGE_HEIGHT                           = 0x806E;
  const GLenum TEXTURE_3D                                    = 0x806F;
  const GLenum TEXTURE_WRAP_R                                = 0x8072;
  const GLenum MAX_3D_TEXTURE_SIZE                           = 0x8073;
  const GLenum UNSIGNED_INT_2_10_10_10_REV                   = 0x8368;
  const GLenum MAX_ELEMENTS_VERTICES                         = 0x80E8;
  const GLenum MAX_ELEMENTS_INDICES                          = 0x80E9;
  const GLenum TEXTURE_MIN_LOD                               = 0x813A;
  const GLenum TEXTURE_MAX_LOD                               = 0x813B;
  const GLenum TEXTURE_BASE_LEVEL                            = 0x813C;
  const GLenum TEXTURE_MAX_LEVEL                             = 0x813D;
  const GLenum MIN                                           = 0x8007;
  const GLenum MAX                                           = 0x8008;
  const GLenum DEPTH_COMPONENT24                             = 0x81A6;
  const GLenum MAX_TEXTURE_LOD_BIAS                          = 0x84FD;
  const GLenum TEXTURE_COMPARE_MODE                          = 0x884C;
  const GLenum TEXTURE_COMPARE_FUNC                          = 0x884D;
  const GLenum CURRENT_QUERY                                 = 0x8865;
  const GLenum QUERY_RESULT                                  = 0x8866;
  const GLenum QUERY_RESULT_AVAILABLE                        = 0x8867;
  const GLenum STREAM_READ                                   = 0x88E1;
  const GLenum STREAM_COPY                                   = 0x88E2;
  const GLenum STATIC_READ                                   = 0x88E5;
  const GLenum STATIC_COPY                                   = 0x88E6;
  const GLenum DYNAMIC_READ                                  = 0x88E9;
  const GLenum DYNAMIC_COPY                                  = 0x88EA;
  const GLenum MAX_DRAW_BUFFERS                              = 0x8824;
  const GLenum DRAW_BUFFER0                                  = 0x8825;
  const GLenum DRAW_BUFFER1                                  = 0x8826;
  const GLenum DRAW_BUFFER2                                  = 0x8827;
  const GLenum DRAW_BUFFER3                                  = 0x8828;
  const GLenum DRAW_BUFFER4                                  = 0x8829;
  const GLenum DRAW_BUFFER5                                  = 0x882A;
  const GLenum DRAW_BUFFER6                                  = 0x882B;
  const GLenum DRAW_BUFFER7                                  = 0x882C;
  const GLenum DRAW_BUFFER8                                  = 0x882D;
  const GLenum DRAW_BUFFER9                                  = 0x882E;
  const GLenum DRAW_BUFFER10                                 = 0x882F;
  const GLenum DRAW_BUFFER11                                 = 0x8830;
  const GLenum DRAW_BUFFER12                                 = 0x8831;
  const GLenum DRAW_BUFFER13                                 = 0x8832;
  const GLenum DRAW_BUFFER14                                 = 0x8833;
  const GLenum DRAW_BUFFER15                                 = 0x8834;
  const GLenum MAX_FRAGMENT_UNIFORM_COMPONENTS               = 0x8B49;
  const GLenum MAX_VERTEX_UNIFORM_COMPONENTS                 = 0x8B4A;
  const GLenum SAMPLER_3D                                    = 0x8B5F;
  const GLenum SAMPLER_2D_SHADOW                             = 0x8B62;
  const GLenum FRAGMENT_SHADER_DERIVATIVE_HINT               = 0x8B8B;
  const GLenum PIXEL_PACK_BUFFER                             = 0x88EB;
  const GLenum PIXEL_UNPACK_BUFFER                           = 0x88EC;
  const GLenum PIXEL_PACK_BUFFER_BINDING                     = 0x88ED;
  const GLenum PIXEL_UNPACK_BUFFER_BINDING                   = 0x88EF;
  const GLenum FLOAT_MAT2x3                                  = 0x8B65;
  const GLenum FLOAT_MAT2x4                                  = 0x8B66;
  const GLenum FLOAT_MAT3x2                                  = 0x8B67;
  const GLenum FLOAT_MAT3x4                                  = 0x8B68;
  const GLenum FLOAT_MAT4x2                                  = 0x8B69;
  const GLenum FLOAT_MAT4x3                                  = 0x8B6A;
  const GLenum SRGB                                          = 0x8C40;
  const GLenum SRGB8                                         = 0x8C41;
  const GLenum SRGB8_ALPHA8                                  = 0x8C43;
  const GLenum COMPARE_REF_TO_TEXTURE                        = 0x884E;
  const GLenum RGBA32F                                       = 0x8814;
  const GLenum RGB32F                                        = 0x8815;
  const GLenum RGBA16F                                       = 0x881A;
  const GLenum RGB16F                                        = 0x881B;
  const GLenum VERTEX_ATTRIB_ARRAY_INTEGER                   = 0x88FD;
  const GLenum MAX_ARRAY_TEXTURE_LAYERS                      = 0x88FF;
  const GLenum MIN_PROGRAM_TEXEL_OFFSET                      = 0x8904;
  const GLenum MAX_PROGRAM_TEXEL_OFFSET                      = 0x8905;
  const GLenum MAX_VARYING_COMPONENTS                        = 0x8B4B;
  const GLenum TEXTURE_2D_ARRAY                              = 0x8C1A;
  const GLenum TEXTURE_BINDING_2D_ARRAY                      = 0x8C1D;
  const GLenum R11F_G11F_B10F                                = 0x8C3A;
  const GLenum UNSIGNED_INT_10F_11F_11F_REV                  = 0x8C3B;
  const GLenum RGB9_E5                                       = 0x8C3D;
  const GLenum UNSIGNED_INT_5_9_9_9_REV                      = 0x8C3E;
  const GLenum TRANSFORM_FEEDBACK_BUFFER_MODE                = 0x8C7F;
  const GLenum MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS    = 0x8C80;
  const GLenum TRANSFORM_FEEDBACK_VARYINGS                   = 0x8C83;
  const GLenum TRANSFORM_FEEDBACK_BUFFER_START               = 0x8C84;
  const GLenum TRANSFORM_FEEDBACK_BUFFER_SIZE                = 0x8C85;
  const GLenum TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN         = 0x8C88;
  const GLenum RASTERIZER_DISCARD                            = 0x8C89;
  const GLenum MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
  const GLenum MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS       = 0x8C8B;
  const GLenum INTERLEAVED_ATTRIBS                           = 0x8C8C;
  const GLenum SEPARATE_ATTRIBS                              = 0x8C8D;
  const GLenum TRANSFORM_FEEDBACK_BUFFER                     = 0x8C8E;
  const GLenum TRANSFORM_FEEDBACK_BUFFER_BINDING             = 0x8C8F;
  const GLenum RGBA32UI                                      = 0x8D70;
  const GLenum RGB32UI                                       = 0x8D71;
  const GLenum RGBA16UI                                      = 0x8D76;
  const GLenum RGB16UI                                       = 0x8D77;
  const GLenum RGBA8UI                                       = 0x8D7C;
  const GLenum RGB8UI                                        = 0x8D7D;
  const GLenum RGBA32I                                       = 0x8D82;
  const GLenum RGB32I                                        = 0x8D83;
  const GLenum RGBA16I                                       = 0x8D88;
  const GLenum RGB16I                                        = 0x8D89;
  const GLenum RGBA8I                                        = 0x8D8E;
  const GLenum RGB8I                                         = 0x8D8F;
  const GLenum RED_INTEGER                                   = 0x8D94;
  const GLenum RGB_INTEGER                                   = 0x8D98;
  const GLenum RGBA_INTEGER                                  = 0x8D99;
  const GLenum SAMPLER_2D_ARRAY                              = 0x8DC1;
  const GLenum SAMPLER_2D_ARRAY_SHADOW                       = 0x8DC4;
  const GLenum SAMPLER_CUBE_SHADOW                           = 0x8DC5;
  const GLenum UNSIGNED_INT_VEC2                             = 0x8DC6;
  const GLenum UNSIGNED_INT_VEC3                             = 0x8DC7;
  const GLenum UNSIGNED_INT_VEC4                             = 0x8DC8;
  const GLenum INT_SAMPLER_2D                                = 0x8DCA;
  const GLenum INT_SAMPLER_3D                                = 0x8DCB;
  const GLenum INT_SAMPLER_CUBE                              = 0x8DCC;
  const GLenum INT_SAMPLER_2D_ARRAY                          = 0x8DCF;
  const GLenum UNSIGNED_INT_SAMPLER_2D                       = 0x8DD2;
  const GLenum UNSIGNED_INT_SAMPLER_3D                       = 0x8DD3;
  const GLenum UNSIGNED_INT_SAMPLER_CUBE                     = 0x8DD4;
  const GLenum UNSIGNED_INT_SAMPLER_2D_ARRAY                 = 0x8DD7;
  const GLenum DEPTH_COMPONENT32F                            = 0x8CAC;
  const GLenum DEPTH32F_STENCIL8                             = 0x8CAD;
  const GLenum FLOAT_32_UNSIGNED_INT_24_8_REV                = 0x8DAD;
  const GLenum FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING         = 0x8210;
  const GLenum FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE         = 0x8211;
  const GLenum FRAMEBUFFER_ATTACHMENT_RED_SIZE               = 0x8212;
  const GLenum FRAMEBUFFER_ATTACHMENT_GREEN_SIZE             = 0x8213;
  const GLenum FRAMEBUFFER_ATTACHMENT_BLUE_SIZE              = 0x8214;
  const GLenum FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE             = 0x8215;
  const GLenum FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE             = 0x8216;
  const GLenum FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE           = 0x8217;
  const GLenum FRAMEBUFFER_DEFAULT                           = 0x8218;
  // BUG: https://github.com/KhronosGroup/WebGL/issues/2216
  // const GLenum DEPTH_STENCIL_ATTACHMENT                      = 0x821A;
  // const GLenum DEPTH_STENCIL                                 = 0x84F9;
  const GLenum UNSIGNED_INT_24_8                             = 0x84FA;
  const GLenum DEPTH24_STENCIL8                              = 0x88F0;
  const GLenum UNSIGNED_NORMALIZED                           = 0x8C17;
  const GLenum DRAW_FRAMEBUFFER_BINDING                      = 0x8CA6; /* Same as FRAMEBUFFER_BINDING */
  const GLenum READ_FRAMEBUFFER                              = 0x8CA8;
  const GLenum DRAW_FRAMEBUFFER                              = 0x8CA9;
  const GLenum READ_FRAMEBUFFER_BINDING                      = 0x8CAA;
  const GLenum RENDERBUFFER_SAMPLES                          = 0x8CAB;
  const GLenum FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER          = 0x8CD4;
  const GLenum MAX_COLOR_ATTACHMENTS                         = 0x8CDF;
  const GLenum COLOR_ATTACHMENT1                             = 0x8CE1;
  const GLenum COLOR_ATTACHMENT2                             = 0x8CE2;
  const GLenum COLOR_ATTACHMENT3                             = 0x8CE3;
  const GLenum COLOR_ATTACHMENT4                             = 0x8CE4;
  const GLenum COLOR_ATTACHMENT5                             = 0x8CE5;
  const GLenum COLOR_ATTACHMENT6                             = 0x8CE6;
  const GLenum COLOR_ATTACHMENT7                             = 0x8CE7;
  const GLenum COLOR_ATTACHMENT8                             = 0x8CE8;
  const GLenum COLOR_ATTACHMENT9                             = 0x8CE9;
  const GLenum COLOR_ATTACHMENT10                            = 0x8CEA;
  const GLenum COLOR_ATTACHMENT11                            = 0x8CEB;
  const GLenum COLOR_ATTACHMENT12                            = 0x8CEC;
  const GLenum COLOR_ATTACHMENT13                            = 0x8CED;
  const GLenum COLOR_ATTACHMENT14                            = 0x8CEE;
  const GLenum COLOR_ATTACHMENT15                            = 0x8CEF;
  const GLenum FRAMEBUFFER_INCOMPLETE_MULTISAMPLE            = 0x8D56;
  const GLenum MAX_SAMPLES                                   = 0x8D57;
  const GLenum HALF_FLOAT                                    = 0x140B;
  const GLenum RG                                            = 0x8227;
  const GLenum RG_INTEGER                                    = 0x8228;
  const GLenum R8                                            = 0x8229;
  const GLenum RG8                                           = 0x822B;
  const GLenum R16F                                          = 0x822D;
  const GLenum R32F                                          = 0x822E;
  const GLenum RG16F                                         = 0x822F;
  const GLenum RG32F                                         = 0x8230;
  const GLenum R8I                                           = 0x8231;
  const GLenum R8UI                                          = 0x8232;
  const GLenum R16I                                          = 0x8233;
  const GLenum R16UI                                         = 0x8234;
  const GLenum R32I                                          = 0x8235;
  const GLenum R32UI                                         = 0x8236;
  const GLenum RG8I                                          = 0x8237;
  const GLenum RG8UI                                         = 0x8238;
  const GLenum RG16I                                         = 0x8239;
  const GLenum RG16UI                                        = 0x823A;
  const GLenum RG32I                                         = 0x823B;
  const GLenum RG32UI                                        = 0x823C;
  const GLenum VERTEX_ARRAY_BINDING                          = 0x85B5;
  const GLenum R8_SNORM                                      = 0x8F94;
  const GLenum RG8_SNORM                                     = 0x8F95;
  const GLenum RGB8_SNORM                                    = 0x8F96;
  const GLenum RGBA8_SNORM                                   = 0x8F97;
  const GLenum SIGNED_NORMALIZED                             = 0x8F9C;
  const GLenum COPY_READ_BUFFER                              = 0x8F36;
  const GLenum COPY_WRITE_BUFFER                             = 0x8F37;
  const GLenum COPY_READ_BUFFER_BINDING                      = 0x8F36; /* Same as COPY_READ_BUFFER */
  const GLenum COPY_WRITE_BUFFER_BINDING                     = 0x8F37; /* Same as COPY_WRITE_BUFFER */
  const GLenum UNIFORM_BUFFER                                = 0x8A11;
  const GLenum UNIFORM_BUFFER_BINDING                        = 0x8A28;
  const GLenum UNIFORM_BUFFER_START                          = 0x8A29;
  const GLenum UNIFORM_BUFFER_SIZE                           = 0x8A2A;
  const GLenum MAX_VERTEX_UNIFORM_BLOCKS                     = 0x8A2B;
  const GLenum MAX_FRAGMENT_UNIFORM_BLOCKS                   = 0x8A2D;
  const GLenum MAX_COMBINED_UNIFORM_BLOCKS                   = 0x8A2E;
  const GLenum MAX_UNIFORM_BUFFER_BINDINGS                   = 0x8A2F;
  const GLenum MAX_UNIFORM_BLOCK_SIZE                        = 0x8A30;
  const GLenum MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS        = 0x8A31;
  const GLenum MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS      = 0x8A33;
  const GLenum UNIFORM_BUFFER_OFFSET_ALIGNMENT               = 0x8A34;
  const GLenum ACTIVE_UNIFORM_BLOCKS                         = 0x8A36;
  const GLenum UNIFORM_TYPE                                  = 0x8A37;
  const GLenum UNIFORM_SIZE                                  = 0x8A38;
  const GLenum UNIFORM_BLOCK_INDEX                           = 0x8A3A;
  const GLenum UNIFORM_OFFSET                                = 0x8A3B;
  const GLenum UNIFORM_ARRAY_STRIDE                          = 0x8A3C;
  const GLenum UNIFORM_MATRIX_STRIDE                         = 0x8A3D;
  const GLenum UNIFORM_IS_ROW_MAJOR                          = 0x8A3E;
  const GLenum UNIFORM_BLOCK_BINDING                         = 0x8A3F;
  const GLenum UNIFORM_BLOCK_DATA_SIZE                       = 0x8A40;
  const GLenum UNIFORM_BLOCK_ACTIVE_UNIFORMS                 = 0x8A42;
  const GLenum UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES          = 0x8A43;
  const GLenum UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER     = 0x8A44;
  const GLenum UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER   = 0x8A46;
  const GLenum INVALID_INDEX                                 = 0xFFFFFFFF;
  const GLenum MAX_VERTEX_OUTPUT_COMPONENTS                  = 0x9122;
  const GLenum MAX_FRAGMENT_INPUT_COMPONENTS                 = 0x9125;
  const GLenum MAX_SERVER_WAIT_TIMEOUT                       = 0x9111;
  const GLenum OBJECT_TYPE                                   = 0x9112;
  const GLenum SYNC_CONDITION                                = 0x9113;
  const GLenum SYNC_STATUS                                   = 0x9114;
  const GLenum SYNC_FLAGS                                    = 0x9115;
  const GLenum SYNC_FENCE                                    = 0x9116;
  const GLenum SYNC_GPU_COMMANDS_COMPLETE                    = 0x9117;
  const GLenum UNSIGNALED                                    = 0x9118;
  const GLenum SIGNALED                                      = 0x9119;
  const GLenum ALREADY_SIGNALED                              = 0x911A;
  const GLenum TIMEOUT_EXPIRED                               = 0x911B;
  const GLenum CONDITION_SATISFIED                           = 0x911C;
  const GLenum WAIT_FAILED                                   = 0x911D;
  const GLenum SYNC_FLUSH_COMMANDS_BIT                       = 0x00000001;
  const GLenum VERTEX_ATTRIB_ARRAY_DIVISOR                   = 0x88FE;
  const GLenum ANY_SAMPLES_PASSED                            = 0x8C2F;
  const GLenum ANY_SAMPLES_PASSED_CONSERVATIVE               = 0x8D6A;
  const GLenum SAMPLER_BINDING                               = 0x8919;
  const GLenum RGB10_A2UI                                    = 0x906F;
  const GLenum INT_2_10_10_10_REV                            = 0x8D9F;
  const GLenum TRANSFORM_FEEDBACK                            = 0x8E22;
  const GLenum TRANSFORM_FEEDBACK_PAUSED                     = 0x8E23;
  const GLenum TRANSFORM_FEEDBACK_ACTIVE                     = 0x8E24;
  const GLenum TRANSFORM_FEEDBACK_BINDING                    = 0x8E25;
  const GLenum TEXTURE_IMMUTABLE_FORMAT                      = 0x912F;
  const GLenum MAX_ELEMENT_INDEX                             = 0x8D6B;
  const GLenum TEXTURE_IMMUTABLE_LEVELS                      = 0x82DF;

  const GLint64 TIMEOUT_IGNORED                              = -1;

  /* WebGL-specific enums */
  const GLenum MAX_CLIENT_WAIT_TIMEOUT_WEBGL                 = 0x9247;

  /* Buffer objects */
  undefined copyBufferSubData(GLenum readTarget, GLenum writeTarget, GLintptr readOffset,
                         GLintptr writeOffset, GLsizeiptr size);
  // MapBufferRange, in particular its read-only and write-only modes,
  // can not be exposed safely to JavaScript. GetBufferSubData
  // replaces it for the purpose of fetching data back from the GPU.
  undefined getBufferSubData(GLenum target, GLintptr srcByteOffset, /*[AllowShared]*/ ArrayBufferView dstBuffer,
                        optional GLuint dstOffset = 0, optional GLuint length = 0);

  /* Framebuffer objects */
  // void blitFramebuffer(GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0,
  //                      GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
  undefined framebufferTextureLayer(GLenum target, GLenum attachment, WebGLTexture? texture, GLint level,
                               GLint layer);
  undefined invalidateFramebuffer(GLenum target, sequence<GLenum> attachments);
  undefined invalidateSubFramebuffer(GLenum target, sequence<GLenum> attachments,
                                GLint x, GLint y, GLsizei width, GLsizei height);
  undefined readBuffer(GLenum src);

  /* Renderbuffer objects */
  any getInternalformatParameter(GLenum target, GLenum internalformat, GLenum pname);
  undefined renderbufferStorageMultisample(GLenum target, GLsizei samples, GLenum internalformat,
                                      GLsizei width, GLsizei height);

  /* Texture objects */
  undefined texStorage2D(GLenum target, GLsizei levels, GLenum internalformat, GLsizei width,
                    GLsizei height);
  undefined texStorage3D(GLenum target, GLsizei levels, GLenum internalformat, GLsizei width,
                    GLsizei height, GLsizei depth);

  //[Throws]
  //void texImage3D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
  //                GLsizei depth, GLint border, GLenum format, GLenum type, GLintptr pboOffset);
  //[Throws]
  //void texImage3D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
  //                GLsizei depth, GLint border, GLenum format, GLenum type,
  //                TexImageSource source); // May throw DOMException
  //[Throws]
  //void texImage3D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
  //                GLsizei depth, GLint border, GLenum format, GLenum type, [AllowShared] ArrayBufferView? srcData);
  //[Throws]
  //void texImage3D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
  //                GLsizei depth, GLint border, GLenum format, GLenum type, [AllowShared] ArrayBufferView srcData,
  //                GLuint srcOffset);

  //[Throws]
  //void texSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset,
  //                   GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type,
  //                   GLintptr pboOffset);
  //[Throws]
  //void texSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset,
  //                   GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type,
  //                   TexImageSource source); // May throw DOMException
  //[Throws]
  //void texSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset,
  //                   GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type,
  //                   [AllowShared] ArrayBufferView? srcData, optional GLuint srcOffset = 0);

  //void copyTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset,
  //                       GLint x, GLint y, GLsizei width, GLsizei height);

  //void compressedTexImage3D(GLenum target, GLint level, GLenum internalformat, GLsizei width,
  //                          GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, GLintptr offset);
  //void compressedTexImage3D(GLenum target, GLint level, GLenum internalformat, GLsizei width,
  //                          GLsizei height, GLsizei depth, GLint border, [AllowShared] ArrayBufferView srcData,
  //                          optional GLuint srcOffset = 0, optional GLuint srcLengthOverride = 0);

  //void compressedTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
  //                             GLint zoffset, GLsizei width, GLsizei height, GLsizei depth,
  //                             GLenum format, GLsizei imageSize, GLintptr offset);
  //void compressedTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
  //                             GLint zoffset, GLsizei width, GLsizei height, GLsizei depth,
  //                             GLenum format, [AllowShared] ArrayBufferView srcData,
  //                             optional GLuint srcOffset = 0,
  //                             optional GLuint srcLengthOverride = 0);

  /* Programs and shaders */
  [WebGLHandlesContextLoss] GLint getFragDataLocation(WebGLProgram program, DOMString name);

  /* Uniforms */
  undefined uniform1ui(WebGLUniformLocation? location, GLuint v0);
  undefined uniform2ui(WebGLUniformLocation? location, GLuint v0, GLuint v1);
  undefined uniform3ui(WebGLUniformLocation? location, GLuint v0, GLuint v1, GLuint v2);
  undefined uniform4ui(WebGLUniformLocation? location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);

  undefined uniform1uiv(WebGLUniformLocation? location, Uint32List data, optional GLuint srcOffset = 0,
                   optional GLuint srcLength = 0);
  undefined uniform2uiv(WebGLUniformLocation? location, Uint32List data, optional GLuint srcOffset = 0,
                   optional GLuint srcLength = 0);
  undefined uniform3uiv(WebGLUniformLocation? location, Uint32List data, optional GLuint srcOffset = 0,
                   optional GLuint srcLength = 0);
  undefined uniform4uiv(WebGLUniformLocation? location, Uint32List data, optional GLuint srcOffset = 0,
                   optional GLuint srcLength = 0);

  undefined uniformMatrix3x2fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                          optional GLuint srcOffset = 0, optional GLuint srcLength = 0);
  undefined uniformMatrix4x2fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                          optional GLuint srcOffset = 0, optional GLuint srcLength = 0);

  undefined uniformMatrix2x3fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                          optional GLuint srcOffset = 0, optional GLuint srcLength = 0);
  undefined uniformMatrix4x3fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                          optional GLuint srcOffset = 0, optional GLuint srcLength = 0);

  undefined uniformMatrix2x4fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                          optional GLuint srcOffset = 0, optional GLuint srcLength = 0);
  undefined uniformMatrix3x4fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                          optional GLuint srcOffset = 0, optional GLuint srcLength = 0);

  /* Vertex attribs */
  undefined vertexAttribI4i(GLuint index, GLint x, GLint y, GLint z, GLint w);
  undefined vertexAttribI4iv(GLuint index, Int32List values);
  undefined vertexAttribI4ui(GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
  undefined vertexAttribI4uiv(GLuint index, Uint32List values);
  undefined vertexAttribIPointer(GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset);

  /* Writing to the drawing buffer */
  undefined vertexAttribDivisor(GLuint index, GLuint divisor);
  undefined drawArraysInstanced(GLenum mode, GLint first, GLsizei count, GLsizei instanceCount);
  undefined drawElementsInstanced(GLenum mode, GLsizei count, GLenum type, GLintptr offset, GLsizei instanceCount);
  undefined drawRangeElements(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, GLintptr offset);

  /* Multiple Render Targets */
  undefined drawBuffers(sequence<GLenum> buffers);

  undefined clearBufferfv(GLenum buffer, GLint drawbuffer, Float32List values,
                     optional GLuint srcOffset = 0);
  undefined clearBufferiv(GLenum buffer, GLint drawbuffer, Int32List values,
                     optional GLuint srcOffset = 0);
  undefined clearBufferuiv(GLenum buffer, GLint drawbuffer, Uint32List values,
                      optional GLuint srcOffset = 0);

  undefined clearBufferfi(GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil);

  /* Query Objects */
  WebGLQuery? createQuery();
  undefined deleteQuery(WebGLQuery? query);
  /*[WebGLHandlesContextLoss]*/ GLboolean isQuery(WebGLQuery? query);
  undefined beginQuery(GLenum target, WebGLQuery query);
  undefined endQuery(GLenum target);
  WebGLQuery? getQuery(GLenum target, GLenum pname);
  any getQueryParameter(WebGLQuery query, GLenum pname);

  /* Sampler Objects */
  WebGLSampler? createSampler();
  undefined deleteSampler(WebGLSampler? sampler);
  [WebGLHandlesContextLoss] GLboolean isSampler(WebGLSampler? sampler);
  undefined bindSampler(GLuint unit, WebGLSampler? sampler);
  undefined samplerParameteri(WebGLSampler sampler, GLenum pname, GLint param);
  undefined samplerParameterf(WebGLSampler sampler, GLenum pname, GLfloat param);
  any getSamplerParameter(WebGLSampler sampler, GLenum pname);

  /* Sync objects */
  WebGLSync? fenceSync(GLenum condition, GLbitfield flags);
  [WebGLHandlesContextLoss] GLboolean isSync(WebGLSync? sync);
  undefined deleteSync(WebGLSync? sync);
  GLenum clientWaitSync(WebGLSync sync, GLbitfield flags, GLuint64 timeout);
  undefined waitSync(WebGLSync sync, GLbitfield flags, GLint64 timeout);
  any getSyncParameter(WebGLSync sync, GLenum pname);

  /* Transform Feedback */
  WebGLTransformFeedback? createTransformFeedback();
  undefined deleteTransformFeedback(WebGLTransformFeedback? tf);
  [WebGLHandlesContextLoss] GLboolean isTransformFeedback(WebGLTransformFeedback? tf);
  undefined bindTransformFeedback (GLenum target, WebGLTransformFeedback? tf);
  undefined beginTransformFeedback(GLenum primitiveMode);
  undefined endTransformFeedback();
  undefined transformFeedbackVaryings(WebGLProgram program, sequence<DOMString> varyings, GLenum bufferMode);
  WebGLActiveInfo? getTransformFeedbackVarying(WebGLProgram program, GLuint index);
  undefined pauseTransformFeedback();
  undefined resumeTransformFeedback();

  /* Uniform Buffer Objects and Transform Feedback Buffers */
  undefined bindBufferBase(GLenum target, GLuint index, WebGLBuffer? buffer);
  undefined bindBufferRange(GLenum target, GLuint index, WebGLBuffer? buffer, GLintptr offset, GLsizeiptr size);
  any getIndexedParameter(GLenum target, GLuint index);
  sequence<GLuint>? getUniformIndices(WebGLProgram program, sequence<DOMString> uniformNames);
  any getActiveUniforms(WebGLProgram program, sequence<GLuint> uniformIndices, GLenum pname);
  GLuint getUniformBlockIndex(WebGLProgram program, DOMString uniformBlockName);
  any getActiveUniformBlockParameter(WebGLProgram program, GLuint uniformBlockIndex, GLenum pname);
  DOMString? getActiveUniformBlockName(WebGLProgram program, GLuint uniformBlockIndex);
  undefined uniformBlockBinding(WebGLProgram program, GLuint uniformBlockIndex, GLuint uniformBlockBinding);

  /* Vertex Array Objects */
  WebGLVertexArrayObject? createVertexArray();
  undefined deleteVertexArray(WebGLVertexArrayObject? vertexArray);
  [WebGLHandlesContextLoss] GLboolean isVertexArray(WebGLVertexArrayObject? vertexArray);
  undefined bindVertexArray(WebGLVertexArrayObject? array);
};

interface mixin WebGL2RenderingContextOverloads
{
  // WebGL1:
  undefined bufferData(GLenum target, GLsizeiptr size, GLenum usage);
  undefined bufferData(GLenum target, /*[AllowShared]*/ BufferSource? srcData, GLenum usage);
  undefined bufferSubData(GLenum target, GLintptr dstByteOffset, /*[AllowShared]*/ BufferSource srcData);
  // WebGL2:
  undefined bufferData(GLenum target, /*[AllowShared]*/ ArrayBufferView srcData, GLenum usage, GLuint srcOffset,
                  optional GLuint length = 0);
  undefined bufferSubData(GLenum target, GLintptr dstByteOffset, /*[AllowShared]*/ ArrayBufferView srcData,
                     GLuint srcOffset, optional GLuint length = 0);

  // WebGL1 legacy entrypoints:
  [Throws]
  undefined texImage2D(GLenum target, GLint level, GLint internalformat,
                  GLsizei width, GLsizei height, GLint border, GLenum format,
                  GLenum type, /*[AllowShared]*/ ArrayBufferView? pixels);
  [Throws]
  undefined texImage2D(GLenum target, GLint level, GLint internalformat,
                  GLenum format, GLenum type, TexImageSource source); // May throw DOMException

  [Throws]
  undefined texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                     GLsizei width, GLsizei height,
                     GLenum format, GLenum type, /*[AllowShared]*/ ArrayBufferView? pixels);
  [Throws]
  undefined texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                     GLenum format, GLenum type, TexImageSource source); // May throw DOMException

  // WebGL2 entrypoints:
  [Throws]
  undefined texImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
                  GLint border, GLenum format, GLenum type, GLintptr pboOffset);
  [Throws]
  undefined texImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
                  GLint border, GLenum format, GLenum type,
                  TexImageSource source); // May throw DOMException
  [Throws]
  undefined texImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
                  GLint border, GLenum format, GLenum type, /*[AllowShared]*/ ArrayBufferView srcData,
                  GLuint srcOffset);

  //[Throws]
  //void texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width,
  //                   GLsizei height, GLenum format, GLenum type, GLintptr pboOffset);
  //[Throws]
  //void texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width,
  //                   GLsizei height, GLenum format, GLenum type,
  //                   TexImageSource source); // May throw DOMException
  //[Throws]
  //void texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width,
  //                   GLsizei height, GLenum format, GLenum type, /*[AllowShared]*/ ArrayBufferView srcData,
  //                   GLuint srcOffset);

  //void compressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width,
  //                          GLsizei height, GLint border, GLsizei imageSize, GLintptr offset);
  undefined compressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width,
                            GLsizei height, GLint border, /*[AllowShared]*/ ArrayBufferView srcData,
                            optional GLuint srcOffset = 0, optional GLuint srcLengthOverride = 0);

  //void compressedTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
  //                             GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, GLintptr offset);
  undefined compressedTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                               GLsizei width, GLsizei height, GLenum format,
                               /*[AllowShared]*/ ArrayBufferView srcData,
                               optional GLuint srcOffset = 0,
                               optional GLuint srcLengthOverride = 0);

  undefined uniform1fv(WebGLUniformLocation? location, Float32List data, optional GLuint srcOffset = 0,
                  optional GLuint srcLength = 0);
  undefined uniform2fv(WebGLUniformLocation? location, Float32List data, optional GLuint srcOffset = 0,
                  optional GLuint srcLength = 0);
  undefined uniform3fv(WebGLUniformLocation? location, Float32List data, optional GLuint srcOffset = 0,
                  optional GLuint srcLength = 0);
  undefined uniform4fv(WebGLUniformLocation? location, Float32List data, optional GLuint srcOffset = 0,
                  optional GLuint srcLength = 0);

  undefined uniform1iv(WebGLUniformLocation? location, Int32List data, optional GLuint srcOffset = 0,
                  optional GLuint srcLength = 0);
  undefined uniform2iv(WebGLUniformLocation? location, Int32List data, optional GLuint srcOffset = 0,
                  optional GLuint srcLength = 0);
  undefined uniform3iv(WebGLUniformLocation? location, Int32List data, optional GLuint srcOffset = 0,
                  optional GLuint srcLength = 0);
  undefined uniform4iv(WebGLUniformLocation? location, Int32List data, optional GLuint srcOffset = 0,
                  optional GLuint srcLength = 0);

  undefined uniformMatrix2fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                        optional GLuint srcOffset = 0, optional GLuint srcLength = 0);
  undefined uniformMatrix3fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                        optional GLuint srcOffset = 0, optional GLuint srcLength = 0);
  undefined uniformMatrix4fv(WebGLUniformLocation? location, GLboolean transpose, Float32List data,
                        optional GLuint srcOffset = 0, optional GLuint srcLength = 0);

  /* Reading back pixels */
  // WebGL1:
  undefined readPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type,
                  /*[AllowShared]*/ ArrayBufferView? dstData);
  // WebGL2:
  undefined readPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type,
                  GLintptr offset);
  undefined readPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type,
                  /*[AllowShared]*/ ArrayBufferView dstData, GLuint dstOffset);
};

[Exposed=Window, Func="WebGL2RenderingContext::is_webgl2_enabled"]
interface WebGL2RenderingContext
{
};
WebGL2RenderingContext includes WebGLRenderingContextBase;
WebGL2RenderingContext includes WebGL2RenderingContextBase;
WebGL2RenderingContext includes WebGL2RenderingContextOverloads;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.7
//

[Exposed=Window]
interface WebGLActiveInfo {
    readonly attribute GLint size;
    readonly attribute GLenum type;
    readonly attribute DOMString name;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.4
//

[Exposed=Window]
interface WebGLBuffer : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.15
[Exposed=Window]
interface WebGLContextEvent : Event {
    [Throws] constructor(DOMString type, optional WebGLContextEventInit eventInit = {});
    readonly attribute DOMString statusMessage;
};

// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.15
dictionary WebGLContextEventInit : EventInit {
    DOMString statusMessage;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.7
//

[Exposed=Window]
interface WebGLFramebuffer : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.3
//

[Abstract, Exposed=Window]
interface WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.6
//

[Exposed=Window]
interface WebGLProgram : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.8
//

[Exposed=Window, Pref="dom.webgl2.enabled"]
interface WebGLQuery : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.5
//

[Exposed=Window]
interface WebGLRenderbuffer : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/
//
// This IDL depends on the typed array specification defined at:
// https://www.khronos.org/registry/typedarray/specs/latest/typedarrays.idl

typedef unsigned long  GLenum;
typedef boolean        GLboolean;
typedef unsigned long  GLbitfield;
typedef byte           GLbyte;         /* 'byte' should be a signed 8 bit type. */
typedef short          GLshort;
typedef long           GLint;
typedef long           GLsizei;
typedef long long      GLintptr;
typedef long long      GLsizeiptr;
// Ideally the typedef below would use 'unsigned byte', but that doesn't currently exist in Web IDL.
typedef octet          GLubyte;        /* 'octet' should be an unsigned 8 bit type. */
typedef unsigned short GLushort;
typedef unsigned long  GLuint;
typedef unrestricted float GLfloat;
typedef unrestricted float GLclampf;

typedef (ImageData or
         HTMLImageElement or
         HTMLCanvasElement or
         HTMLVideoElement) TexImageSource;

typedef (/*[AllowShared]*/ Float32Array or sequence<GLfloat>) Float32List;
typedef (/*[AllowShared]*/ Int32Array or sequence<GLint>) Int32List;

dictionary WebGLContextAttributes {
    GLboolean alpha = true;
    GLboolean depth = true;
    GLboolean stencil = false;
    GLboolean antialias = true;
    GLboolean premultipliedAlpha = true;
    GLboolean preserveDrawingBuffer = false;
    GLboolean preferLowPowerToHighPerformance = false;
    GLboolean failIfMajorPerformanceCaveat = false;
};

[Exposed=Window]
interface mixin WebGLRenderingContextBase
{

    /* ClearBufferMask */
    const GLenum DEPTH_BUFFER_BIT               = 0x00000100;
    const GLenum STENCIL_BUFFER_BIT             = 0x00000400;
    const GLenum COLOR_BUFFER_BIT               = 0x00004000;

    /* BeginMode */
    const GLenum POINTS                         = 0x0000;
    const GLenum LINES                          = 0x0001;
    const GLenum LINE_LOOP                      = 0x0002;
    const GLenum LINE_STRIP                     = 0x0003;
    const GLenum TRIANGLES                      = 0x0004;
    const GLenum TRIANGLE_STRIP                 = 0x0005;
    const GLenum TRIANGLE_FAN                   = 0x0006;

    /* AlphaFunction (not supported in ES20) */
    /*      NEVER */
    /*      LESS */
    /*      EQUAL */
    /*      LEQUAL */
    /*      GREATER */
    /*      NOTEQUAL */
    /*      GEQUAL */
    /*      ALWAYS */

    /* BlendingFactorDest */
    const GLenum ZERO                           = 0;
    const GLenum ONE                            = 1;
    const GLenum SRC_COLOR                      = 0x0300;
    const GLenum ONE_MINUS_SRC_COLOR            = 0x0301;
    const GLenum SRC_ALPHA                      = 0x0302;
    const GLenum ONE_MINUS_SRC_ALPHA            = 0x0303;
    const GLenum DST_ALPHA                      = 0x0304;
    const GLenum ONE_MINUS_DST_ALPHA            = 0x0305;

    /* BlendingFactorSrc */
    /*      ZERO */
    /*      ONE */
    const GLenum DST_COLOR                      = 0x0306;
    const GLenum ONE_MINUS_DST_COLOR            = 0x0307;
    const GLenum SRC_ALPHA_SATURATE             = 0x0308;
    /*      SRC_ALPHA */
    /*      ONE_MINUS_SRC_ALPHA */
    /*      DST_ALPHA */
    /*      ONE_MINUS_DST_ALPHA */

    /* BlendEquationSeparate */
    const GLenum FUNC_ADD                       = 0x8006;
    const GLenum BLEND_EQUATION                 = 0x8009;
    const GLenum BLEND_EQUATION_RGB             = 0x8009;   /* same as BLEND_EQUATION */
    const GLenum BLEND_EQUATION_ALPHA           = 0x883D;

    /* BlendSubtract */
    const GLenum FUNC_SUBTRACT                  = 0x800A;
    const GLenum FUNC_REVERSE_SUBTRACT          = 0x800B;

    /* Separate Blend Functions */
    const GLenum BLEND_DST_RGB                  = 0x80C8;
    const GLenum BLEND_SRC_RGB                  = 0x80C9;
    const GLenum BLEND_DST_ALPHA                = 0x80CA;
    const GLenum BLEND_SRC_ALPHA                = 0x80CB;
    const GLenum CONSTANT_COLOR                 = 0x8001;
    const GLenum ONE_MINUS_CONSTANT_COLOR       = 0x8002;
    const GLenum CONSTANT_ALPHA                 = 0x8003;
    const GLenum ONE_MINUS_CONSTANT_ALPHA       = 0x8004;
    const GLenum BLEND_COLOR                    = 0x8005;

    /* Buffer Objects */
    const GLenum ARRAY_BUFFER                   = 0x8892;
    const GLenum ELEMENT_ARRAY_BUFFER           = 0x8893;
    const GLenum ARRAY_BUFFER_BINDING           = 0x8894;
    const GLenum ELEMENT_ARRAY_BUFFER_BINDING   = 0x8895;

    const GLenum STREAM_DRAW                    = 0x88E0;
    const GLenum STATIC_DRAW                    = 0x88E4;
    const GLenum DYNAMIC_DRAW                   = 0x88E8;

    const GLenum BUFFER_SIZE                    = 0x8764;
    const GLenum BUFFER_USAGE                   = 0x8765;

    const GLenum CURRENT_VERTEX_ATTRIB          = 0x8626;

    /* CullFaceMode */
    const GLenum FRONT                          = 0x0404;
    const GLenum BACK                           = 0x0405;
    const GLenum FRONT_AND_BACK                 = 0x0408;

    /* DepthFunction */
    /*      NEVER */
    /*      LESS */
    /*      EQUAL */
    /*      LEQUAL */
    /*      GREATER */
    /*      NOTEQUAL */
    /*      GEQUAL */
    /*      ALWAYS */

    /* EnableCap */
    /* TEXTURE_2D */
    const GLenum CULL_FACE                      = 0x0B44;
    const GLenum BLEND                          = 0x0BE2;
    const GLenum DITHER                         = 0x0BD0;
    const GLenum STENCIL_TEST                   = 0x0B90;
    const GLenum DEPTH_TEST                     = 0x0B71;
    const GLenum SCISSOR_TEST                   = 0x0C11;
    const GLenum POLYGON_OFFSET_FILL            = 0x8037;
    const GLenum SAMPLE_ALPHA_TO_COVERAGE       = 0x809E;
    const GLenum SAMPLE_COVERAGE                = 0x80A0;

    /* ErrorCode */
    const GLenum NO_ERROR                       = 0;
    const GLenum INVALID_ENUM                   = 0x0500;
    const GLenum INVALID_VALUE                  = 0x0501;
    const GLenum INVALID_OPERATION              = 0x0502;
    const GLenum OUT_OF_MEMORY                  = 0x0505;

    /* FrontFaceDirection */
    const GLenum CW                             = 0x0900;
    const GLenum CCW                            = 0x0901;

    /* GetPName */
    const GLenum LINE_WIDTH                     = 0x0B21;
    const GLenum ALIASED_POINT_SIZE_RANGE       = 0x846D;
    const GLenum ALIASED_LINE_WIDTH_RANGE       = 0x846E;
    const GLenum CULL_FACE_MODE                 = 0x0B45;
    const GLenum FRONT_FACE                     = 0x0B46;
    const GLenum DEPTH_RANGE                    = 0x0B70;
    const GLenum DEPTH_WRITEMASK                = 0x0B72;
    const GLenum DEPTH_CLEAR_VALUE              = 0x0B73;
    const GLenum DEPTH_FUNC                     = 0x0B74;
    const GLenum STENCIL_CLEAR_VALUE            = 0x0B91;
    const GLenum STENCIL_FUNC                   = 0x0B92;
    const GLenum STENCIL_FAIL                   = 0x0B94;
    const GLenum STENCIL_PASS_DEPTH_FAIL        = 0x0B95;
    const GLenum STENCIL_PASS_DEPTH_PASS        = 0x0B96;
    const GLenum STENCIL_REF                    = 0x0B97;
    const GLenum STENCIL_VALUE_MASK             = 0x0B93;
    const GLenum STENCIL_WRITEMASK              = 0x0B98;
    const GLenum STENCIL_BACK_FUNC              = 0x8800;
    const GLenum STENCIL_BACK_FAIL              = 0x8801;
    const GLenum STENCIL_BACK_PASS_DEPTH_FAIL   = 0x8802;
    const GLenum STENCIL_BACK_PASS_DEPTH_PASS   = 0x8803;
    const GLenum STENCIL_BACK_REF               = 0x8CA3;
    const GLenum STENCIL_BACK_VALUE_MASK        = 0x8CA4;
    const GLenum STENCIL_BACK_WRITEMASK         = 0x8CA5;
    const GLenum VIEWPORT                       = 0x0BA2;
    const GLenum SCISSOR_BOX                    = 0x0C10;
    /*      SCISSOR_TEST */
    const GLenum COLOR_CLEAR_VALUE              = 0x0C22;
    const GLenum COLOR_WRITEMASK                = 0x0C23;
    const GLenum UNPACK_ALIGNMENT               = 0x0CF5;
    const GLenum PACK_ALIGNMENT                 = 0x0D05;
    const GLenum MAX_TEXTURE_SIZE               = 0x0D33;
    const GLenum MAX_VIEWPORT_DIMS              = 0x0D3A;
    const GLenum SUBPIXEL_BITS                  = 0x0D50;
    const GLenum RED_BITS                       = 0x0D52;
    const GLenum GREEN_BITS                     = 0x0D53;
    const GLenum BLUE_BITS                      = 0x0D54;
    const GLenum ALPHA_BITS                     = 0x0D55;
    const GLenum DEPTH_BITS                     = 0x0D56;
    const GLenum STENCIL_BITS                   = 0x0D57;
    const GLenum POLYGON_OFFSET_UNITS           = 0x2A00;
    /*      POLYGON_OFFSET_FILL */
    const GLenum POLYGON_OFFSET_FACTOR          = 0x8038;
    const GLenum TEXTURE_BINDING_2D             = 0x8069;
    const GLenum SAMPLE_BUFFERS                 = 0x80A8;
    const GLenum SAMPLES                        = 0x80A9;
    const GLenum SAMPLE_COVERAGE_VALUE          = 0x80AA;
    const GLenum SAMPLE_COVERAGE_INVERT         = 0x80AB;

    /* GetTextureParameter */
    /*      TEXTURE_MAG_FILTER */
    /*      TEXTURE_MIN_FILTER */
    /*      TEXTURE_WRAP_S */
    /*      TEXTURE_WRAP_T */

    const GLenum COMPRESSED_TEXTURE_FORMATS     = 0x86A3;

    /* HintMode */
    const GLenum DONT_CARE                      = 0x1100;
    const GLenum FASTEST                        = 0x1101;
    const GLenum NICEST                         = 0x1102;

    /* HintTarget */
    const GLenum GENERATE_MIPMAP_HINT            = 0x8192;

    /* DataType */
    const GLenum BYTE                           = 0x1400;
    const GLenum UNSIGNED_BYTE                  = 0x1401;
    const GLenum SHORT                          = 0x1402;
    const GLenum UNSIGNED_SHORT                 = 0x1403;
    const GLenum INT                            = 0x1404;
    const GLenum UNSIGNED_INT                   = 0x1405;
    const GLenum FLOAT                          = 0x1406;

    /* PixelFormat */
    const GLenum DEPTH_COMPONENT                = 0x1902;
    const GLenum ALPHA                          = 0x1906;
    const GLenum RGB                            = 0x1907;
    const GLenum RGBA                           = 0x1908;
    const GLenum LUMINANCE                      = 0x1909;
    const GLenum LUMINANCE_ALPHA                = 0x190A;

    /* PixelType */
    /*      UNSIGNED_BYTE */
    const GLenum UNSIGNED_SHORT_4_4_4_4         = 0x8033;
    const GLenum UNSIGNED_SHORT_5_5_5_1         = 0x8034;
    const GLenum UNSIGNED_SHORT_5_6_5           = 0x8363;

    /* Shaders */
    const GLenum FRAGMENT_SHADER                  = 0x8B30;
    const GLenum VERTEX_SHADER                    = 0x8B31;
    const GLenum MAX_VERTEX_ATTRIBS               = 0x8869;
    const GLenum MAX_VERTEX_UNIFORM_VECTORS       = 0x8DFB;
    const GLenum MAX_VARYING_VECTORS              = 0x8DFC;
    const GLenum MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
    const GLenum MAX_VERTEX_TEXTURE_IMAGE_UNITS   = 0x8B4C;
    const GLenum MAX_TEXTURE_IMAGE_UNITS          = 0x8872;
    const GLenum MAX_FRAGMENT_UNIFORM_VECTORS     = 0x8DFD;
    const GLenum SHADER_TYPE                      = 0x8B4F;
    const GLenum DELETE_STATUS                    = 0x8B80;
    const GLenum LINK_STATUS                      = 0x8B82;
    const GLenum VALIDATE_STATUS                  = 0x8B83;
    const GLenum ATTACHED_SHADERS                 = 0x8B85;
    const GLenum ACTIVE_UNIFORMS                  = 0x8B86;
    const GLenum ACTIVE_ATTRIBUTES                = 0x8B89;
    const GLenum SHADING_LANGUAGE_VERSION         = 0x8B8C;
    const GLenum CURRENT_PROGRAM                  = 0x8B8D;

    /* StencilFunction */
    const GLenum NEVER                          = 0x0200;
    const GLenum LESS                           = 0x0201;
    const GLenum EQUAL                          = 0x0202;
    const GLenum LEQUAL                         = 0x0203;
    const GLenum GREATER                        = 0x0204;
    const GLenum NOTEQUAL                       = 0x0205;
    const GLenum GEQUAL                         = 0x0206;
    const GLenum ALWAYS                         = 0x0207;

    /* StencilOp */
    /*      ZERO */
    const GLenum KEEP                           = 0x1E00;
    const GLenum REPLACE                        = 0x1E01;
    const GLenum INCR                           = 0x1E02;
    const GLenum DECR                           = 0x1E03;
    const GLenum INVERT                         = 0x150A;
    const GLenum INCR_WRAP                      = 0x8507;
    const GLenum DECR_WRAP                      = 0x8508;

    /* StringName */
    const GLenum VENDOR                         = 0x1F00;
    const GLenum RENDERER                       = 0x1F01;
    const GLenum VERSION                        = 0x1F02;

    /* TextureMagFilter */
    const GLenum NEAREST                        = 0x2600;
    const GLenum LINEAR                         = 0x2601;

    /* TextureMinFilter */
    /*      NEAREST */
    /*      LINEAR */
    const GLenum NEAREST_MIPMAP_NEAREST         = 0x2700;
    const GLenum LINEAR_MIPMAP_NEAREST          = 0x2701;
    const GLenum NEAREST_MIPMAP_LINEAR          = 0x2702;
    const GLenum LINEAR_MIPMAP_LINEAR           = 0x2703;

    /* TextureParameterName */
    const GLenum TEXTURE_MAG_FILTER             = 0x2800;
    const GLenum TEXTURE_MIN_FILTER             = 0x2801;
    const GLenum TEXTURE_WRAP_S                 = 0x2802;
    const GLenum TEXTURE_WRAP_T                 = 0x2803;

    /* TextureTarget */
    const GLenum TEXTURE_2D                     = 0x0DE1;
    const GLenum TEXTURE                        = 0x1702;

    const GLenum TEXTURE_CUBE_MAP               = 0x8513;
    const GLenum TEXTURE_BINDING_CUBE_MAP       = 0x8514;
    const GLenum TEXTURE_CUBE_MAP_POSITIVE_X    = 0x8515;
    const GLenum TEXTURE_CUBE_MAP_NEGATIVE_X    = 0x8516;
    const GLenum TEXTURE_CUBE_MAP_POSITIVE_Y    = 0x8517;
    const GLenum TEXTURE_CUBE_MAP_NEGATIVE_Y    = 0x8518;
    const GLenum TEXTURE_CUBE_MAP_POSITIVE_Z    = 0x8519;
    const GLenum TEXTURE_CUBE_MAP_NEGATIVE_Z    = 0x851A;
    const GLenum MAX_CUBE_MAP_TEXTURE_SIZE      = 0x851C;

    /* TextureUnit */
    const GLenum TEXTURE0                       = 0x84C0;
    const GLenum TEXTURE1                       = 0x84C1;
    const GLenum TEXTURE2                       = 0x84C2;
    const GLenum TEXTURE3                       = 0x84C3;
    const GLenum TEXTURE4                       = 0x84C4;
    const GLenum TEXTURE5                       = 0x84C5;
    const GLenum TEXTURE6                       = 0x84C6;
    const GLenum TEXTURE7                       = 0x84C7;
    const GLenum TEXTURE8                       = 0x84C8;
    const GLenum TEXTURE9                       = 0x84C9;
    const GLenum TEXTURE10                      = 0x84CA;
    const GLenum TEXTURE11                      = 0x84CB;
    const GLenum TEXTURE12                      = 0x84CC;
    const GLenum TEXTURE13                      = 0x84CD;
    const GLenum TEXTURE14                      = 0x84CE;
    const GLenum TEXTURE15                      = 0x84CF;
    const GLenum TEXTURE16                      = 0x84D0;
    const GLenum TEXTURE17                      = 0x84D1;
    const GLenum TEXTURE18                      = 0x84D2;
    const GLenum TEXTURE19                      = 0x84D3;
    const GLenum TEXTURE20                      = 0x84D4;
    const GLenum TEXTURE21                      = 0x84D5;
    const GLenum TEXTURE22                      = 0x84D6;
    const GLenum TEXTURE23                      = 0x84D7;
    const GLenum TEXTURE24                      = 0x84D8;
    const GLenum TEXTURE25                      = 0x84D9;
    const GLenum TEXTURE26                      = 0x84DA;
    const GLenum TEXTURE27                      = 0x84DB;
    const GLenum TEXTURE28                      = 0x84DC;
    const GLenum TEXTURE29                      = 0x84DD;
    const GLenum TEXTURE30                      = 0x84DE;
    const GLenum TEXTURE31                      = 0x84DF;
    const GLenum ACTIVE_TEXTURE                 = 0x84E0;

    /* TextureWrapMode */
    const GLenum REPEAT                         = 0x2901;
    const GLenum CLAMP_TO_EDGE                  = 0x812F;
    const GLenum MIRRORED_REPEAT                = 0x8370;

    /* Uniform Types */
    const GLenum FLOAT_VEC2                     = 0x8B50;
    const GLenum FLOAT_VEC3                     = 0x8B51;
    const GLenum FLOAT_VEC4                     = 0x8B52;
    const GLenum INT_VEC2                       = 0x8B53;
    const GLenum INT_VEC3                       = 0x8B54;
    const GLenum INT_VEC4                       = 0x8B55;
    const GLenum BOOL                           = 0x8B56;
    const GLenum BOOL_VEC2                      = 0x8B57;
    const GLenum BOOL_VEC3                      = 0x8B58;
    const GLenum BOOL_VEC4                      = 0x8B59;
    const GLenum FLOAT_MAT2                     = 0x8B5A;
    const GLenum FLOAT_MAT3                     = 0x8B5B;
    const GLenum FLOAT_MAT4                     = 0x8B5C;
    const GLenum SAMPLER_2D                     = 0x8B5E;
    const GLenum SAMPLER_CUBE                   = 0x8B60;

    /* Vertex Arrays */
    const GLenum VERTEX_ATTRIB_ARRAY_ENABLED        = 0x8622;
    const GLenum VERTEX_ATTRIB_ARRAY_SIZE           = 0x8623;
    const GLenum VERTEX_ATTRIB_ARRAY_STRIDE         = 0x8624;
    const GLenum VERTEX_ATTRIB_ARRAY_TYPE           = 0x8625;
    const GLenum VERTEX_ATTRIB_ARRAY_NORMALIZED     = 0x886A;
    const GLenum VERTEX_ATTRIB_ARRAY_POINTER        = 0x8645;
    const GLenum VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;

    /* Read Format */
    const GLenum IMPLEMENTATION_COLOR_READ_TYPE   = 0x8B9A;
    const GLenum IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;

    /* Shader Source */
    const GLenum COMPILE_STATUS                 = 0x8B81;

    /* Shader Precision-Specified Types */
    const GLenum LOW_FLOAT                      = 0x8DF0;
    const GLenum MEDIUM_FLOAT                   = 0x8DF1;
    const GLenum HIGH_FLOAT                     = 0x8DF2;
    const GLenum LOW_INT                        = 0x8DF3;
    const GLenum MEDIUM_INT                     = 0x8DF4;
    const GLenum HIGH_INT                       = 0x8DF5;

    /* Framebuffer Object. */
    const GLenum FRAMEBUFFER                    = 0x8D40;
    const GLenum RENDERBUFFER                   = 0x8D41;

    const GLenum RGBA4                          = 0x8056;
    const GLenum RGB5_A1                        = 0x8057;
    const GLenum RGB565                         = 0x8D62;
    const GLenum DEPTH_COMPONENT16              = 0x81A5;
    const GLenum STENCIL_INDEX8                 = 0x8D48;
    const GLenum DEPTH_STENCIL                  = 0x84F9;

    const GLenum RENDERBUFFER_WIDTH             = 0x8D42;
    const GLenum RENDERBUFFER_HEIGHT            = 0x8D43;
    const GLenum RENDERBUFFER_INTERNAL_FORMAT   = 0x8D44;
    const GLenum RENDERBUFFER_RED_SIZE          = 0x8D50;
    const GLenum RENDERBUFFER_GREEN_SIZE        = 0x8D51;
    const GLenum RENDERBUFFER_BLUE_SIZE         = 0x8D52;
    const GLenum RENDERBUFFER_ALPHA_SIZE        = 0x8D53;
    const GLenum RENDERBUFFER_DEPTH_SIZE        = 0x8D54;
    const GLenum RENDERBUFFER_STENCIL_SIZE      = 0x8D55;

    const GLenum FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE           = 0x8CD0;
    const GLenum FRAMEBUFFER_ATTACHMENT_OBJECT_NAME           = 0x8CD1;
    const GLenum FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL         = 0x8CD2;
    const GLenum FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;

    const GLenum COLOR_ATTACHMENT0              = 0x8CE0;
    const GLenum DEPTH_ATTACHMENT               = 0x8D00;
    const GLenum STENCIL_ATTACHMENT             = 0x8D20;
    const GLenum DEPTH_STENCIL_ATTACHMENT       = 0x821A;

    const GLenum NONE                           = 0;

    const GLenum FRAMEBUFFER_COMPLETE                      = 0x8CD5;
    const GLenum FRAMEBUFFER_INCOMPLETE_ATTACHMENT         = 0x8CD6;
    const GLenum FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
    const GLenum FRAMEBUFFER_INCOMPLETE_DIMENSIONS         = 0x8CD9;
    const GLenum FRAMEBUFFER_UNSUPPORTED                   = 0x8CDD;

    const GLenum FRAMEBUFFER_BINDING            = 0x8CA6;
    const GLenum RENDERBUFFER_BINDING           = 0x8CA7;
    const GLenum MAX_RENDERBUFFER_SIZE          = 0x84E8;

    const GLenum INVALID_FRAMEBUFFER_OPERATION  = 0x0506;

    /* WebGL-specific enums */
    const GLenum UNPACK_FLIP_Y_WEBGL            = 0x9240;
    const GLenum UNPACK_PREMULTIPLY_ALPHA_WEBGL = 0x9241;
    const GLenum CONTEXT_LOST_WEBGL             = 0x9242;
    const GLenum UNPACK_COLORSPACE_CONVERSION_WEBGL = 0x9243;
    const GLenum BROWSER_DEFAULT_WEBGL          = 0x9244;

    readonly attribute HTMLCanvasElement canvas;
    readonly attribute GLsizei drawingBufferWidth;
    readonly attribute GLsizei drawingBufferHeight;

    [WebGLHandlesContextLoss] WebGLContextAttributes? getContextAttributes();
    [WebGLHandlesContextLoss] boolean isContextLost();

    sequence<DOMString>? getSupportedExtensions();
    object? getExtension(DOMString name);

    undefined activeTexture(GLenum texture);
    undefined attachShader(WebGLProgram program, WebGLShader shader);
    undefined bindAttribLocation(WebGLProgram program, GLuint index, DOMString name);
    undefined bindBuffer(GLenum target, WebGLBuffer? buffer);
    undefined bindFramebuffer(GLenum target, WebGLFramebuffer? framebuffer);
    undefined bindRenderbuffer(GLenum target, WebGLRenderbuffer? renderbuffer);
    undefined bindTexture(GLenum target, WebGLTexture? texture);
    undefined blendColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
    undefined blendEquation(GLenum mode);
    undefined blendEquationSeparate(GLenum modeRGB, GLenum modeAlpha);
    undefined blendFunc(GLenum sfactor, GLenum dfactor);
    undefined blendFuncSeparate(GLenum srcRGB, GLenum dstRGB,
                           GLenum srcAlpha, GLenum dstAlpha);

    [WebGLHandlesContextLoss] GLenum checkFramebufferStatus(GLenum target);
    undefined clear(GLbitfield mask);
    undefined clearColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
    undefined clearDepth(GLclampf depth);
    undefined clearStencil(GLint s);
    undefined colorMask(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
    undefined compileShader(WebGLShader shader);

    undefined copyTexImage2D(GLenum target, GLint level, GLenum internalformat,
                        GLint x, GLint y, GLsizei width, GLsizei height,
                        GLint border);
    undefined copyTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                           GLint x, GLint y, GLsizei width, GLsizei height);

    WebGLBuffer? createBuffer();
    WebGLFramebuffer? createFramebuffer();
    WebGLProgram? createProgram();
    WebGLRenderbuffer? createRenderbuffer();
    WebGLShader? createShader(GLenum type);
    WebGLTexture? createTexture();

    undefined cullFace(GLenum mode);

    undefined deleteBuffer(WebGLBuffer? buffer);
    undefined deleteFramebuffer(WebGLFramebuffer? framebuffer);
    undefined deleteProgram(WebGLProgram? program);
    undefined deleteRenderbuffer(WebGLRenderbuffer? renderbuffer);
    undefined deleteShader(WebGLShader? shader);
    undefined deleteTexture(WebGLTexture? texture);

    undefined depthFunc(GLenum func);
    undefined depthMask(GLboolean flag);
    undefined depthRange(GLclampf zNear, GLclampf zFar);
    undefined detachShader(WebGLProgram program, WebGLShader shader);
    undefined disable(GLenum cap);
    undefined disableVertexAttribArray(GLuint index);
    undefined drawArrays(GLenum mode, GLint first, GLsizei count);
    undefined drawElements(GLenum mode, GLsizei count, GLenum type, GLintptr offset);

    undefined enable(GLenum cap);
    undefined enableVertexAttribArray(GLuint index);
    undefined finish();
    undefined flush();
    undefined framebufferRenderbuffer(GLenum target, GLenum attachment,
                                 GLenum renderbuffertarget,
                                 WebGLRenderbuffer? renderbuffer);
    undefined framebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget,
                              WebGLTexture? texture, GLint level);
    undefined frontFace(GLenum mode);

    undefined generateMipmap(GLenum target);

    WebGLActiveInfo? getActiveAttrib(WebGLProgram program, GLuint index);
    WebGLActiveInfo? getActiveUniform(WebGLProgram program, GLuint index);
    sequence<WebGLShader>? getAttachedShaders(WebGLProgram program);

    [WebGLHandlesContextLoss] GLint getAttribLocation(WebGLProgram program, DOMString name);

    any getBufferParameter(GLenum target, GLenum pname);
    any getParameter(GLenum pname);

    [WebGLHandlesContextLoss] GLenum getError();

    any getFramebufferAttachmentParameter(GLenum target, GLenum attachment,
                                          GLenum pname);
    any getProgramParameter(WebGLProgram program, GLenum pname);
    DOMString? getProgramInfoLog(WebGLProgram program);
    any getRenderbufferParameter(GLenum target, GLenum pname);
    any getShaderParameter(WebGLShader shader, GLenum pname);
    WebGLShaderPrecisionFormat? getShaderPrecisionFormat(GLenum shadertype, GLenum precisiontype);
    DOMString? getShaderInfoLog(WebGLShader shader);

    DOMString? getShaderSource(WebGLShader shader);

    any getTexParameter(GLenum target, GLenum pname);

    any getUniform(WebGLProgram program, WebGLUniformLocation location);

    WebGLUniformLocation? getUniformLocation(WebGLProgram program, DOMString name);

    any getVertexAttrib(GLuint index, GLenum pname);

    [WebGLHandlesContextLoss] GLsizeiptr getVertexAttribOffset(GLuint index, GLenum pname);

    undefined hint(GLenum target, GLenum mode);
    [WebGLHandlesContextLoss] GLboolean isBuffer(WebGLBuffer? buffer);
    [WebGLHandlesContextLoss] GLboolean isEnabled(GLenum cap);
    [WebGLHandlesContextLoss] GLboolean isFramebuffer(WebGLFramebuffer? framebuffer);
    [WebGLHandlesContextLoss] GLboolean isProgram(WebGLProgram? program);
    [WebGLHandlesContextLoss] GLboolean isRenderbuffer(WebGLRenderbuffer? renderbuffer);
    [WebGLHandlesContextLoss] GLboolean isShader(WebGLShader? shader);
    [WebGLHandlesContextLoss] GLboolean isTexture(WebGLTexture? texture);
    undefined lineWidth(GLfloat width);
    undefined linkProgram(WebGLProgram program);
    undefined pixelStorei(GLenum pname, GLint param);
    undefined polygonOffset(GLfloat factor, GLfloat units);

    undefined renderbufferStorage(GLenum target, GLenum internalformat,
                             GLsizei width, GLsizei height);
    undefined sampleCoverage(GLclampf value, GLboolean invert);
    undefined scissor(GLint x, GLint y, GLsizei width, GLsizei height);

    undefined shaderSource(WebGLShader shader, DOMString source);

    undefined stencilFunc(GLenum func, GLint ref, GLuint mask);
    undefined stencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask);
    undefined stencilMask(GLuint mask);
    undefined stencilMaskSeparate(GLenum face, GLuint mask);
    undefined stencilOp(GLenum fail, GLenum zfail, GLenum zpass);
    undefined stencilOpSeparate(GLenum face, GLenum fail, GLenum zfail, GLenum zpass);

    undefined texParameterf(GLenum target, GLenum pname, GLfloat param);
    undefined texParameteri(GLenum target, GLenum pname, GLint param);

    undefined uniform1f(WebGLUniformLocation? location, GLfloat x);
    undefined uniform2f(WebGLUniformLocation? location, GLfloat x, GLfloat y);
    undefined uniform3f(WebGLUniformLocation? location, GLfloat x, GLfloat y, GLfloat z);
    undefined uniform4f(WebGLUniformLocation? location, GLfloat x, GLfloat y, GLfloat z, GLfloat w);

    undefined uniform1i(WebGLUniformLocation? location, GLint x);
    undefined uniform2i(WebGLUniformLocation? location, GLint x, GLint y);
    undefined uniform3i(WebGLUniformLocation? location, GLint x, GLint y, GLint z);
    undefined uniform4i(WebGLUniformLocation? location, GLint x, GLint y, GLint z, GLint w);

    undefined useProgram(WebGLProgram? program);
    undefined validateProgram(WebGLProgram program);

    undefined vertexAttrib1f(GLuint indx, GLfloat x);
    undefined vertexAttrib2f(GLuint indx, GLfloat x, GLfloat y);
    undefined vertexAttrib3f(GLuint indx, GLfloat x, GLfloat y, GLfloat z);
    undefined vertexAttrib4f(GLuint indx, GLfloat x, GLfloat y, GLfloat z, GLfloat w);

    undefined vertexAttrib1fv(GLuint indx, Float32List values);
    undefined vertexAttrib2fv(GLuint indx, Float32List values);
    undefined vertexAttrib3fv(GLuint indx, Float32List values);
    undefined vertexAttrib4fv(GLuint indx, Float32List values);

    undefined vertexAttribPointer(GLuint indx, GLint size, GLenum type,
                             GLboolean normalized, GLsizei stride, GLintptr offset);

    undefined viewport(GLint x, GLint y, GLsizei width, GLsizei height);
};

interface mixin WebGLRenderingContextOverloads
{
    undefined bufferData(GLenum target, GLsizeiptr size, GLenum usage);
    undefined bufferData(GLenum target, /*[AllowShared]*/ BufferSource? data, GLenum usage);
    undefined bufferSubData(GLenum target, GLintptr offset, /*[AllowShared]*/ BufferSource data);

    undefined compressedTexImage2D(GLenum target, GLint level, GLenum internalformat,
                              GLsizei width, GLsizei height, GLint border,
                              /*[AllowShared]*/ ArrayBufferView data);
    undefined compressedTexSubImage2D(GLenum target, GLint level,
                                 GLint xoffset, GLint yoffset,
                                 GLsizei width, GLsizei height, GLenum format,
                                 /*[AllowShared]*/ ArrayBufferView data);

    undefined readPixels(GLint x, GLint y, GLsizei width, GLsizei height,
                    GLenum format, GLenum type, /*[AllowShared]*/ ArrayBufferView? pixels);

    [Throws]
    undefined texImage2D(GLenum target, GLint level, GLint internalformat,
                    GLsizei width, GLsizei height, GLint border, GLenum format,
                    GLenum type, /*[AllowShared]*/ ArrayBufferView? pixels);
    [Throws]
    undefined texImage2D(GLenum target, GLint level, GLint internalformat,
                    GLenum format, GLenum type, TexImageSource source); // May throw DOMException

    [Throws]
    undefined texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                       GLsizei width, GLsizei height,
                       GLenum format, GLenum type, /*[AllowShared]*/ ArrayBufferView? pixels);
    [Throws]
    undefined texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                       GLenum format, GLenum type, TexImageSource source); // May throw DOMException

    undefined uniform1fv(WebGLUniformLocation? location, Float32List v);
    undefined uniform2fv(WebGLUniformLocation? location, Float32List v);
    undefined uniform3fv(WebGLUniformLocation? location, Float32List v);
    undefined uniform4fv(WebGLUniformLocation? location, Float32List v);

    undefined uniform1iv(WebGLUniformLocation? location, Int32List v);
    undefined uniform2iv(WebGLUniformLocation? location, Int32List v);
    undefined uniform3iv(WebGLUniformLocation? location, Int32List v);
    undefined uniform4iv(WebGLUniformLocation? location, Int32List v);

    undefined uniformMatrix2fv(WebGLUniformLocation? location, GLboolean transpose, Float32List value);
    undefined uniformMatrix3fv(WebGLUniformLocation? location, GLboolean transpose, Float32List value);
    undefined uniformMatrix4fv(WebGLUniformLocation? location, GLboolean transpose, Float32List value);
};

[Exposed=(Window)]
interface WebGLRenderingContext
{
};
WebGLRenderingContext includes WebGLRenderingContextBase;
WebGLRenderingContext includes WebGLRenderingContextOverloads;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.8
//

[Exposed=Window, Pref="dom.webgl2.enabled"]
interface WebGLSampler : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.8
//

[Exposed=Window]
interface WebGLShader : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.7
//

[Exposed=Window]
interface WebGLShaderPrecisionFormat {
    readonly attribute GLint rangeMin;
    readonly attribute GLint rangeMax;
    readonly attribute GLint precision;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/2.0/#3.7.14
//

[Exposed=Window, Pref="dom.webgl2.enabled"]
interface WebGLSync : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/#5.9
//

[Exposed=Window]
interface WebGLTexture : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/2.0/#3.7.15
//

[Exposed=(Window), Pref="dom.webgl2.enabled"]
interface WebGLTransformFeedback : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.10
//

[Exposed=Window]
interface WebGLUniformLocation {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/2.0/#3.7.17
//

[Exposed=(Window), Pref="dom.webgl2.enabled"]
interface WebGLVertexArrayObject : WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * WebGL IDL definitions scraped from the Khronos specification:
 * https://www.khronos.org/registry/webgl/extensions/OES_vertex_array_object/
 */

[LegacyNoInterfaceObject, Exposed=Window]
interface WebGLVertexArrayObjectOES: WebGLObject {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// Source: WebGPU (https://gpuweb.github.io/gpuweb/)
// Direct source: https://github.com/w3c/webref/blob/curated/ed/idl/webgpu.idl

[Exposed=(Window)]
interface mixin GPUObjectBase {
    attribute USVString label;
};

dictionary GPUObjectDescriptorBase {
    USVString label;
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUSupportedLimits {
    readonly attribute unsigned long maxTextureDimension1D;
    readonly attribute unsigned long maxTextureDimension2D;
    readonly attribute unsigned long maxTextureDimension3D;
    readonly attribute unsigned long maxTextureArrayLayers;
    readonly attribute unsigned long maxBindGroups;
    //readonly attribute unsigned long maxBindGroupsPlusVertexBuffers;
    readonly attribute unsigned long maxBindingsPerBindGroup;
    readonly attribute unsigned long maxDynamicUniformBuffersPerPipelineLayout;
    readonly attribute unsigned long maxDynamicStorageBuffersPerPipelineLayout;
    readonly attribute unsigned long maxSampledTexturesPerShaderStage;
    readonly attribute unsigned long maxSamplersPerShaderStage;
    readonly attribute unsigned long maxStorageBuffersPerShaderStage;
    readonly attribute unsigned long maxStorageTexturesPerShaderStage;
    readonly attribute unsigned long maxUniformBuffersPerShaderStage;
    readonly attribute unsigned long long maxUniformBufferBindingSize;
    readonly attribute unsigned long long maxStorageBufferBindingSize;
    readonly attribute unsigned long minUniformBufferOffsetAlignment;
    readonly attribute unsigned long minStorageBufferOffsetAlignment;
    readonly attribute unsigned long maxVertexBuffers;
    readonly attribute unsigned long long maxBufferSize;
    readonly attribute unsigned long maxVertexAttributes;
    readonly attribute unsigned long maxVertexBufferArrayStride;
    readonly attribute unsigned long maxInterStageShaderComponents;
    //readonly attribute unsigned long maxInterStageShaderVariables;
    //readonly attribute unsigned long maxColorAttachments;
    //readonly attribute unsigned long maxColorAttachmentBytesPerSample;
    readonly attribute unsigned long maxComputeWorkgroupStorageSize;
    readonly attribute unsigned long maxComputeInvocationsPerWorkgroup;
    readonly attribute unsigned long maxComputeWorkgroupSizeX;
    readonly attribute unsigned long maxComputeWorkgroupSizeY;
    readonly attribute unsigned long maxComputeWorkgroupSizeZ;
    readonly attribute unsigned long maxComputeWorkgroupsPerDimension;
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUSupportedFeatures {
    readonly setlike<DOMString>;
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUAdapterInfo {
    readonly attribute DOMString vendor;
    readonly attribute DOMString architecture;
    readonly attribute DOMString device;
    readonly attribute DOMString description;
};

interface mixin NavigatorGPU {
    [SameObject, Pref="dom.webgpu.enabled", Exposed=(Window /* ,DedicatedWorker */)] readonly attribute GPU gpu;
};
// NOTE: see `Navigator.webidl`
// Navigator includes NavigatorGPU;
// NOTE: see `WorkerNavigator.webidl`
// WorkerNavigator includes NavigatorGPU;

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPU {
    [NewObject]
    Promise<GPUAdapter?> requestAdapter(optional GPURequestAdapterOptions options = {});
    GPUTextureFormat getPreferredCanvasFormat();
};

dictionary GPURequestAdapterOptions {
    GPUPowerPreference powerPreference;
    boolean forceFallbackAdapter = false;
};

enum GPUPowerPreference {
    "low-power",
    "high-performance"
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUAdapter {
    [SameObject] readonly attribute GPUSupportedFeatures features;
    [SameObject] readonly attribute GPUSupportedLimits limits;
    readonly attribute boolean isFallbackAdapter;

    [NewObject]
    Promise<GPUDevice> requestDevice(optional GPUDeviceDescriptor descriptor = {});
    [NewObject]
    Promise<GPUAdapterInfo> requestAdapterInfo(optional sequence<DOMString> unmaskHints = []);
};

dictionary GPUDeviceDescriptor {
    sequence<GPUFeatureName> requiredFeatures = [];
    record<DOMString, GPUSize64> requiredLimits;
};

enum GPUFeatureName {
    "depth-clip-control",
    "depth24unorm-stencil8",
    "depth32float-stencil8",
    "pipeline-statistics-query",
    "texture-compression-bc",
    "texture-compression-etc2",
    "texture-compression-astc",
    "timestamp-query",
    "indirect-first-instance",
};

[Exposed=(Window, DedicatedWorker), /*Serializable,*/ Pref="dom.webgpu.enabled"]
interface GPUDevice: EventTarget {
    [SameObject] readonly attribute GPUSupportedFeatures features;
    [SameObject] readonly attribute GPUSupportedLimits limits;

    // Overriding the name to avoid collision with `class Queue` in gcc
    [SameObject, BinaryName="getQueue"] readonly attribute GPUQueue queue;

    undefined destroy();

    [NewObject, Throws]
    GPUBuffer createBuffer(GPUBufferDescriptor descriptor);
    [NewObject, Throws]
    GPUTexture createTexture(GPUTextureDescriptor descriptor);
    [NewObject]
    GPUSampler createSampler(optional GPUSamplerDescriptor descriptor = {});

    GPUBindGroupLayout createBindGroupLayout(GPUBindGroupLayoutDescriptor descriptor);
    GPUPipelineLayout createPipelineLayout(GPUPipelineLayoutDescriptor descriptor);
    GPUBindGroup createBindGroup(GPUBindGroupDescriptor descriptor);

    GPUShaderModule createShaderModule(GPUShaderModuleDescriptor descriptor);
    GPUComputePipeline createComputePipeline(GPUComputePipelineDescriptor descriptor);
    GPURenderPipeline createRenderPipeline(GPURenderPipelineDescriptor descriptor);

    [NewObject]
    Promise<GPUComputePipeline> createComputePipelineAsync(GPUComputePipelineDescriptor descriptor);
    [NewObject]
    Promise<GPURenderPipeline> createRenderPipelineAsync(GPURenderPipelineDescriptor descriptor);

    [NewObject]
    GPUCommandEncoder createCommandEncoder(optional GPUCommandEncoderDescriptor descriptor = {});
    [NewObject]
    GPURenderBundleEncoder createRenderBundleEncoder(GPURenderBundleEncoderDescriptor descriptor);
    //[NewObject]
    //GPUQuerySet createQuerySet(GPUQuerySetDescriptor descriptor);
};
GPUDevice includes GPUObjectBase;

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUBuffer {
    [NewObject]
    Promise<undefined> mapAsync(GPUMapModeFlags mode, optional GPUSize64 offset = 0, optional GPUSize64 size);
    [NewObject, Throws]
    ArrayBuffer getMappedRange(optional GPUSize64 offset = 0, optional GPUSize64 size);
    [Throws]
    undefined unmap();
    [Throws]
    undefined destroy();
};
GPUBuffer includes GPUObjectBase;

dictionary GPUBufferDescriptor : GPUObjectDescriptorBase {
    required GPUSize64 size;
    required GPUBufferUsageFlags usage;
    boolean mappedAtCreation = false;
};

typedef [EnforceRange] unsigned long GPUBufferUsageFlags;
[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUBufferUsage {
    const GPUBufferUsageFlags MAP_READ      = 0x0001;
    const GPUBufferUsageFlags MAP_WRITE     = 0x0002;
    const GPUBufferUsageFlags COPY_SRC      = 0x0004;
    const GPUBufferUsageFlags COPY_DST      = 0x0008;
    const GPUBufferUsageFlags INDEX         = 0x0010;
    const GPUBufferUsageFlags VERTEX        = 0x0020;
    const GPUBufferUsageFlags UNIFORM       = 0x0040;
    const GPUBufferUsageFlags STORAGE       = 0x0080;
    const GPUBufferUsageFlags INDIRECT      = 0x0100;
    const GPUBufferUsageFlags QUERY_RESOLVE = 0x0200;
};

typedef [EnforceRange] unsigned long GPUMapModeFlags;
[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUMapMode {
    const GPUMapModeFlags READ  = 0x0001;
    const GPUMapModeFlags WRITE = 0x0002;
};

[Exposed=(Window, DedicatedWorker), Serializable , Pref="dom.webgpu.enabled"]
interface GPUTexture {
    [NewObject]
    GPUTextureView createView(optional GPUTextureViewDescriptor descriptor = {});

    undefined destroy();
};
GPUTexture includes GPUObjectBase;

dictionary GPUTextureDescriptor : GPUObjectDescriptorBase {
    required GPUExtent3D size;
    GPUIntegerCoordinate mipLevelCount = 1;
    GPUSize32 sampleCount = 1;
    GPUTextureDimension dimension = "2d";
    required GPUTextureFormat format;
    required GPUTextureUsageFlags usage;
    sequence<GPUTextureFormat> viewFormats = [];
};

enum GPUTextureDimension {
    "1d",
    "2d",
    "3d",
};

typedef [EnforceRange] unsigned long GPUTextureUsageFlags;
[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUTextureUsage {
    const GPUTextureUsageFlags COPY_SRC          = 0x01;
    const GPUTextureUsageFlags COPY_DST          = 0x02;
    const GPUTextureUsageFlags TEXTURE_BINDING   = 0x04;
    const GPUTextureUsageFlags STORAGE_BINDING   = 0x08;
    const GPUTextureUsageFlags RENDER_ATTACHMENT = 0x10;
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUTextureView {
};
GPUTextureView includes GPUObjectBase;

dictionary GPUTextureViewDescriptor : GPUObjectDescriptorBase {
    GPUTextureFormat format;
    GPUTextureViewDimension dimension;
    GPUTextureAspect aspect = "all";
    GPUIntegerCoordinate baseMipLevel = 0;
    GPUIntegerCoordinate mipLevelCount;
    GPUIntegerCoordinate baseArrayLayer = 0;
    GPUIntegerCoordinate arrayLayerCount;
};

enum GPUTextureViewDimension {
    "1d",
    "2d",
    "2d-array",
    "cube",
    "cube-array",
    "3d"
};

enum GPUTextureAspect {
    "all",
    "stencil-only",
    "depth-only"
};

enum GPUTextureFormat {
    // 8-bit formats
    "r8unorm",
    "r8snorm",
    "r8uint",
    "r8sint",

    // 16-bit formats
    "r16uint",
    "r16sint",
    "r16float",
    "rg8unorm",
    "rg8snorm",
    "rg8uint",
    "rg8sint",

    // 32-bit formats
    "r32uint",
    "r32sint",
    "r32float",
    "rg16uint",
    "rg16sint",
    "rg16float",
    "rgba8unorm",
    "rgba8unorm-srgb",
    "rgba8snorm",
    "rgba8uint",
    "rgba8sint",
    "bgra8unorm",
    "bgra8unorm-srgb",
    // Packed 32-bit formats
    "rgb10a2unorm",
    "rg11b10float",

    // 64-bit formats
    "rg32uint",
    "rg32sint",
    "rg32float",
    "rgba16uint",
    "rgba16sint",
    "rgba16float",

    // 128-bit formats
    "rgba32uint",
    "rgba32sint",
    "rgba32float",

    // Depth and stencil formats
    //"stencil8", //TODO
    //"depth16unorm",
    "depth24plus",
    "depth24plus-stencil8",
    "depth32float",

    // BC compressed formats usable if "texture-compression-bc" is both
    // supported by the device/user agent and enabled in requestDevice.
    "bc1-rgba-unorm",
    "bc1-rgba-unorm-srgb",
    "bc2-rgba-unorm",
    "bc2-rgba-unorm-srgb",
    "bc3-rgba-unorm",
    "bc3-rgba-unorm-srgb",
    "bc4-r-unorm",
    "bc4-r-snorm",
    "bc5-rg-unorm",
    "bc5-rg-snorm",
    "bc6h-rgb-ufloat",
    "bc6h-rgb-float",
    "bc7-rgba-unorm",
    "bc7-rgba-unorm-srgb",

    // "depth24unorm-stencil8" feature
    //"depth24unorm-stencil8",

    // "depth32float-stencil8" feature
    //"depth32float-stencil8",
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUSampler {
};
GPUSampler includes GPUObjectBase;

dictionary GPUSamplerDescriptor : GPUObjectDescriptorBase {
    GPUAddressMode addressModeU = "clamp-to-edge";
    GPUAddressMode addressModeV = "clamp-to-edge";
    GPUAddressMode addressModeW = "clamp-to-edge";
    GPUFilterMode magFilter = "nearest";
    GPUFilterMode minFilter = "nearest";
    GPUFilterMode mipmapFilter = "nearest";
    float lodMinClamp = 0;
    float lodMaxClamp = 1000.0; // TODO: What should this be?
    GPUCompareFunction compare;
    [Clamp] unsigned short maxAnisotropy = 1;
};

enum GPUAddressMode {
    "clamp-to-edge",
    "repeat",
    "mirror-repeat"
};

enum GPUFilterMode {
    "nearest",
    "linear",
};

enum GPUCompareFunction {
    "never",
    "less",
    "equal",
    "less-equal",
    "greater",
    "not-equal",
    "greater-equal",
    "always"
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUBindGroupLayout {
};
GPUBindGroupLayout includes GPUObjectBase;

dictionary GPUBindGroupLayoutDescriptor : GPUObjectDescriptorBase {
    required sequence<GPUBindGroupLayoutEntry> entries;
};

dictionary GPUBindGroupLayoutEntry {
    required GPUIndex32 binding;
    required GPUShaderStageFlags visibility;
    GPUBufferBindingLayout buffer;
    GPUSamplerBindingLayout sampler;
    GPUTextureBindingLayout texture;
    GPUStorageTextureBindingLayout storageTexture;
};

typedef [EnforceRange] unsigned long GPUShaderStageFlags;
[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUShaderStage {
    const GPUShaderStageFlags VERTEX = 1;
    const GPUShaderStageFlags FRAGMENT = 2;
    const GPUShaderStageFlags COMPUTE = 4;
};

enum GPUBufferBindingType {
    "uniform",
    "storage",
    "read-only-storage",
};

dictionary GPUBufferBindingLayout {
    GPUBufferBindingType type = "uniform";
    boolean hasDynamicOffset = false;
    GPUSize64 minBindingSize = 0;
};

enum GPUSamplerBindingType {
    "filtering",
    "non-filtering",
    "comparison",
};

dictionary GPUSamplerBindingLayout {
    GPUSamplerBindingType type = "filtering";
};

enum GPUTextureSampleType {
  "float",
  "unfilterable-float",
  "depth",
  "sint",
  "uint",
};

dictionary GPUTextureBindingLayout {
    GPUTextureSampleType sampleType = "float";
    GPUTextureViewDimension viewDimension = "2d";
    boolean multisampled = false;
};

enum GPUStorageTextureAccess {
    "write-only",
};

dictionary GPUStorageTextureBindingLayout {
    GPUStorageTextureAccess access = "write-only";
    required GPUTextureFormat format;
    GPUTextureViewDimension viewDimension = "2d";
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUBindGroup {
};
GPUBindGroup includes GPUObjectBase;

dictionary GPUBindGroupDescriptor : GPUObjectDescriptorBase {
    required GPUBindGroupLayout layout;
    required sequence<GPUBindGroupEntry> entries;
};

typedef (GPUSampler or GPUTextureView or GPUBufferBinding) GPUBindingResource;

dictionary GPUBindGroupEntry {
    required GPUIndex32 binding;
    required GPUBindingResource resource;
};

dictionary GPUBufferBinding {
    required GPUBuffer buffer;
    GPUSize64 offset = 0;
    GPUSize64 size;
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUPipelineLayout {
};
GPUPipelineLayout includes GPUObjectBase;

dictionary GPUPipelineLayoutDescriptor : GPUObjectDescriptorBase {
    required sequence<GPUBindGroupLayout> bindGroupLayouts;
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUShaderModule {
    [Throws]
    Promise<GPUCompilationInfo> getCompilationInfo();
};
GPUShaderModule includes GPUObjectBase;

dictionary GPUShaderModuleDescriptor : GPUObjectDescriptorBase {
    // UTF8String is not observably different from USVString
    required USVString code;
    object sourceMap;
};

enum GPUCompilationMessageType {
    "error",
    "warning",
    "info"
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUCompilationMessage {
    readonly attribute DOMString message;
    readonly attribute GPUCompilationMessageType type;
    readonly attribute unsigned long long lineNum;
    readonly attribute unsigned long long linePos;
    readonly attribute unsigned long long offset;
    readonly attribute unsigned long long length;
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUCompilationInfo {
    // codegen hates it
    //[Cached, Frozen, Pure]
    readonly attribute /*sequence<GPUCompilationMessage>*/ any messages;
};

enum GPUAutoLayoutMode {
    "auto"
};

dictionary GPUPipelineDescriptorBase : GPUObjectDescriptorBase {
    required (GPUPipelineLayout or GPUAutoLayoutMode) layout;
};

interface mixin GPUPipelineBase {
    [Throws] GPUBindGroupLayout getBindGroupLayout(unsigned long index);
};

dictionary GPUProgrammableStage {
    required GPUShaderModule module;
    required USVString entryPoint;
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUComputePipeline {
};
GPUComputePipeline includes GPUObjectBase;
GPUComputePipeline includes GPUPipelineBase;

dictionary GPUComputePipelineDescriptor : GPUPipelineDescriptorBase {
    required GPUProgrammableStage compute;
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPURenderPipeline {
};
GPURenderPipeline includes GPUObjectBase;
GPURenderPipeline includes GPUPipelineBase;

dictionary GPURenderPipelineDescriptor : GPUPipelineDescriptorBase {
    required GPUVertexState vertex;
    GPUPrimitiveState primitive = {};
    GPUDepthStencilState depthStencil;
    GPUMultisampleState multisample = {};
    GPUFragmentState fragment;
};

dictionary GPUPrimitiveState {
    GPUPrimitiveTopology topology = "triangle-list";
    GPUIndexFormat stripIndexFormat;
    GPUFrontFace frontFace = "ccw";
    GPUCullMode cullMode = "none";
    // Enable depth clamping (requires "depth-clamping" feature)
    boolean clampDepth = false;
};

enum GPUPrimitiveTopology {
    "point-list",
    "line-list",
    "line-strip",
    "triangle-list",
    "triangle-strip"
};

enum GPUFrontFace {
    "ccw",
    "cw"
};

enum GPUCullMode {
    "none",
    "front",
    "back"
};

dictionary GPUMultisampleState {
    GPUSize32 count = 1;
    GPUSampleMask mask = 0xFFFFFFFF;
    boolean alphaToCoverageEnabled = false;
};

dictionary GPUFragmentState: GPUProgrammableStage {
    required sequence<GPUColorTargetState> targets;
};

dictionary GPUColorTargetState {
    required GPUTextureFormat format;
    GPUBlendState blend;
    GPUColorWriteFlags writeMask = 0xF;  // GPUColorWrite.ALL
};

dictionary GPUBlendState {
    required GPUBlendComponent color;
    required GPUBlendComponent alpha;
};

typedef [EnforceRange] unsigned long GPUColorWriteFlags;
[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUColorWrite {
    const GPUColorWriteFlags RED   = 0x1;
    const GPUColorWriteFlags GREEN = 0x2;
    const GPUColorWriteFlags BLUE  = 0x4;
    const GPUColorWriteFlags ALPHA = 0x8;
    const GPUColorWriteFlags ALL   = 0xF;
};

dictionary GPUBlendComponent {
    GPUBlendFactor srcFactor = "one";
    GPUBlendFactor dstFactor = "zero";
    GPUBlendOperation operation = "add";
};

enum GPUBlendFactor {
    "zero",
    "one",
    "src",
    "one-minus-src",
    "src-alpha",
    "one-minus-src-alpha",
    "dst",
    "one-minus-dst",
    "dst-alpha",
    "one-minus-dst-alpha",
    "src-alpha-saturated",
    "constant",
    "one-minus-constant",
};

enum GPUBlendOperation {
    "add",
    "subtract",
    "reverse-subtract",
    "min",
    "max"
};

dictionary GPUDepthStencilState {
    required GPUTextureFormat format;

    boolean depthWriteEnabled = false;
    GPUCompareFunction depthCompare = "always";

    GPUStencilFaceState stencilFront = {};
    GPUStencilFaceState stencilBack = {};

    GPUStencilValue stencilReadMask = 0xFFFFFFFF;
    GPUStencilValue stencilWriteMask = 0xFFFFFFFF;

    GPUDepthBias depthBias = 0;
    float depthBiasSlopeScale = 0;
    float depthBiasClamp = 0;
};

dictionary GPUStencilFaceState {
    GPUCompareFunction compare = "always";
    GPUStencilOperation failOp = "keep";
    GPUStencilOperation depthFailOp = "keep";
    GPUStencilOperation passOp = "keep";
};

enum GPUStencilOperation {
    "keep",
    "zero",
    "replace",
    "invert",
    "increment-clamp",
    "decrement-clamp",
    "increment-wrap",
    "decrement-wrap"
};

enum GPUIndexFormat {
    "uint16",
    "uint32",
};

enum GPUVertexFormat {
    "uint8x2",
    "uint8x4",
    "sint8x2",
    "sint8x4",
    "unorm8x2",
    "unorm8x4",
    "snorm8x2",
    "snorm8x4",
    "uint16x2",
    "uint16x4",
    "sint16x2",
    "sint16x4",
    "unorm16x2",
    "unorm16x4",
    "snorm16x2",
    "snorm16x4",
    "float16x2",
    "float16x4",
    "float32",
    "float32x2",
    "float32x3",
    "float32x4",
    "uint32",
    "uint32x2",
    "uint32x3",
    "uint32x4",
    "sint32",
    "sint32x2",
    "sint32x3",
    "sint32x4",
};

enum GPUVertexStepMode {
    "vertex",
    "instance",
};

dictionary GPUVertexState: GPUProgrammableStage {
    sequence<GPUVertexBufferLayout?> buffers = [];
};

dictionary GPUVertexBufferLayout {
    required GPUSize64 arrayStride;
    GPUVertexStepMode stepMode = "vertex";
    required sequence<GPUVertexAttribute> attributes;
};

dictionary GPUVertexAttribute {
    required GPUVertexFormat format;
    required GPUSize64 offset;
    required GPUIndex32 shaderLocation;
};

dictionary GPUImageDataLayout {
    GPUSize64 offset = 0;
    GPUSize32 bytesPerRow;
    GPUSize32 rowsPerImage;
};

dictionary GPUImageCopyBuffer : GPUImageDataLayout {
    required GPUBuffer buffer;
};

dictionary GPUImageCopyTexture {
    required GPUTexture texture;
    GPUIntegerCoordinate mipLevel = 0;
    GPUOrigin3D origin;
    GPUTextureAspect aspect = "all";
};

dictionary GPUImageCopyTextureTagged : GPUImageCopyTexture {
    //GPUPredefinedColorSpace colorSpace = "srgb"; //TODO
    boolean premultipliedAlpha = false;
};

dictionary GPUImageCopyExternalImage {
    required (ImageBitmap or HTMLCanvasElement or OffscreenCanvas) source;
    GPUOrigin2D origin = {};
    boolean flipY = false;
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUCommandBuffer {
};
GPUCommandBuffer includes GPUObjectBase;

dictionary GPUCommandBufferDescriptor : GPUObjectDescriptorBase {
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUCommandEncoder {
    [NewObject]
    GPUComputePassEncoder beginComputePass(optional GPUComputePassDescriptor descriptor = {});
    [NewObject]
    GPURenderPassEncoder beginRenderPass(GPURenderPassDescriptor descriptor);

    undefined copyBufferToBuffer(
        GPUBuffer source,
        GPUSize64 sourceOffset,
        GPUBuffer destination,
        GPUSize64 destinationOffset,
        GPUSize64 size);

    undefined copyBufferToTexture(
        GPUImageCopyBuffer source,
        GPUImageCopyTexture destination,
        GPUExtent3D copySize);

    undefined copyTextureToBuffer(
        GPUImageCopyTexture source,
        GPUImageCopyBuffer destination,
        GPUExtent3D copySize);

    undefined copyTextureToTexture(
        GPUImageCopyTexture source,
        GPUImageCopyTexture destination,
        GPUExtent3D copySize);

    /*
    undefined copyImageBitmapToTexture(
        GPUImageBitmapCopyView source,
        GPUImageCopyTexture destination,
        GPUExtent3D copySize);
    */

    //undefined pushDebugGroup(USVString groupLabel);
    //undefined popDebugGroup();
    //undefined insertDebugMarker(USVString markerLabel);

    [NewObject]
    GPUCommandBuffer finish(optional GPUCommandBufferDescriptor descriptor = {});
};
GPUCommandEncoder includes GPUObjectBase;

dictionary GPUImageBitmapCopyView {
    //required ImageBitmap imageBitmap; //TODO
    GPUOrigin2D origin;
};

//TODO
dictionary GPUCommandEncoderDescriptor : GPUObjectDescriptorBase {
    boolean measureExecutionTime = false;
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUComputePassEncoder {
    undefined setPipeline(GPUComputePipeline pipeline);
    undefined dispatchWorkgroups(GPUSize32 x, optional GPUSize32 y = 1, optional GPUSize32 z = 1);
    //[Pref="dom.webgpu.indirect-dispatch.enabled"]
    undefined dispatchWorkgroupsIndirect(GPUBuffer indirectBuffer, GPUSize64 indirectOffset);

    [Throws]
    undefined end();
};
GPUComputePassEncoder includes GPUObjectBase;
GPUComputePassEncoder includes GPUProgrammablePassEncoder;

dictionary GPUComputePassDescriptor : GPUObjectDescriptorBase {
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPURenderPassEncoder {
    undefined setViewport(float x, float y,
                          float width, float height,
                          float minDepth, float maxDepth);

    undefined setScissorRect(GPUIntegerCoordinate x, GPUIntegerCoordinate y,
                             GPUIntegerCoordinate width, GPUIntegerCoordinate height);

    undefined setBlendConstant(GPUColor color);
    undefined setStencilReference(GPUStencilValue reference);

    //undefined beginOcclusionQuery(GPUSize32 queryIndex);
    //undefined endOcclusionQuery();

    //undefined beginPipelineStatisticsQuery(GPUQuerySet querySet, GPUSize32 queryIndex);
    //undefined endPipelineStatisticsQuery();

    //undefined writeTimestamp(GPUQuerySet querySet, GPUSize32 queryIndex);

    undefined executeBundles(sequence<GPURenderBundle> bundles);

    [Throws]
    undefined end();
};
GPURenderPassEncoder includes GPUObjectBase;
GPURenderPassEncoder includes GPUProgrammablePassEncoder;
GPURenderPassEncoder includes GPURenderEncoderBase;

[Exposed=(Window, DedicatedWorker)]
interface mixin GPUProgrammablePassEncoder {
    undefined setBindGroup(GPUIndex32 index, GPUBindGroup bindGroup,
                           optional sequence<GPUBufferDynamicOffset> dynamicOffsets = []);

    //undefined pushDebugGroup(USVString groupLabel);
    //undefined popDebugGroup();
    //undefined insertDebugMarker(USVString markerLabel);
};

dictionary GPURenderPassDescriptor : GPUObjectDescriptorBase {
    required sequence<GPURenderPassColorAttachment> colorAttachments;
    GPURenderPassDepthStencilAttachment depthStencilAttachment;
    GPUQuerySet occlusionQuerySet;
};

dictionary GPURenderPassColorAttachment {
    required GPUTextureView view;
    GPUTextureView resolveTarget;

    GPUColor clearValue;
    required GPULoadOp loadOp;
    required GPUStoreOp storeOp;
};

dictionary GPURenderPassDepthStencilAttachment {
    required GPUTextureView view;

    float depthClearValue;
    GPULoadOp depthLoadOp;
    GPUStoreOp depthStoreOp;
    boolean depthReadOnly = false;

    GPUStencilValue stencilClearValue = 0;
    GPULoadOp stencilLoadOp;
    GPUStoreOp stencilStoreOp;
    boolean stencilReadOnly = false;
};

enum GPULoadOp {
    "load",
    "clear"
};

enum GPUStoreOp {
    "store",
    "discard"
};

dictionary GPURenderPassLayout: GPUObjectDescriptorBase {
    // TODO: We don't support nullable enumerated arguments yet
    required sequence<GPUTextureFormat> colorFormats;
    GPUTextureFormat depthStencilFormat;
    GPUSize32 sampleCount = 1;
};

// https://gpuweb.github.io/gpuweb/#gpurendercommandsmixin
[Exposed=(Window, DedicatedWorker)]
interface mixin GPURenderEncoderBase {
    undefined setPipeline(GPURenderPipeline pipeline);

    undefined setIndexBuffer(GPUBuffer buffer,
                             GPUIndexFormat indexFormat,
                             optional GPUSize64 offset = 0,
                             optional GPUSize64 size = 0);
    undefined setVertexBuffer(GPUIndex32 slot,
                             GPUBuffer buffer,
                             optional GPUSize64 offset = 0,
                             optional GPUSize64 size = 0);

    undefined draw(GPUSize32 vertexCount,
                   optional GPUSize32 instanceCount = 1,
                   optional GPUSize32 firstVertex = 0,
                   optional GPUSize32 firstInstance = 0);
    undefined drawIndexed(GPUSize32 indexCount,
                          optional GPUSize32 instanceCount = 1,
                          optional GPUSize32 firstIndex = 0,
                          optional GPUSignedOffset32 baseVertex = 0,
                          optional GPUSize32 firstInstance = 0);

    //[Pref="dom.webgpu.indirect-dispatch.enabled"]
    undefined drawIndirect(GPUBuffer indirectBuffer, GPUSize64 indirectOffset);
    //[Pref="dom.webgpu.indirect-dispatch.enabled"]
    undefined drawIndexedIndirect(GPUBuffer indirectBuffer, GPUSize64 indirectOffset);
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPURenderBundle {
};
GPURenderBundle includes GPUObjectBase;

dictionary GPURenderBundleDescriptor : GPUObjectDescriptorBase {
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPURenderBundleEncoder {
    GPURenderBundle finish(optional GPURenderBundleDescriptor descriptor = {});
};
GPURenderBundleEncoder includes GPUObjectBase;
GPURenderBundleEncoder includes GPUProgrammablePassEncoder;
GPURenderBundleEncoder includes GPURenderEncoderBase;

dictionary GPURenderBundleEncoderDescriptor : GPURenderPassLayout {
    boolean depthReadOnly = false;
    boolean stencilReadOnly = false;
};

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUQueue {
    undefined submit(sequence<GPUCommandBuffer> buffers);

    Promise<undefined> onSubmittedWorkDone();

    [Throws]
    undefined writeBuffer(
        GPUBuffer buffer,
        GPUSize64 bufferOffset,
        BufferSource data,
        optional GPUSize64 dataOffset = 0,
        optional GPUSize64 size);

    [Throws]
    undefined writeTexture(
      GPUImageCopyTexture destination,
      BufferSource data,
      GPUImageDataLayout dataLayout,
      GPUExtent3D size);

    //[Throws]
    //undefined copyExternalImageToTexture(
    //  GPUImageCopyExternalImage source,
    //  GPUImageCopyTextureTagged destination,
    //  GPUExtent3D copySize);
};
GPUQueue includes GPUObjectBase;

[Exposed=(Window, DedicatedWorker), Serializable, Pref="dom.webgpu.enabled"]
interface GPUQuerySet {
    undefined destroy();
};
GPUQuerySet includes GPUObjectBase;

dictionary GPUQuerySetDescriptor : GPUObjectDescriptorBase {
    required GPUQueryType type;
    required GPUSize32 count;
    sequence<GPUPipelineStatisticName> pipelineStatistics = [];
};

enum GPUPipelineStatisticName {
    "vertex-shader-invocations",
    "clipper-invocations",
    "clipper-primitives-out",
    "fragment-shader-invocations",
    "compute-shader-invocations"
};

enum GPUQueryType {
    "occlusion",
    "pipeline-statistics",
    "timestamp"
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUCanvasContext {
    readonly attribute (HTMLCanvasElement or OffscreenCanvas) canvas;

    // Calling configure() a second time invalidates the previous one,
    // and all of the textures it's produced.
    undefined configure(GPUCanvasConfiguration descriptor);
    undefined unconfigure();

    [Throws]
    GPUTexture getCurrentTexture();
};

enum GPUCanvasAlphaMode {
    "opaque",
    "premultiplied",
};

dictionary GPUCanvasConfiguration {
    required GPUDevice device;
    required GPUTextureFormat format;
    GPUTextureUsageFlags usage = 0x10;  // GPUTextureUsage.RENDER_ATTACHMENT
    sequence<GPUTextureFormat> viewFormats = [];
    // PredefinedColorSpace colorSpace = "srgb"; // TODO
    GPUCanvasAlphaMode alphaMode = "opaque";
};

enum GPUDeviceLostReason {
    "unknown",
    "destroyed",
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUDeviceLostInfo {
    readonly attribute GPUDeviceLostReason reason;
    readonly attribute DOMString message;
};

partial interface GPUDevice {
    [Throws]
    readonly attribute Promise<GPUDeviceLostInfo> lost;
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUValidationError {
    [Throws]
    constructor(DOMString message);
    readonly attribute DOMString message;
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUOutOfMemoryError {
    constructor();
};

typedef (GPUOutOfMemoryError or GPUValidationError) GPUError;

enum GPUErrorFilter {
    "validation",
    "out-of-memory",
    "internal",
};

partial interface GPUDevice {
    undefined pushErrorScope(GPUErrorFilter filter);
    [NewObject]
    Promise<GPUError?> popErrorScope();
};

[Exposed=(Window, DedicatedWorker), Pref="dom.webgpu.enabled"]
interface GPUUncapturedErrorEvent : Event {
    constructor(
        DOMString type,
        GPUUncapturedErrorEventInit gpuUncapturedErrorEventInitDict
    );
    /*[SameObject]*/ readonly attribute GPUError error;
};

dictionary GPUUncapturedErrorEventInit : EventInit {
    required GPUError error;
};

partial interface GPUDevice {
    [Exposed=(Window, DedicatedWorker)]
    attribute EventHandler onuncapturederror;
};

typedef [EnforceRange] unsigned long GPUBufferDynamicOffset;
typedef [EnforceRange] unsigned long GPUStencilValue;
typedef [EnforceRange] unsigned long GPUSampleMask;
typedef [EnforceRange] long GPUDepthBias;

typedef [EnforceRange] unsigned long long GPUSize64;
typedef [EnforceRange] unsigned long GPUIntegerCoordinate;
typedef [EnforceRange] unsigned long GPUIndex32;
typedef [EnforceRange] unsigned long GPUSize32;
typedef [EnforceRange] long GPUSignedOffset32;

dictionary GPUColorDict {
    required double r;
    required double g;
    required double b;
    required double a;
};
typedef (sequence<double> or GPUColorDict) GPUColor;

dictionary GPUOrigin2DDict {
    GPUIntegerCoordinate x = 0;
    GPUIntegerCoordinate y = 0;
};
typedef (sequence<GPUIntegerCoordinate> or GPUOrigin2DDict) GPUOrigin2D;

dictionary GPUOrigin3DDict {
    GPUIntegerCoordinate x = 0;
    GPUIntegerCoordinate y = 0;
    GPUIntegerCoordinate z = 0;
};
typedef (sequence<GPUIntegerCoordinate> or GPUOrigin3DDict) GPUOrigin3D;

dictionary GPUExtent3DDict {
    required GPUIntegerCoordinate width;
    GPUIntegerCoordinate height = 1;
    GPUIntegerCoordinate depthOrArrayLayers = 1;
};

typedef (sequence<GPUIntegerCoordinate> or GPUExtent3DDict) GPUExtent3D;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-websocket-interface

enum BinaryType { "blob", "arraybuffer" };

[Exposed=(Window,Worker)]
interface WebSocket : EventTarget {
    [Throws] constructor(DOMString url, optional (DOMString or sequence<DOMString>) protocols);
    readonly attribute DOMString url;
    //ready state
    const unsigned short CONNECTING = 0;
    const unsigned short OPEN = 1;
    const unsigned short CLOSING = 2;
    const unsigned short CLOSED = 3;
    readonly attribute unsigned short readyState;
    readonly attribute unsigned long long bufferedAmount;

    //networking
    attribute EventHandler onopen;
    attribute EventHandler onerror;
    attribute EventHandler onclose;
    //readonly attribute DOMString extensions;
    readonly attribute DOMString protocol;
    [Throws] undefined close(optional [Clamp] unsigned short code, optional USVString reason);

    //messaging
    attribute EventHandler onmessage;
    attribute BinaryType binaryType;
    [Throws] undefined send(USVString data);
    [Throws] undefined send(Blob data);
    [Throws] undefined send(ArrayBuffer data);
    [Throws] undefined send(ArrayBufferView data);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://w3c.github.io/uievents/#interface-wheelevent
[Exposed=Window]
interface WheelEvent : MouseEvent {
    [Throws] constructor(DOMString typeArg, optional WheelEventInit wheelEventInitDict = {});
    const unsigned long DOM_DELTA_PIXEL = 0x00;
    const unsigned long DOM_DELTA_LINE = 0x01;
    const unsigned long DOM_DELTA_PAGE = 0x02;
    readonly    attribute double         deltaX;
    readonly    attribute double         deltaY;
    readonly    attribute double         deltaZ;
    readonly    attribute unsigned long  deltaMode;
};

// https://w3c.github.io/uievents/#idl-wheeleventinit
dictionary WheelEventInit : MouseEventInit {
    double deltaX = 0.0;
    double deltaY = 0.0;
    double deltaZ = 0.0;
    unsigned long deltaMode = 0;
};

// https://w3c.github.io/uievents/#idl-interface-WheelEvent-initializers
partial interface WheelEvent {
    // Deprecated in DOM Level 3
    undefined initWheelEvent (DOMString typeArg, boolean bubblesArg, boolean cancelableArg,
                         Window? viewArg, long detailArg,
                         double deltaX, double deltaY,
                         double deltaZ, unsigned long deltaMode);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#window
[Global=Window, Exposed=Window /*, LegacyUnenumerableNamedProperties */]
/*sealed*/ interface Window : GlobalScope {
  // the current browsing context
  [LegacyUnforgeable, CrossOriginReadable] readonly attribute WindowProxy window;
  [BinaryName="Self_", Replaceable, CrossOriginReadable] readonly attribute WindowProxy self;
  [LegacyUnforgeable] readonly attribute Document document;

  attribute DOMString name;

  [PutForwards=href, LegacyUnforgeable, CrossOriginReadable, CrossOriginWritable]
    readonly attribute Location location;
  readonly attribute History history;
  [Pref="dom.customelements.enabled"]
  readonly attribute CustomElementRegistry customElements;
  //[Replaceable] readonly attribute BarProp locationbar;
  //[Replaceable] readonly attribute BarProp menubar;
  //[Replaceable] readonly attribute BarProp personalbar;
  //[Replaceable] readonly attribute BarProp scrollbars;
  //[Replaceable] readonly attribute BarProp statusbar;
  //[Replaceable] readonly attribute BarProp toolbar;
  attribute DOMString status;
  [CrossOriginCallable] undefined close();
  [CrossOriginReadable] readonly attribute boolean closed;
  undefined stop();
  //[CrossOriginCallable] void focus();
  //[CrossOriginCallable] void blur();

  // other browsing contexts
  [Replaceable, CrossOriginReadable] readonly attribute WindowProxy frames;
  [Replaceable, CrossOriginReadable] readonly attribute unsigned long length;
  // Note that this can return null in the case that the browsing context has been discarded.
  // https://github.com/whatwg/html/issues/2115
  [LegacyUnforgeable, CrossOriginReadable] readonly attribute WindowProxy? top;
  [CrossOriginReadable] attribute any opener;
  // Note that this can return null in the case that the browsing context has been discarded.
  // https://github.com/whatwg/html/issues/2115
  [Replaceable, CrossOriginReadable] readonly attribute WindowProxy? parent;
  readonly attribute Element? frameElement;
  [Throws] WindowProxy? open(optional USVString url = "", optional DOMString target = "_blank",
                             optional DOMString features = "");
  //getter WindowProxy (unsigned long index);

  getter object (DOMString name);

  // the user agent
  readonly attribute Navigator navigator;
  //[Replaceable] readonly attribute External external;
  //readonly attribute ApplicationCache applicationCache;

  // user prompts
  undefined alert(DOMString message);
  undefined alert();
  boolean confirm(optional DOMString message = "");
  DOMString? prompt(optional DOMString message = "", optional DOMString default = "");
  //void print();
  //any showModalDialog(DOMString url, optional any argument);

  unsigned long requestAnimationFrame(FrameRequestCallback callback);
  undefined cancelAnimationFrame(unsigned long handle);

  [Throws, CrossOriginCallable]
  undefined postMessage(any message, USVString targetOrigin, optional sequence<object> transfer = []);
  [Throws, CrossOriginCallable]
  undefined postMessage(any message, optional WindowPostMessageOptions options = {});

  // also has obsolete members
};
Window includes GlobalEventHandlers;
Window includes WindowEventHandlers;

// https://html.spec.whatwg.org/multipage/#Window-partial
partial interface Window {
  undefined captureEvents();
  undefined releaseEvents();
};

// https://drafts.csswg.org/cssom/#extensions-to-the-window-interface
partial interface Window {
   [NewObject]
   CSSStyleDeclaration getComputedStyle(Element elt, optional DOMString pseudoElt);
};

// http://dev.w3.org/csswg/cssom-view/#extensions-to-the-window-interface
enum ScrollBehavior { "auto", "instant", "smooth" };

// http://dev.w3.org/csswg/cssom-view/#extensions-to-the-window-interface
dictionary ScrollOptions {
    ScrollBehavior behavior = "auto";
};

// http://dev.w3.org/csswg/cssom-view/#extensions-to-the-window-interface
dictionary ScrollToOptions : ScrollOptions {
    unrestricted double left;
    unrestricted double top;
};

// http://dev.w3.org/csswg/cssom-view/#extensions-to-the-window-interface
partial interface Window {
  [Exposed=(Window), NewObject] MediaQueryList matchMedia(DOMString query);
  [SameObject, Replaceable] readonly attribute Screen screen;

  // browsing context
  undefined moveTo(long x, long y);
  undefined moveBy(long x, long y);
  undefined resizeTo(long x, long y);
  undefined resizeBy(long x, long y);

  // viewport
  [Replaceable] readonly attribute long innerWidth;
  [Replaceable] readonly attribute long innerHeight;

  // viewport scrolling
  [Replaceable] readonly attribute long scrollX;
  [Replaceable] readonly attribute long pageXOffset;
  [Replaceable] readonly attribute long scrollY;
  [Replaceable] readonly attribute long pageYOffset;
  undefined scroll(optional ScrollToOptions options = {});
  undefined scroll(unrestricted double x, unrestricted double y);
  undefined scrollTo(optional ScrollToOptions options = {});
  undefined scrollTo(unrestricted double x, unrestricted double y);
  undefined scrollBy(optional ScrollToOptions options = {});
  undefined scrollBy(unrestricted double x, unrestricted double y);

  // client
  [Replaceable] readonly attribute long screenX;
  [Replaceable] readonly attribute long screenY;
  [Replaceable] readonly attribute long outerWidth;
  [Replaceable] readonly attribute long outerHeight;
  [Replaceable] readonly attribute double devicePixelRatio;
};

// Proprietary extensions.
partial interface Window {
  [Pref="dom.servo_helpers.enabled"]
  undefined debug(DOMString arg);
  [Pref="dom.servo_helpers.enabled"]
  undefined gc();
  [Pref="dom.servo_helpers.enabled"]
  undefined js_backtrace();
};

// WebDriver extensions
partial interface Window {
  // Shouldn't be public, but just to make things work for now
  undefined webdriverCallback(optional any result);
  undefined webdriverTimeout();
};

// https://html.spec.whatwg.org/multipage/#dom-sessionstorage
interface mixin WindowSessionStorage {
  readonly attribute Storage sessionStorage;
};
Window includes WindowSessionStorage;

// https://html.spec.whatwg.org/multipage/#dom-localstorage
interface mixin WindowLocalStorage {
  readonly attribute Storage localStorage;
};
Window includes WindowLocalStorage;

// http://w3c.github.io/animation-timing/#framerequestcallback
callback FrameRequestCallback = undefined (DOMHighResTimeStamp time);

// https://webbluetoothcg.github.io/web-bluetooth/tests#test-interfaces
partial interface Window {
   [Pref="dom.bluetooth.testing.enabled", Exposed=Window]
   readonly attribute TestRunner testRunner;
   //readonly attribute EventSender eventSender;
};

partial interface Window {
   [Pref="css.animations.testing.enabled"]
   readonly attribute unsigned long runningAnimationCount;
};

// https://w3c.github.io/selection-api/#dom-document
partial interface Window {
   Selection? getSelection();
};

// https://dom.spec.whatwg.org/#interface-window-extensions
partial interface Window {
  [Replaceable] readonly attribute any event; // historical
};

dictionary WindowPostMessageOptions : PostMessageOptions {
   USVString targetOrigin = "/";
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#windoworworkerglobalscope

typedef (DOMString or Function) TimerHandler;

[Exposed=(Window,Worker)]
interface mixin WindowOrWorkerGlobalScope {
  [Replaceable] readonly attribute USVString origin;

  // base64 utility methods
  [Throws] DOMString btoa(DOMString data);
  [Throws] DOMString atob(DOMString data);

  // timers
  long setTimeout(TimerHandler handler, optional long timeout = 0, any... arguments);
  undefined clearTimeout(optional long handle = 0);
  long setInterval(TimerHandler handler, optional long timeout = 0, any... arguments);
  undefined clearInterval(optional long handle = 0);

  // microtask queuing
  undefined queueMicrotask(VoidFunction callback);

  // ImageBitmap
  [Pref="dom.imagebitmap.enabled"]
  Promise<ImageBitmap> createImageBitmap(ImageBitmapSource image, optional ImageBitmapOptions options = {});
  // Promise<ImageBitmap> createImageBitmap(
  //   ImageBitmapSource image, long sx, long sy, long sw, long sh, optional ImageBitmapOptions options);
};

// https://w3c.github.io/hr-time/#the-performance-attribute
partial interface mixin WindowOrWorkerGlobalScope {
    [Replaceable]
    readonly attribute Performance performance;
};

// https://w3c.github.io/webappsec-secure-contexts/#monkey-patching-global-object
partial interface mixin WindowOrWorkerGlobalScope {
  readonly attribute boolean isSecureContext;
};

Window includes WindowOrWorkerGlobalScope;
WorkerGlobalScope includes WindowOrWorkerGlobalScope;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#the-windowproxy-exotic-object
[Exposed=(Window,DissimilarOriginWindow), LegacyNoInterfaceObject]
interface WindowProxy {};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#abstractworker
[Exposed=(Window,Worker)]
interface mixin AbstractWorker {
    attribute EventHandler onerror;
};

// https://html.spec.whatwg.org/multipage/#worker
[Exposed=(Window,Worker)]
interface Worker : EventTarget {
  [Throws] constructor(USVString scriptURL, optional WorkerOptions options = {});
  undefined terminate();

  [Throws] undefined postMessage(any message, sequence<object> transfer);
  [Throws] undefined postMessage(any message, optional PostMessageOptions options = {});
  attribute EventHandler onmessage;
  attribute EventHandler onmessageerror;
};

dictionary WorkerOptions {
  WorkerType type = "classic";
  RequestCredentials credentials = "same-origin"; // credentials is only used if type is "module"
  DOMString name = "";
};

enum WorkerType { "classic", "module" };

Worker includes AbstractWorker;
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#workerglobalscope
[Abstract, Exposed=Worker]
interface WorkerGlobalScope : GlobalScope {
  [BinaryName="Self_"] readonly attribute WorkerGlobalScope self;
  readonly attribute WorkerLocation location;

  //void close();
  attribute OnErrorEventHandler onerror;
  //         attribute EventHandler onlanguagechange;
  //         attribute EventHandler onoffline;
  //         attribute EventHandler ononline;
};

// https://html.spec.whatwg.org/multipage/#WorkerGlobalScope-partial
[Exposed=Worker]
partial interface WorkerGlobalScope { // not obsolete
  [Throws]
  undefined importScripts(DOMString... urls);
  readonly attribute WorkerNavigator navigator;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#worker-locations
[Exposed=Worker]
interface WorkerLocation {
  stringifier readonly attribute USVString href;
  readonly attribute USVString origin;
  readonly attribute USVString protocol;
  readonly attribute USVString host;
  readonly attribute USVString hostname;
  readonly attribute USVString port;
  readonly attribute USVString pathname;
  readonly attribute USVString search;
  readonly attribute USVString hash;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://html.spec.whatwg.org/multipage/#workernavigator
[Exposed=Worker]
interface WorkerNavigator {};
WorkerNavigator includes NavigatorID;
WorkerNavigator includes NavigatorLanguage;
//WorkerNavigator includes NavigatorOnLine;
WorkerNavigator includes NavigatorConcurrentHardware;

// https://w3c.github.io/permissions/#navigator-and-workernavigator-extension

[Exposed=(Worker)]
partial interface WorkerNavigator {
  [Pref="dom.permissions.enabled"] readonly attribute Permissions permissions;
};

[Exposed=DedicatedWorker]
partial interface WorkerNavigator {
    [SameObject, Pref="dom.webgpu.enabled"] readonly attribute GPU gpu;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.css-houdini.org/worklets/#worklet
[Pref="dom.worklet.enabled", Exposed=(Window)]
interface Worklet {
    [NewObject] Promise<undefined> addModule(USVString moduleURL, optional WorkletOptions options = {});
};

dictionary WorkletOptions {
    RequestCredentials credentials = "omit";
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://drafts.css-houdini.org/worklets/#workletglobalscope
// TODO: The spec IDL doesn't make this a subclass of EventTarget
//       https://github.com/whatwg/html/issues/2611
[Pref="dom.worklet.enabled", Exposed=Worklet]
interface WorkletGlobalScope: GlobalScope {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is:
 * https://dom.spec.whatwg.org/#interface-document
 * https://html.spec.whatwg.org/multipage/#the-document-object
 */

// https://dom.spec.whatwg.org/#interface-document
[Exposed=Window]
interface XMLDocument : Document {};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://xhr.spec.whatwg.org/#interface-xmlhttprequest
 *
 * To the extent possible under law, the editor has waived all copyright
 * and related or neighboring rights to this work. In addition, as of 1 May 2014,
 * the editor has made this specification available under the Open Web Foundation
 * Agreement Version 1.0, which is available at
 * http://www.openwebfoundation.org/legal/the-owf-1-0-agreements/owfa-1-0.
 */

// https://fetch.spec.whatwg.org/#typedefdef-xmlhttprequestbodyinit
typedef (Blob or BufferSource or FormData or DOMString or URLSearchParams) XMLHttpRequestBodyInit;

// https://fetch.spec.whatwg.org/#bodyinit
typedef (ReadableStream or XMLHttpRequestBodyInit) BodyInit;

enum XMLHttpRequestResponseType {
  "",
  "arraybuffer",
  "blob",
  "document",
  "json",
  "text",
};

[Exposed=(Window,Worker)]
interface XMLHttpRequest : XMLHttpRequestEventTarget {
  [Throws] constructor();
  // event handler
  attribute EventHandler onreadystatechange;

  // states
  const unsigned short UNSENT = 0;
  const unsigned short OPENED = 1;
  const unsigned short HEADERS_RECEIVED = 2;
  const unsigned short LOADING = 3;
  const unsigned short DONE = 4;
  readonly attribute unsigned short readyState;

  // request
  [Throws]
  undefined open(ByteString method, USVString url);
  [Throws]
  undefined open(ByteString method, USVString url, boolean async,
            optional USVString? username = null,
            optional USVString? password = null);

  [Throws]
  undefined setRequestHeader(ByteString name, ByteString value);
  [SetterThrows]
           attribute unsigned long timeout;
  [SetterThrows]
           attribute boolean withCredentials;
  readonly attribute XMLHttpRequestUpload upload;
  [Throws]
  undefined send(optional (Document or XMLHttpRequestBodyInit)? data = null);
  undefined abort();

  // response
  readonly attribute USVString responseURL;
  readonly attribute unsigned short status;
  readonly attribute ByteString statusText;
  ByteString? getResponseHeader(ByteString name);
  ByteString getAllResponseHeaders();
  [Throws]
  undefined overrideMimeType(DOMString mime);
  [SetterThrows]
           attribute XMLHttpRequestResponseType responseType;
  readonly attribute any response;
  [Throws]
  readonly attribute USVString responseText;
  [Throws, Exposed=Window] readonly attribute Document? responseXML;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://xhr.spec.whatwg.org/#interface-xmlhttprequest
 *
 * To the extent possible under law, the editor has waived all copyright
 * and related or neighboring rights to this work. In addition, as of 1 May 2014,
 * the editor has made this specification available under the Open Web Foundation
 * Agreement Version 1.0, which is available at
 * http://www.openwebfoundation.org/legal/the-owf-1-0-agreements/owfa-1-0.
 */

[Abstract, Exposed=(Window,Worker)]
interface XMLHttpRequestEventTarget : EventTarget {
  // event handlers
  attribute EventHandler onloadstart;
  attribute EventHandler onprogress;
  attribute EventHandler onabort;
  attribute EventHandler onerror;
  attribute EventHandler onload;
  attribute EventHandler ontimeout;
  attribute EventHandler onloadend;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://xhr.spec.whatwg.org/#interface-xmlhttprequest
 *
 * To the extent possible under law, the editor has waived all copyright
 * and related or neighboring rights to this work. In addition, as of 1 May 2014,
 * the editor has made this specification available under the Open Web Foundation
 * Agreement Version 1.0, which is available at
 * http://www.openwebfoundation.org/legal/the-owf-1-0-agreements/owfa-1-0.
 */

[Exposed=(Window,Worker)]
interface XMLHttpRequestUpload : XMLHttpRequestEventTarget {
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
/*
 * The origin of this IDL file is
 * https://w3c.github.io/DOM-Parsing/#the-domparser-interface
 */

[Exposed=Window]
interface XMLSerializer {
  [Throws] constructor();
  [Throws]
  DOMString serializeToString(Node root);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// TODO: Implement the layer types
// https://github.com/servo/servo/issues/27493

// https://immersive-web.github.io/layers/#xrcompositionlayer
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRCompositionLayer : XRLayer {
//   readonly attribute XRLayerLayout layout;
//
//   attribute boolean blendTextureSourceAlpha;
//   attribute boolean? chromaticAberrationCorrection;
//   attribute float? fixedFoveation;
//
//   readonly attribute boolean needsRedraw;
//
//   void destroy();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// TODO: Implement the layer types
// https://github.com/servo/servo/issues/27493

// https://immersive-web.github.io/layers/#xrcubelayer

[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRCubeLayer : XRCompositionLayer {
//   attribute XRSpace space;
//   attribute DOMPointReadOnly orientation;
//
//   // Events
//   attribute EventHandler onredraw;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// TODO: Implement the layer types
// https://github.com/servo/servo/issues/27493

// https://immersive-web.github.io/layers/#xrcylinderlayer
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRCylinderLayer : XRCompositionLayer {
//   attribute XRSpace space;
//   attribute XRRigidTransform transform;
//
//   attribute float radius;
//   attribute float centralAngle;
//   attribute float aspectRatio;
//
//   // Events
//   attribute EventHandler onredraw;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// TODO: Implement the layer types
// https://github.com/servo/servo/issues/27493

// https://immersive-web.github.io/layers/#xrequirectlayer
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XREquirectLayer : XRCompositionLayer {
//   attribute XRSpace space;
//   attribute XRRigidTransform transform;
//
//   attribute float radius;
//   attribute float centralHorizontalAngle;
//   attribute float upperVerticalAngle;
//   attribute float lowerVerticalAngle;
//
//   // Events
//   attribute EventHandler onredraw;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrframe-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRFrame {
  readonly attribute XRSession session;

  [Throws] XRViewerPose? getViewerPose(XRReferenceSpace referenceSpace);
  [Throws] XRPose? getPose(XRSpace space, XRSpace relativeTo);
  [Pref="dom.webxr.hands.enabled", Throws] XRJointPose? getJointPose(XRJointSpace space, XRSpace relativeTo);
  sequence<XRHitTestResult> getHitTestResults(XRHitTestSource hitTestSource);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://github.com/immersive-web/webxr-hands-input/blob/master/explainer.md

[SecureContext, Exposed=Window, Pref="dom.webxr.hands.enabled"]
interface XRHand {
    readonly attribute long length;
    getter XRJointSpace(unsigned long index);

    const unsigned long WRIST = 0;
    const unsigned long THUMB_METACARPAL = 1;
    const unsigned long THUMB_PHALANX_PROXIMAL = 2;
    const unsigned long THUMB_PHALANX_DISTAL = 3;
    const unsigned long THUMB_PHALANX_TIP = 4;

    const unsigned long INDEX_METACARPAL = 5;
    const unsigned long INDEX_PHALANX_PROXIMAL = 6;
    const unsigned long INDEX_PHALANX_INTERMEDIATE = 7;
    const unsigned long INDEX_PHALANX_DISTAL = 8;
    const unsigned long INDEX_PHALANX_TIP = 9;

    const unsigned long MIDDLE_METACARPAL = 10;
    const unsigned long MIDDLE_PHALANX_PROXIMAL = 11;
    const unsigned long MIDDLE_PHALANX_INTERMEDIATE = 12;
    const unsigned long MIDDLE_PHALANX_DISTAL = 13;
    const unsigned long MIDDLE_PHALANX_TIP = 14;

    const unsigned long RING_METACARPAL = 15;
    const unsigned long RING_PHALANX_PROXIMAL = 16;
    const unsigned long RING_PHALANX_INTERMEDIATE = 17;
    const unsigned long RING_PHALANX_DISTAL = 18;
    const unsigned long RING_PHALANX_TIP = 19;

    const unsigned long LITTLE_METACARPAL = 20;
    const unsigned long LITTLE_PHALANX_PROXIMAL = 21;
    const unsigned long LITTLE_PHALANX_INTERMEDIATE = 22;
    const unsigned long LITTLE_PHALANX_DISTAL = 23;
    const unsigned long LITTLE_PHALANX_TIP = 24;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/hit-test/#xrhittestresult-interface

[SecureContext, Exposed=Window]
interface XRHitTestResult {
  XRPose? getPose(XRSpace baseSpace);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/hit-test/#xrhittestsource-interface

enum XRHitTestTrackableType {
  "point",
  "plane",
  "mesh"
};

dictionary XRHitTestOptionsInit {
  required XRSpace space;
  sequence<XRHitTestTrackableType> entityTypes;
  XRRay offsetRay;
};

[SecureContext, Exposed=Window]
interface XRHitTestSource {
  undefined cancel();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrinputsource-interface

enum XRHandedness {
  "none",
  "left",
  "right"
};

enum XRTargetRayMode {
  "gaze",
  "tracked-pointer",
  "screen"
};

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRInputSource {
  readonly attribute XRHandedness handedness;
  readonly attribute XRTargetRayMode targetRayMode;
  [SameObject] readonly attribute XRSpace targetRaySpace;
  [SameObject] readonly attribute XRSpace? gripSpace;
  // [SameObject] readonly attribute Gamepad? gamepad;
  /* [SameObject] */ readonly attribute /* FrozenArray<DOMString> */ any profiles;

  [Pref="dom.webxr.hands.enabled"]
  readonly attribute XRHand? hand;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrinputsourcearray-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRInputSourceArray {
  iterable<XRInputSource>;
  readonly attribute unsigned long length;
  getter XRInputSource(unsigned long index);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrinputsourceevent-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRInputSourceEvent : Event {
  [Throws] constructor(DOMString type, XRInputSourceEventInit eventInitDict);
  [SameObject] readonly attribute XRFrame frame;
  [SameObject] readonly attribute XRInputSource inputSource;
};

dictionary XRInputSourceEventInit : EventInit {
  required XRFrame frame;
  required XRInputSource inputSource;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrinputsourceschangedevent-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.test"]
interface XRInputSourcesChangeEvent : Event {
  constructor(DOMString type, XRInputSourcesChangeEventInit eventInitDict);
  [SameObject] readonly attribute XRSession session;
  /* [SameObject] */ readonly attribute /* FrozenArray<XRInputSource> */ any added;
  /* [SameObject] */ readonly attribute /* FrozenArray<XRInputSource> */ any removed;
};

dictionary XRInputSourcesChangeEventInit : EventInit {
  required XRSession session;
  required sequence<XRInputSource> added;
  required sequence<XRInputSource> removed;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://github.com/immersive-web/webxr-hands-input/blob/master/explainer.md

[SecureContext, Exposed=Window, Pref="dom.webxr.hands.enabled"]
interface XRJointPose: XRPose {
    readonly attribute float? radius;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://github.com/immersive-web/webxr-hands-input/blob/master/explainer.md

[SecureContext, Exposed=Window, Pref="dom.webxr.hands.enabled"]
interface XRJointSpace: XRSpace {};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrlayer
[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRLayer : EventTarget {};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/layers/#xrlayerevent-interface
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRLayerEvent : Event {
  constructor(DOMString type, XRLayerEventInit eventInitDict);
  [SameObject] readonly attribute XRLayer layer;
};

dictionary XRLayerEventInit : EventInit {
  required XRLayer layer;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/layers/#xrmediabindingtype
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRMediaBinding {
  [Throws] constructor(XRSession session);

  [Throws] XRQuadLayer createQuadLayer(HTMLVideoElement video, XRMediaLayerInit init);
  [Throws] XRCylinderLayer createCylinderLayer(HTMLVideoElement video, XRMediaLayerInit init);
  [Throws] XREquirectLayer createEquirectLayer(HTMLVideoElement video, XRMediaLayerInit init);
};

dictionary XRMediaLayerInit {
  required XRSpace space;
  XRLayerLayout layout = "mono";
  boolean invertStereo = false;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrpose-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRPose {
  readonly attribute XRRigidTransform transform;
  // readonly attribute boolean emulatedPosition;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// TODO: Implement the layer types
// https://github.com/servo/servo/issues/27493

// https://immersive-web.github.io/layers/#xrprojectionlayer
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRProjectionLayer : XRCompositionLayer {
//   readonly attribute boolean ignoreDepthValues;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// TODO: Implement the layer types
// https://github.com/servo/servo/issues/27493

// https://immersive-web.github.io/layers/#xrquadlayer
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRQuadLayer : XRCompositionLayer {
//   attribute XRSpace space;
//   attribute XRRigidTransform transform;
//
//   attribute float width;
//   attribute float height;
//
//   // Events
//   attribute EventHandler onredraw;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/hit-test/#xrray-interface

dictionary XRRayDirectionInit {
  double x = 0;
  double y = 0;
  double z = -1;
  double w = 0;
};

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRRay {
  [Throws] constructor(optional DOMPointInit origin = {}, optional XRRayDirectionInit direction = {});
  [Throws] constructor(XRRigidTransform transform);
  [SameObject] readonly attribute DOMPointReadOnly origin;
  [SameObject] readonly attribute DOMPointReadOnly direction;
  [SameObject] readonly attribute Float32Array matrix;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrreferencespace-interface

enum XRReferenceSpaceType {
  "viewer",
  "local",
  "local-floor",
  "bounded-floor",
  "unbounded"
};

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRReferenceSpace : XRSpace {
  XRReferenceSpace getOffsetReferenceSpace(XRRigidTransform originOffset);
  // attribute EventHandler onreset;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrrenderstate-interface

dictionary XRRenderStateInit {
  double depthNear;
  double depthFar;
  double inlineVerticalFieldOfView;
  XRWebGLLayer? baseLayer;
  sequence<XRLayer>? layers;
};

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"] interface XRRenderState {
  readonly attribute double depthNear;
  readonly attribute double depthFar;
  readonly attribute double? inlineVerticalFieldOfView;
  readonly attribute XRWebGLLayer? baseLayer;

  // https://immersive-web.github.io/layers/#xrrenderstatechanges
  // workaround until we have FrozenArray
  readonly attribute /* FrozenArray<XRLayer> */ any layers;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrrigidtransform-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRRigidTransform {
  [Throws] constructor(optional DOMPointInit position = {}, optional DOMPointInit orientation = {});
  readonly attribute DOMPointReadOnly position;
  readonly attribute DOMPointReadOnly orientation;
  readonly attribute Float32Array matrix;
  readonly attribute XRRigidTransform inverse;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrsession-interface

enum XREnvironmentBlendMode {
  "opaque",
  "additive",
  "alpha-blend",
};

enum XRVisibilityState {
  "visible",
  "visible-blurred",
  "hidden",
};

callback XRFrameRequestCallback = undefined (DOMHighResTimeStamp time, XRFrame frame);

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRSession : EventTarget {
  // // Attributes
  readonly attribute XREnvironmentBlendMode environmentBlendMode;

  readonly attribute XRVisibilityState visibilityState;
  [SameObject] readonly attribute XRRenderState renderState;
  [SameObject] readonly attribute XRInputSourceArray inputSources;

  // // Methods
  [Throws] undefined updateRenderState(optional XRRenderStateInit state = {});
  Promise<XRReferenceSpace> requestReferenceSpace(XRReferenceSpaceType type);

  long requestAnimationFrame(XRFrameRequestCallback callback);
  undefined cancelAnimationFrame(long handle);

  Promise<undefined> end();

  // hit test module
  Promise<XRHitTestSource> requestHitTestSource(XRHitTestOptionsInit options);

  // // Events
  attribute EventHandler onend;
  attribute EventHandler onselect;
  attribute EventHandler onsqueeze;
  attribute EventHandler oninputsourceschange;
  attribute EventHandler onselectstart;
  attribute EventHandler onselectend;
  attribute EventHandler onsqueezestart;
  attribute EventHandler onsqueezeend;
  attribute EventHandler onvisibilitychange;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrsessionevent-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRSessionEvent : Event {
  [Throws] constructor(DOMString type, XRSessionEventInit eventInitDict);
  [SameObject] readonly attribute XRSession session;
};

dictionary XRSessionEventInit : EventInit {
  required XRSession session;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrspace-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRSpace : EventTarget {
  // XRRigidTransform? getTransformTo(XRSpace other);
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/layers/#xrsubimagetype
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRSubImage {
  [SameObject] readonly attribute XRViewport viewport;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrsystem-interface
[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRSystem: EventTarget {
  // Methods
  Promise<boolean> isSessionSupported(XRSessionMode mode);
  Promise<XRSession> requestSession(XRSessionMode mode, optional  XRSessionInit parameters = {});

  // Events
  // attribute EventHandler ondevicechange;
};

[SecureContext]
partial interface Navigator {
  [SameObject, Pref="dom.webxr.enabled"] readonly attribute XRSystem xr;
};

enum XRSessionMode {
  "inline",
  "immersive-vr",
  "immersive-ar"
};

dictionary XRSessionInit {
  sequence<any> requiredFeatures;
  sequence<any> optionalFeatures;
};

partial interface XRSystem {
  // https://github.com/immersive-web/webxr-test-api/
  [SameObject, Pref="dom.webxr.test"] readonly attribute XRTest test;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://github.com/immersive-web/webxr-test-api/

[Exposed=Window, Pref="dom.webxr.test"]
interface XRTest {
  // Simulates connecting a device to the system.
  // Used to instantiate a fake device for use in tests.
  Promise<FakeXRDevice> simulateDeviceConnection(FakeXRDeviceInit init);

  // // Simulates a user activation (aka user gesture) for the current scope.
  // // The activation is only guaranteed to be valid in the provided function and only applies to WebXR
  // // Device API methods.
  undefined simulateUserActivation(Function f);

  // // Disconnect all fake devices
  Promise<undefined> disconnectAllDevices();
};

dictionary FakeXRDeviceInit {
    boolean supportsImmersive = false;
    sequence<XRSessionMode> supportedModes;

    required sequence<FakeXRViewInit> views;

    // this is actually sequence<any>, but we don't support
    // non-string features anyway
    sequence<DOMString> supportedFeatures;
    // Whether the space supports tracking in inline sessions
    boolean supportsTrackingInInline = true;
    // The bounds coordinates. If null, bounded reference spaces are not supported.
    sequence<FakeXRBoundsPoint> boundsCoodinates;
    // Eye level used for calculating floor-level spaces
    FakeXRRigidTransformInit floorOrigin;
    FakeXRRigidTransformInit viewerOrigin;

    // Hit test extensions:
    FakeXRWorldInit world;
};

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrview-interface

enum XREye {
  "left",
  "right",
  "none",
};

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRView {
  readonly attribute XREye eye;
  readonly attribute Float32Array projectionMatrix;
  readonly attribute XRRigidTransform transform;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrviewerpose-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRViewerPose : XRPose {
  // readonly attribute FrozenArray<XRView> views;
  // workaround until we have FrozenArray
  // see https://github.com/servo/servo/issues/10427#issuecomment-449593626
  readonly attribute any views;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrviewport-interface

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRViewport {
  readonly attribute long x;
  readonly attribute long y;
  readonly attribute long width;
  readonly attribute long height;
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/layers/#XRWebGLBindingtype
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRWebGLBinding {
  constructor(XRSession session, XRWebGLRenderingContext context);

//  readonly attribute double nativeProjectionScaleFactor;

  [Throws] XRProjectionLayer createProjectionLayer(XRTextureType textureType,
                                          optional XRProjectionLayerInit init = {});
  [Throws] XRQuadLayer createQuadLayer(XRTextureType textureType,
                              optional XRQuadLayerInit init);
  [Throws] XRCylinderLayer createCylinderLayer(XRTextureType textureType,
                                      optional XRCylinderLayerInit init);
  [Throws] XREquirectLayer createEquirectLayer(XRTextureType textureType,
                                      optional XREquirectLayerInit init);
  [Throws] XRCubeLayer createCubeLayer(optional XRCubeLayerInit init);

  [Throws] XRWebGLSubImage getSubImage(XRCompositionLayer layer, XRFrame frame, optional XREye eye = "none");
  [Throws] XRWebGLSubImage getViewSubImage(XRProjectionLayer layer, XRView view);
};

dictionary XRProjectionLayerInit {
  boolean depth = true;
  boolean stencil = false;
  boolean alpha = true;
  double scaleFactor = 1.0;
};

dictionary XRQuadLayerInit : XRLayerInit {
  XRRigidTransform? transform;
  float width = 1.0;
  float height = 1.0;
  boolean isStatic = false;
};

dictionary XRCylinderLayerInit : XRLayerInit {
  XRRigidTransform? transform;
  float radius = 2.0;
  float centralAngle = 0.78539;
  float aspectRatio = 2.0;
  boolean isStatic = false;
};

dictionary XREquirectLayerInit : XRLayerInit {
  XRRigidTransform? transform;
  float radius = 0;
  float centralHorizontalAngle = 6.28318;
  float upperVerticalAngle = 1.570795;
  float lowerVerticalAngle = -1.570795;
  boolean isStatic = false;
};

dictionary XRCubeLayerInit : XRLayerInit {
  DOMPointReadOnly? orientation;
  boolean isStatic = false;
};

dictionary XRLayerInit {
  required XRSpace space;
  required unsigned long viewPixelWidth;
  required unsigned long viewPixelHeight;
  XRLayerLayout layout = "mono";
  boolean depth = false;
  boolean stencil = false;
  boolean alpha = true;
};

enum XRTextureType {
  "texture",
  "texture-array"
};

enum XRLayerLayout {
  "default",
  "mono",
  "stereo",
  "stereo-left-right",
  "stereo-top-bottom"
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/webxr/#xrwebgllayer-interface

typedef (WebGLRenderingContext or
         WebGL2RenderingContext) XRWebGLRenderingContext;

dictionary XRWebGLLayerInit {
  boolean antialias = true;
  boolean depth = true;
  boolean stencil = false;
  boolean alpha = true;
  boolean ignoreDepthValues = false;
  double framebufferScaleFactor = 1.0;
};

[SecureContext, Exposed=Window, Pref="dom.webxr.enabled"]
interface XRWebGLLayer: XRLayer {
  [Throws] constructor(XRSession session,
              XRWebGLRenderingContext context,
              optional XRWebGLLayerInit layerInit = {});
  // Attributes
  readonly attribute boolean antialias;
  readonly attribute boolean ignoreDepthValues;

  [SameObject] readonly attribute WebGLFramebuffer? framebuffer;
  readonly attribute unsigned long framebufferWidth;
  readonly attribute unsigned long framebufferHeight;

  // Methods
  XRViewport? getViewport(XRView view);

  // // Static Methods
  // static double getNativeFramebufferScaleFactor(XRSession session);
};

partial interface WebGLRenderingContext {
    [Pref="dom.webxr.enabled"] Promise<undefined> makeXRCompatible();
};
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

// https://immersive-web.github.io/layers/#xrwebglsubimagetype
[SecureContext, Exposed=Window, Pref="dom.webxr.layers.enabled"]
interface XRWebGLSubImage : XRSubImage {
  [SameObject] readonly attribute WebGLTexture colorTexture;
  [SameObject] readonly attribute WebGLTexture? depthStencilTexture;
  readonly attribute unsigned long? imageIndex;
  readonly attribute unsigned long textureWidth;
  readonly attribute unsigned long textureHeight;
};
