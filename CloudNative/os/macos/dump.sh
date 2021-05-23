Found a device of class VoodooHDADevice: IOService:/AppleACPIPlatformExpert/PCI0@0/AppleACPIPCI/B0D3@3/VoodooHDADevice


Probing codec #0...
 HDA Codec #0: Intel (Unknown)
 HDA Codec ID: 0x80862807
       Vendor: 0x8086
       Device: 0x2807
     Revision: 0x00
     Stepping: 0x00
PCI Subvendor: 0x210d1b0a
	startNode=1 endNode=2
	Found audio FG nid=1 startNode=2 endNode=9 total=7

Processing audio FG cad=0 nid=1...
Powering up...
Parsing audio FG...
GPIO: 0x00000000 NumGPIO=0 NumGPO=0 NumGPI=0 GPIWake=0 GPIUnsol=0
 nid  5 0x58560010 as  1 seq  0 Digital-out   None  Digital Special Internal Unknown misc 0
 nid  6 0x18560020 as  2 seq  0 Digital-out   Jack  Digital Special Internal Unknown misc 0
 nid  7 0x58560030 as  3 seq  0 Digital-out   None  Digital Special Internal Unknown misc 0
Parsing vendor patch...
Nodes patching. Codec = 0 
NumNodes = 0
VHDevice NID= 2 Config=00000000 (audio output  ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 3 Config=00000000 (audio output  ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 4 Config=00000000 (audio output  ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 5 Config=58560010 (pin: Digital-o) Cap=09000094 Ctrl=00000000 -- Conns: 0=2
VHDevice NID= 6 Config=18560020 (pin: Digital-o) Cap=09000094 Ctrl=00000000 -- Conns: 0=3
VHDevice NID= 7 Config=58560030 (pin: Digital-o) Cap=09000094 Ctrl=00000000 -- Conns: 0=4
VHDevice NID= 8 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
Disabling nonaudio...
Disabling useless...
Patched pins configuration:
 nid  5 0x58560010 as  1 seq  0 Digital-out   None  Digital Special Internal Unknown misc 0 [DISABLED]
 nid  6 0x18560020 as  2 seq  0 Digital-out   Jack  Digital Special Internal Unknown misc 0
 nid  7 0x58560030 as  3 seq  0 Digital-out   None  Digital Special Internal Unknown misc 0 [DISABLED]
Parsing pin associations...
1 associations found:
Association 0 (2) out:
 Pin nid=6 seq=0
   Redir type=-1 jack=0 def=0
Building AFG tree...
Tracing association 0 (2)
 Tracing pin 6 with min nid 0
   nid 3 returned 3
  nid 6 returned 3
 Pin 6 traced to DAC 3
Association 0 (2) trace succeeded
Tracing input monitor
Tracing other input monitors
Tracing beeper
Disabling unassociated widgets...
Disabling nonselected inputs...
Disabling useless...
Disabling crossassociated connections...
Disabling useless...
Binding associations to channels...
Assigning names to signal sources...
Parsing Ctls...
Assigning mixers to the tree...
Preparing pin controls...
AFG commit...
Creating PCM devices...
pcmAttach: HDA Intel (Unknown) PCM #0 DisplayPort at cad 0 nid 1
+--------------------------------------+
| DUMPING PCM Playback/Record Channels |
+--------------------------------------+

Playback:

     Stream cap: 0x00000005
                 AC3 PCM
        PCM cap: 0x001e07f0
                 16 20 24 32 bits, 32 44 48 88 96 176 192 KHz
            DAC: 3

+-------------------------------+
| DUMPING Playback/Record Paths |
+-------------------------------+

Playback:

    nid=6 [pin: Digital-out (HDMI)]
      |
      + <- nid=3 [audio output] [src: pcm] bindSeq=00000001


+-------------------------+
| DUMPING Volume Controls |
+-------------------------+

Master Volume (OSS: vol)
   |
   +- control  1 (nid   6 out):    dir - out oss: vol, pcm mute

PCM Volume (OSS: pcm)
   |
   +- control  1 (nid   6 out):    dir - out oss: vol, pcm mute

OSS mixer initialization...
Registering PCM channels...
FG config/quirks: forcestereo ivref50 ivref80 ivref100 ivref
HP switch init...

+-------------------+
| DUMPING HDA NODES |
+-------------------+

Default Parameter
-----------------
         IN amp: 0x00000000
        OUT amp: 0x00000000

            nid: 2 [DISABLED]
           Name: audio output
     Widget cap: 0x00006611
                 PWR DIGITAL 8CH
     Stream cap: 0x00000005
                 AC3 PCM
        PCM cap: 0x001e07f0
                 16 20 24 32 bits, 32 44 48 88 96 176 192 KHz

            nid: 3
           Name: audio output
     Widget cap: 0x00006611
                 PWR DIGITAL 8CH
    Association: 0 (0x00000001)
            OSS: pcm (pcm)
     Stream cap: 0x00000005
                 AC3 PCM
        PCM cap: 0x001e07f0
                 16 20 24 32 bits, 32 44 48 88 96 176 192 KHz

            nid: 4 [DISABLED]
           Name: audio output
     Widget cap: 0x00006611
                 PWR DIGITAL 8CH
     Stream cap: 0x00000005
                 AC3 PCM
        PCM cap: 0x001e07f0
                 16 20 24 32 bits, 32 44 48 88 96 176 192 KHz

            nid: 5 [DISABLED]
           Name: pin: Digital-out (HDMI)
     Widget cap: 0x0040778d
                 PWR DIGITAL UNSOL 8CH
        Pin cap: 0x09000094
                 PDC OUT HDMI DP HBR
     Pin config: 0x58560010
    Pin control: 0x00000000
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x00 0x00]
    connections: 1 enabled 1
          |
          + <- nid=2 [audio output] [DISABLED]

            nid: 6
           Name: pin: Digital-out (HDMI)
     Widget cap: 0x0040778d
                 PWR DIGITAL UNSOL 8CH
    Association: 0 (0x00000001)
        Pin cap: 0x09000094
                 PDC OUT HDMI DP HBR
     Pin config: 0x18560020
    Pin control: 0x00000040 OUT
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x00 0x00]
    connections: 1 enabled 1
          |
          + <- nid=3 [audio output]

            nid: 7 [DISABLED]
           Name: pin: Digital-out (HDMI)
     Widget cap: 0x0040778d
                 PWR DIGITAL UNSOL 8CH
        Pin cap: 0x09000094
                 PDC OUT HDMI DP HBR
     Pin config: 0x58560030
    Pin control: 0x00000000
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x00 0x00]
    connections: 1 enabled 1
          |
          + <- nid=4 [audio output] [DISABLED]

            nid: 8 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000


Found a device of class VoodooHDADevice: IOService:/AppleACPIPlatformExpert/PCI0@0/AppleACPIPCI/HDEF@1B/VoodooHDADevice


Probing codec #0...
 HDA Codec #0: Realtek ALC269
 HDA Codec ID: 0x10ec0269
       Vendor: 0x10ec
       Device: 0x0269
     Revision: 0x02
     Stepping: 0x02
PCI Subvendor: 0x210a1b0a
	startNode=1 endNode=2
	Found audio FG nid=1 startNode=2 endNode=36 total=34

Processing audio FG cad=0 nid=1...
Powering up...
Parsing audio FG...
GPIO: 0x40000002 NumGPIO=2 NumGPO=0 NumGPI=0 GPIWake=0 GPIUnsol=1
 nid 18 0x40000000 as  0 seq  0 Line-out      None  Unknown N/A     External Unknown misc 0
 nid 20 0x90170110 as  1 seq  0 Speaker       Fixed Analog  N/A     Internal Unknown misc 0 NoPresenceDetect
 nid 21 0x0421101f as  1 seq 15 Headphones    Jack  1/8     Right   External Black   misc 0
 nid 23 0x411111f0 as 15 seq  0 Speaker       None  1/8     Rear    External Black   misc 0 NoPresenceDetect
 nid 24 0x04a11020 as  2 seq  0 Microphone    Jack  1/8     Right   External Black   misc 0
 nid 25 0x90a70130 as  3 seq  0 Microphone    Fixed Analog  N/A     Internal Unknown misc 0 NoPresenceDetect
 nid 26 0x411111f0 as 15 seq  0 Speaker       None  1/8     Rear    External Black   misc 0 NoPresenceDetect
 nid 27 0x411111f0 as 15 seq  0 Speaker       None  1/8     Rear    External Black   misc 0 NoPresenceDetect
Patching widget caps nid=29 0x00400400 -> 0x00700400
 nid 30 0x411111f0 as 15 seq  0 Speaker       None  1/8     Rear    External Black   misc 0 NoPresenceDetect
Parsing vendor patch...
Nodes patching. Codec = 0 
NumNodes = 0
VHDevice NID= 2 Config=00000000 (audio output  ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 3 Config=00000000 (audio output  ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 4 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 5 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 6 Config=00000000 (audio output  ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 7 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID= 8 Config=00000000 (audio input   ) Cap=00000000 Ctrl=00000000 -- Conns: 0=35
VHDevice NID= 9 Config=00000000 (audio input   ) Cap=00000000 Ctrl=00000000 -- Conns: 0=34
VHDevice NID=10 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=11 Config=00000000 (audio mixer   ) Cap=00000000 Ctrl=00000000 -- Conns: 0=24 1=25 2=26 3=27 4=29
VHDevice NID=12 Config=00000000 (audio mixer   ) Cap=00000000 Ctrl=00000000 -- Conns: 0=2 1=11
VHDevice NID=13 Config=00000000 (audio mixer   ) Cap=00000000 Ctrl=00000000 -- Conns: 0=3 1=11
VHDevice NID=14 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=15 Config=00000000 (audio mixer   ) Cap=00000000 Ctrl=00000000 -- Conns: 0=2 1=11
VHDevice NID=16 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=17 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=18 Config=40000000 (pin: Line-out ) Cap=00000020 Ctrl=00000000 -- Conns:
VHDevice NID=19 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=20 Config=90170110 (pin: Speaker () Cap=00010014 Ctrl=00000000 -- Conns: 0=12 1=13
VHDevice NID=21 Config=0421101f (pin: Headphone) Cap=0001001c Ctrl=00000000 -- Conns: 0=12 1=13
VHDevice NID=22 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=23 Config=411111f0 (pin: Speaker () Cap=00000010 Ctrl=00000000 -- Conns: 0=15
VHDevice NID=24 Config=04a11020 (pin: Microphon) Cap=00003734 Ctrl=00000020 -- Conns: 0=12 1=13
VHDevice NID=25 Config=90a70130 (pin: Microphon) Cap=00003734 Ctrl=00000020 -- Conns: 0=12 1=13
VHDevice NID=26 Config=411111f0 (pin: Speaker () Cap=0000373c Ctrl=00000020 -- Conns: 0=12 1=13
VHDevice NID=27 Config=411111f0 (pin: Speaker () Cap=00003734 Ctrl=00000020 -- Conns: 0=12 1=13
VHDevice NID=28 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=29 Config=00000000 (beep widget   ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=30 Config=411111f0 (pin: Speaker () Cap=00000010 Ctrl=00000040 -- Conns: 0=6
VHDevice NID=31 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=32 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=33 Config=00000000 (vendor widget ) Cap=00000000 Ctrl=00000000 -- Conns:
VHDevice NID=34 Config=00000000 (audio mixer   ) Cap=00000000 Ctrl=00000000 -- Conns: 0=24 1=25 2=26 3=27 4=29 5=11 6=18
VHDevice NID=35 Config=00000000 (audio mixer   ) Cap=00000000 Ctrl=00000000 -- Conns: 0=24 1=25 2=26 3=27 4=29 5=11
Disabling nonaudio...
Disabling useless...
 Disabling nid 11 connection 2 due to disabled child widget.
 Disabling nid 11 connection 3 due to disabled child widget.
 Disabling nid 15 due to all it's consumers disabled.
 Disabling nid 34 connection 2 due to disabled child widget.
 Disabling nid 34 connection 3 due to disabled child widget.
 Disabling nid 34 connection 6 due to disabled child widget.
 Disabling nid 35 connection 2 due to disabled child widget.
 Disabling nid 35 connection 3 due to disabled child widget.
Patched pins configuration:
 nid 18 0x40000000 as  0 seq  0 Line-out      None  Unknown N/A     External Unknown misc 0 [DISABLED]
 nid 20 0x90170110 as  1 seq  0 Speaker       Fixed Analog  N/A     Internal Unknown misc 0 NoPresenceDetect
 nid 21 0x0421101f as  1 seq 15 Headphones    Jack  1/8     Right   External Black   misc 0
 nid 23 0x411111f0 as 15 seq  0 Speaker       None  1/8     Rear    External Black   misc 0 NoPresenceDetect [DISABLED]
 nid 24 0x04a11020 as  2 seq  0 Microphone    Jack  1/8     Right   External Black   misc 0
 nid 25 0x90a70130 as  3 seq  0 Microphone    Fixed Analog  N/A     Internal Unknown misc 0 NoPresenceDetect
 nid 26 0x411111f0 as 15 seq  0 Speaker       None  1/8     Rear    External Black   misc 0 NoPresenceDetect [DISABLED]
 nid 27 0x411111f0 as 15 seq  0 Speaker       None  1/8     Rear    External Black   misc 0 NoPresenceDetect [DISABLED]
 nid 30 0x411111f0 as 15 seq  0 Speaker       None  1/8     Rear    External Black   misc 0 NoPresenceDetect [DISABLED]
Parsing pin associations...
3 associations found:
Association 0 (1) out:
 Pin nid=20 seq=0
 Pin nid=21 seq=15
   Redir type=0 jack=15 def=0
Association 1 (2) in:
 Pin nid=24 seq=0
   Redir type=-1 jack=0 def=0
Association 2 (3) in:
 Pin nid=25 seq=0
   Redir type=-1 jack=-1 def=0
Building AFG tree...
Tracing association 0 (1)
 Tracing pin 20 with min nid 0
    nid 2 returned 2
   nid 12 returned 2
    nid 3 returned 3
   nid 13 returned 3
  nid 20 returned 2
 Pin 20 traced to DAC 2
 Tracing pin 21 with min nid 0 and hpredir 0
    nid 2 returned 2
   nid 12 returned 2
  nid 21 returned 2
 Pin 21 traced to DAC 2 and hpredir 0
Association 0 (1) trace succeeded
Tracing association 1 (2)
 Tracing pin 24 to ADC 8
  tracing via nid 24
   tracing via nid 11
    tracing via nid 12
    nid 12 busy by association 0
    tracing via nid 13
     tracing via nid 20
     nid 20 busy by association 0
     tracing via nid 21
     nid 21 busy by association 0
     tracing via nid 24
     nid 24 returned 0
     tracing via nid 25
     nid 25 returned 0
    nid 13 returned 0
    tracing via nid 34
     tracing via nid 9
     nid 9 returned 0
    nid 34 returned 0
    tracing via nid 35
     tracing via nid 8
     nid 8 returned 1
    nid 35 returned 1
   nid 11 returned 1
   tracing via nid 34
    tracing via nid 9
    nid 9 returned 0
   nid 34 returned 0
   tracing via nid 35
    tracing via nid 8
    nid 8 returned 1
   nid 35 returned 1
  nid 24 returned 1
 Pin 24 traced to ADC 8
Association 1 (2) trace succeeded
Tracing association 2 (3)
 Tracing pin 25 to ADC 9
  tracing via nid 25
   tracing via nid 11
   nid 11 busy by association 1
   tracing via nid 34
    tracing via nid 9
    nid 9 returned 1
   nid 34 returned 1
   tracing via nid 35
   nid 35 busy by association 1
  nid 25 returned 1
 Pin 25 traced to ADC 9
Association 2 (3) trace succeeded
Tracing input monitor
 Tracing nid 11 to out
  tracing via nid 11
   tracing via nid 12
   nid 12 found output association 0
   tracing via nid 13
    tracing via nid 20
    nid 20 found output association 0
    tracing via nid 21
    nid 21 found output association 0
    tracing via nid 24
    nid 24 busy by input association 1
    tracing via nid 25
    nid 25 busy by input association 2
   nid 13 returned 1
   tracing via nid 34
   nid 34 busy by input association 2
   tracing via nid 35
   nid 35 busy by input association 1
  nid 11 returned 1
 nid 11 is input monitor
 Tracing nid 34 to out
  tracing via nid 34
   tracing via nid 9
   nid 9 busy by input association 2
  nid 34 returned 0
 Tracing nid 35 to out
  tracing via nid 35
   tracing via nid 8
   nid 8 busy by input association 1
  nid 35 returned 0
Tracing other input monitors
 Tracing nid 24 to out
  tracing via nid 24
   tracing via nid 11
   nid 11 busy by input association 1
   tracing via nid 34
   nid 34 busy by input association 2
   tracing via nid 35
   nid 35 busy by input association 1
  nid 24 returned 0
 Tracing nid 25 to out
  tracing via nid 25
   tracing via nid 11
   nid 11 busy by input association 1
   tracing via nid 34
   nid 34 busy by input association 2
   tracing via nid 35
   nid 35 busy by input association 1
  nid 25 returned 0
Tracing beeper
 Tracing nid 29 to out
  tracing via nid 29
   tracing via nid 11
   nid 11 busy by input association 1
   tracing via nid 34
   nid 34 busy by input association 2
   tracing via nid 35
   nid 35 busy by input association 1
  nid 29 returned 0
Disabling unassociated widgets...
Disabling nonselected inputs...
Disabling useless...
 Disabling nid 13 connection 0 due to disabled child widget.
 Disabling nid 13 due to all it's consumers disabled.
Disabling crossassociated connections...
 Disabling connection input mixer nid 34 conn 5 to monitor 11.
 Disabling connection input mixer nid 35 conn 5 to monitor 11.
Disabling useless...
Binding associations to channels...
Assigning names to signal sources...
Parsing Ctls...
Assigning mixers to the tree...
Preparing pin controls...
AFG commit...
Creating PCM devices...
pcmAttach: HDA Realtek ALC269 PCM #0 Analog at cad 0 nid 1
+--------------------------------------+
| DUMPING PCM Playback/Record Channels |
+--------------------------------------+

Playback:

     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e0560
                 16 20 24 bits, 44 48 96 192 KHz
            DAC: 2

Record:

     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e0560
                 16 20 24 bits, 44 48 96 192 KHz
            ADC: 8

+-------------------------------+
| DUMPING Playback/Record Paths |
+-------------------------------+

Playback:

    nid=20 [pin: Speaker (Analog)]
      |
      + <- nid=12 [audio mixer] bindSeq=00008001
             |
             + <- nid=2 [audio output] [src: pcm] bindSeq=00008001

             + <- nid=11 [audio mixer] bindSeq=00000001
                    |
                    + <- nid=24 [pin: Microphone (Black Right)] [src: mic] bindSeq=00000001

                    + <- nid=25 [pin: Microphone (Analog)] [src: monitor] bindSeq=00000001

                    + <- nid=29 [beep widget]

    nid=21 [pin: Headphones (Black Right)]
      |
      + <- nid=12 [audio mixer] bindSeq=00008001
             |
             + <- nid=2 [audio output] [src: pcm] bindSeq=00008001

             + <- nid=11 [audio mixer] bindSeq=00000001
                    |
                    + <- nid=24 [pin: Microphone (Black Right)] [src: mic] bindSeq=00000001

                    + <- nid=25 [pin: Microphone (Analog)] [src: monitor] bindSeq=00000001

                    + <- nid=29 [beep widget]

Record:

    nid=8 [audio input]
      |
      + <- nid=35 [audio mixer] [src: mix] bindSeq=00000001

             |
             + <- nid=24 [pin: Microphone (Black Right)] [src: mic] bindSeq=00000001

             + <- nid=25 [pin: Microphone (Analog)] [src: monitor] bindSeq=00000001

             + <- nid=29 [beep widget]

Input Mix:

    nid=34 [audio mixer]
      |
      + <- nid=24 [pin: Microphone (Black Right)] [src: mic] bindSeq=00000001

      + <- nid=25 [pin: Microphone (Analog)] [src: monitor] bindSeq=00000001

      + <- nid=29 [beep widget]

    nid=35 [audio mixer]
      |
      + <- nid=24 [pin: Microphone (Black Right)] [src: mic] bindSeq=00000001

      + <- nid=25 [pin: Microphone (Analog)] [src: monitor] bindSeq=00000001

      + <- nid=29 [beep widget]

+-------------------------+
| DUMPING Volume Controls |
+-------------------------+

Master Volume (OSS: vol)
   |
   +- control  1 (nid   2 out):    dir - out oss: vol, pcm -65/+0dB (88 steps)
   +- control  4 (nid  11 in   0): dir - in oss: vol, igain -34/+12dB (32 steps) + mute
   +- control  5 (nid  11 in   1): dir - in oss: vol, igain -34/+12dB (32 steps) + mute
   +- control  6 (nid  11 in   4): dir - in oss: vol, speaker, igain -34/+12dB (32 steps) + mute
   +- control  7 (nid  12 in   0): dir - out oss: vol, pcm mute
   +- control  8 (nid  12 in   1): dir - out oss: vol, igain mute
   +- control  9 (nid  20 out):    dir - out oss: vol mute
   +- control 10 (nid  21 out):    dir - out oss: vol mute

PCM Volume (OSS: pcm)
   |
   +- control  1 (nid   2 out):    dir - out oss: vol, pcm -65/+0dB (88 steps)
   +- control  7 (nid  12 in   0): dir - out oss: vol, pcm mute

Microphone Volume (OSS: mic)
   |
   +- control 12 (nid  24 in   0): dir - in oss: mic +0/+30dB (4 steps)
   +- control 19 (nid  35 in   0): dir - in oss: mic, rec mute

Microphone2 Volume (OSS: monitor)
   |
   +- control 20 (nid  35 in   1): dir - in oss: rec, monitor mute

Speaker/Beep Volume (OSS: speaker)
   |
   +- control  6 (nid  11 in   4): dir - in oss: vol, speaker, igain -34/+12dB (32 steps) + mute
   +- control 21 (nid  35 in   4): dir - in oss: speaker, rec mute

Recording Level (OSS: rec)
   |
   +- control  2 (nid   8 in   0): dir - in oss: mix, rec -17/+30dB (64 steps) + mute
   +- control 19 (nid  35 in   0): dir - in oss: mic, rec mute
   +- control 20 (nid  35 in   1): dir - in oss: rec, monitor mute
   +- control 21 (nid  35 in   4): dir - in oss: speaker, rec mute

Input Mix Level (OSS: mix)
   |
   +- control  2 (nid   8 in   0): dir - in oss: mix, rec -17/+30dB (64 steps) + mute

Input Monitoring Level (OSS: igain)
   |
   +- control  4 (nid  11 in   0): dir - in oss: vol, igain -34/+12dB (32 steps) + mute
   +- control  5 (nid  11 in   1): dir - in oss: vol, igain -34/+12dB (32 steps) + mute
   +- control  6 (nid  11 in   4): dir - in oss: vol, speaker, igain -34/+12dB (32 steps) + mute
   +- control  8 (nid  12 in   1): dir - out oss: vol, igain mute

OSS mixer initialization...
Registering PCM channels...
pcmAttach: HDA Realtek ALC269 PCM #1 Analog at cad 0 nid 1
+--------------------------------------+
| DUMPING PCM Playback/Record Channels |
+--------------------------------------+

Record:

     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e0560
                 16 20 24 bits, 44 48 96 192 KHz
            ADC: 9

+-------------------------------+
| DUMPING Playback/Record Paths |
+-------------------------------+

Record:

    nid=9 [audio input]
      |
      + <- nid=34 [audio mixer] [src: mix] bindSeq=00000001

             |
             + <- nid=24 [pin: Microphone (Black Right)] [src: mic] bindSeq=00000001

             + <- nid=25 [pin: Microphone (Analog)] [src: monitor] bindSeq=00000001

             + <- nid=29 [beep widget]

+-------------------------+
| DUMPING Volume Controls |
+-------------------------+

Microphone Volume (OSS: mic)
   |
   +- control 15 (nid  34 in   0): dir - in oss: mic, rec mute

Microphone2 Volume (OSS: monitor)
   |
   +- control 14 (nid  25 in   0): dir - in oss: monitor +0/+30dB (4 steps)
   +- control 16 (nid  34 in   1): dir - in oss: rec, monitor mute

Speaker/Beep Volume (OSS: speaker)
   |
   +- control 17 (nid  34 in   4): dir - in oss: speaker, rec mute

Recording Level (OSS: rec)
   |
   +- control  3 (nid   9 in   0): dir - in oss: mix, rec -17/+30dB (64 steps) + mute
   +- control 15 (nid  34 in   0): dir - in oss: mic, rec mute
   +- control 16 (nid  34 in   1): dir - in oss: rec, monitor mute
   +- control 17 (nid  34 in   4): dir - in oss: speaker, rec mute

Input Mix Level (OSS: mix)
   |
   +- control  3 (nid   9 in   0): dir - in oss: mix, rec -17/+30dB (64 steps) + mute

OSS mixer initialization...
Registering PCM channels...
FG config/quirks: forcestereo ivref50 ivref80 ivref100 ivref
HP switch init...

+-------------------+
| DUMPING HDA NODES |
+-------------------+

Default Parameter
-----------------
     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e05f0
                 16 20 24 bits, 32 44 48 88 96 192 KHz
         IN amp: 0x00000000
        OUT amp: 0x00000000

            nid: 2
           Name: audio output
     Widget cap: 0x0000041d
                 PWR STEREO
    Association: 0 (0x00008001)
            OSS: pcm (pcm)
     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e0560
                 16 20 24 bits, 44 48 96 192 KHz
     Output amp: 0x00025757
                 mute=0 step=87 size=2 offset=87
     Output val: [0x3F 0x3F]

            nid: 3 [DISABLED]
           Name: audio output
     Widget cap: 0x0000041d
                 PWR STEREO
     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e0560
                 16 20 24 bits, 44 48 96 192 KHz
     Output amp: 0x00025757
                 mute=0 step=87 size=2 offset=87
     Output val: [0x57 0x57]

            nid: 4 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 5 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 6 [DISABLED]
           Name: audio output
     Widget cap: 0x00000611
                 PWR DIGITAL STEREO
     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e05f0
                 16 20 24 bits, 32 44 48 88 96 192 KHz

            nid: 7 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 8
           Name: audio input
     Widget cap: 0x0010051b
                 PWR STEREO
    Association: 1 (0x00000001)
     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e0560
                 16 20 24 bits, 44 48 96 192 KHz
      Input amp: 0x80023f17
                 mute=1 step=63 size=2 offset=23
      Input val: [0x80 0x80] 
    connections: 1 enabled 1
          |
          + <- nid=35 [audio mixer]

            nid: 9
           Name: audio input
     Widget cap: 0x0010051b
                 PWR STEREO
    Association: 2 (0x00000001)
     Stream cap: 0x00000001
                 PCM
        PCM cap: 0x000e0560
                 16 20 24 bits, 44 48 96 192 KHz
      Input amp: 0x80023f17
                 mute=1 step=63 size=2 offset=23
      Input val: [0x80 0x80] 
    connections: 1 enabled 1
          |
          + <- nid=34 [audio mixer]

            nid: 10 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 11
           Name: audio mixer
     Widget cap: 0x0020010b
                 STEREO
    Association: 1 (0x00000001)
            OSS:  (igain)
      Input amp: 0x80051f17
                 mute=1 step=31 size=5 offset=23
      Input val: [0x16 0x16] [0x16 0x16] [0x80 0x80] [0x80 0x80] [0x14 0x14] 
    connections: 5 enabled 3
          |
          + <- nid=24 [pin: Microphone (Black Right)]
          + <- nid=25 [pin: Microphone (Analog)]
          + [DISABLED] <- nid=26 [pin: Speaker (None)] [DISABLED]
          + [DISABLED] <- nid=27 [pin: Speaker (None)] [DISABLED]
          + <- nid=29 [beep widget]

            nid: 12
           Name: audio mixer
     Widget cap: 0x0020010b
                 STEREO
    Association: 0 (0x00008001)
            OSS:  (igain)
      Input amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
      Input val: [0x00 0x00] [0x00 0x00] 
    connections: 2 enabled 2
          |
          + <- nid=2 [audio output]
          + <- nid=11 [audio mixer]

            nid: 13 [DISABLED]
           Name: audio mixer
     Widget cap: 0x0020010b
                 STEREO
    Association: -2 (0x00000000)
      Input amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
      Input val: [0x00 0x00] [0x80 0x80] 
    connections: 2 enabled 1
          |
          + [DISABLED] <- nid=3 [audio output] [DISABLED]
          + <- nid=11 [audio mixer]

            nid: 14 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 15 [DISABLED]
           Name: audio mixer
     Widget cap: 0x0020010a
      Input amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
      Input val: [0x00 0x00] [0x80 0x80] 
    connections: 2 enabled 2
          |
          + <- nid=2 [audio output]
          + <- nid=11 [audio mixer]

            nid: 16 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 17 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 18 [DISABLED]
           Name: pin: Line-out (None)
     Widget cap: 0x0040040b
                 PWR STEREO
        Pin cap: 0x00000020
                 IN
     Pin config: 0x40000000
    Pin control: 0x00000000
      Input amp: 0x00270300
                 mute=0 step=3 size=39 offset=0
      Input val: 

            nid: 19 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 20
           Name: pin: Speaker (Analog)
     Widget cap: 0x0040058d
                 PWR UNSOL STEREO
    Association: 0 (0x00000001)
        Pin cap: 0x00010014
                 PDC OUT EAPD
     Pin config: 0x90170110
    Pin control: 0x00000040 OUT
           EAPD: 0x00000002
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x00 0x00]
    connections: 2 enabled 1
          |
          + <- nid=12 [audio mixer] (selected)
          + [DISABLED] <- nid=13 [audio mixer] [DISABLED]

            nid: 21
           Name: pin: Headphones (Black Right)
     Widget cap: 0x0040058d
                 PWR UNSOL STEREO
    Association: 0 (0x00008000)
        Pin cap: 0x0001001c
                 PDC HP OUT EAPD
     Pin config: 0x0421101f
    Pin control: 0x000000c0 HP OUT
           EAPD: 0x00000002
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x00 0x00]
    connections: 2 enabled 1
          |
          + <- nid=12 [audio mixer] (selected)
          + [DISABLED] <- nid=13 [audio mixer] [DISABLED]

            nid: 22 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 23 [DISABLED]
           Name: pin: Speaker (None)
     Widget cap: 0x0040050c
                 PWR
        Pin cap: 0x00000010
                 OUT
     Pin config: 0x411111f0
    Pin control: 0x00000000
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x80 0x80]
    connections: 1 enabled 1
          |
          + <- nid=15 [audio mixer] [DISABLED]

            nid: 24
           Name: pin: Microphone (Black Right)
     Widget cap: 0x0040058f
                 PWR UNSOL STEREO
    Association: 1 (0x00000001)
            OSS: mic (mic)
        Pin cap: 0x00003734
                 PDC OUT IN VREF[ 50 80 100 GROUND HIZ ]
     Pin config: 0x04a11020
    Pin control: 0x00000025 IN VREFs
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x00 0x00]
      Input amp: 0x00270300
                 mute=0 step=3 size=39 offset=0
      Input val: [0x02 0x02] [0x00 0x00] 
    connections: 2 enabled 0
          |
          + [DISABLED] <- nid=12 [audio mixer] (selected)
          + [DISABLED] <- nid=13 [audio mixer] [DISABLED]

            nid: 25
           Name: pin: Microphone (Analog)
     Widget cap: 0x0040058f
                 PWR UNSOL STEREO
    Association: 2 (0x00000001)
            OSS: monitor (monitor)
        Pin cap: 0x00003734
                 PDC OUT IN VREF[ 50 80 100 GROUND HIZ ]
     Pin config: 0x90a70130
    Pin control: 0x00000025 IN VREFs
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x00 0x00]
      Input amp: 0x00270300
                 mute=0 step=3 size=39 offset=0
      Input val: [0x02 0x02] [0x00 0x00] 
    connections: 2 enabled 0
          |
          + [DISABLED] <- nid=12 [audio mixer] (selected)
          + [DISABLED] <- nid=13 [audio mixer] [DISABLED]

            nid: 26 [DISABLED]
           Name: pin: Speaker (None)
     Widget cap: 0x0040058f
                 PWR UNSOL STEREO
        Pin cap: 0x0000373c
                 PDC HP OUT IN VREF[ 50 80 100 GROUND HIZ ]
     Pin config: 0x411111f0
    Pin control: 0x00000000
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x80 0x80]
      Input amp: 0x00270300
                 mute=0 step=3 size=39 offset=0
      Input val: [0x00 0x00] [0x00 0x00] 
    connections: 2 enabled 2
          |
          + <- nid=12 [audio mixer] (selected)
          + <- nid=13 [audio mixer] [DISABLED]

            nid: 27 [DISABLED]
           Name: pin: Speaker (None)
     Widget cap: 0x0040058f
                 PWR UNSOL STEREO
        Pin cap: 0x00003734
                 PDC OUT IN VREF[ 50 80 100 GROUND HIZ ]
     Pin config: 0x411111f0
    Pin control: 0x00000000
     Output amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
     Output val: [0x80 0x80]
      Input amp: 0x00270300
                 mute=0 step=3 size=39 offset=0
      Input val: [0x00 0x00] [0x00 0x00] 
    connections: 2 enabled 2
          |
          + <- nid=12 [audio mixer] (selected)
          + <- nid=13 [audio mixer] [DISABLED]

            nid: 28 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 29
           Name: beep widget
     Widget cap: 0x00700400
                 PWR
    Association: -2 (0x00000000)
            OSS: speaker (speaker)

            nid: 30 [DISABLED]
           Name: pin: Speaker (None)
     Widget cap: 0x00400781
                 PWR DIGITAL UNSOL STEREO
        Pin cap: 0x00000010
                 OUT
     Pin config: 0x411111f0
    Pin control: 0x00000000
    connections: 1 enabled 1
          |
          + <- nid=6 [audio output] [DISABLED]

            nid: 31 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 32 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00040
                 PROC

            nid: 33 [DISABLED]
           Name: vendor widget
     Widget cap: 0x00f00000

            nid: 34
           Name: audio mixer
     Widget cap: 0x0020010b
                 STEREO
    Association: 2 (0x00000001)
            OSS: mix (mix)
      Input amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
      Input val: [0x00 0x00] [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x00 0x00] [0x00 0x00] [0x80 0x80] 
    connections: 7 enabled 3
          |
          + <- nid=24 [pin: Microphone (Black Right)]
          + <- nid=25 [pin: Microphone (Analog)]
          + [DISABLED] <- nid=26 [pin: Speaker (None)] [DISABLED]
          + [DISABLED] <- nid=27 [pin: Speaker (None)] [DISABLED]
          + <- nid=29 [beep widget]
          + [DISABLED] <- nid=11 [audio mixer]
          + [DISABLED] <- nid=18 [pin: Line-out (None)] [DISABLED]

            nid: 35
           Name: audio mixer
     Widget cap: 0x0020010b
                 STEREO
    Association: 1 (0x00000001)
            OSS: mix (mix)
      Input amp: 0x80000000
                 mute=1 step=0 size=0 offset=0
      Input val: [0x00 0x00] [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x00 0x00] [0x00 0x00] 
    connections: 6 enabled 3
          |
          + <- nid=24 [pin: Microphone (Black Right)]
          + <- nid=25 [pin: Microphone (Analog)]
          + [DISABLED] <- nid=26 [pin: Speaker (None)] [DISABLED]
          + [DISABLED] <- nid=27 [pin: Speaker (None)] [DISABLED]
          + <- nid=29 [beep widget]
          + [DISABLED] <- nid=11 [audio mixer]



