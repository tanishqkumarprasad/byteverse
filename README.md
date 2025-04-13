**🚨 Disaster Management & Offline GPS Tracking System**

**🔍 Problem Statement:** Natural disasters often lead to network failures. During such times, it becomes extremely hard to:

         1.Share your live location,
         2.Request urgent help,
         3.Communicate with people nearby, and
         4.Track supplies or rescue efforts.

**💡 My Solution**
A two-part solution:

**📱 A Flutter-based disaster management app
🛰️ An offline GPS module using Arduino UNO + NEO-6M, which works without internet and sends location data independently**

**📲 App Features**
         1.Choose disaster type: Flood, Earthquake, Fire, Cyclone
         2.Live helicopter and supply status
         3.Bluetooth/Wi-Fi chat with nearby users
         4.Real-time weather alerts
         5.Survival tips & post-disaster feedback
         6.SOS triggering (hardware integrated)

**⚙️ How to Run the App (Flutter)**

         Requirements
         Flutter SDK (3.10+ recommended)
         Android Studio / VSCode
         Android Emulator or physical Android device

**Steps**
         1. Clone the repository:
         git clone https://github.com/your-username/disaster-gps-app.git
         cd disaster-gps-app
         2. Install dependencies:
            flutter pub get
         3. Run on device/emulator:
            flutter run

**🔌 Hardware Setup (Arduino + NEO-6M GPS)**

         🧰 Components Needed
         Arduino UNO board
         NEO-6M GPS Module
         Jumper wires
         (Optional: HC-05 Bluetooth module if sending data to phone wirelessly)

🔧 Wiring (GPS to Arduino)
NEO-6M Pin	      Arduino Pin
VCC	            3.3V or 5V
GND	            GND
TX	               Pin 4
RX	               Pin 3

**📥 Arduino Code**
Upload GPS reading code using SoftwareSerial:

         #include <SoftwareSerial.h>
         #include <TinyGPS++.h>
         
         SoftwareSerial gpsSerial(4, 3); // TX, RX
         TinyGPSPlus gps;
         
         void setup() {
           Serial.begin(9600);
           gpsSerial.begin(9600);
         }
         
         void loop() {
           while (gpsSerial.available()) {
             gps.encode(gpsSerial.read());
             if (gps.location.isUpdated()) {
               Serial.print("Latitude: ");
               Serial.println(gps.location.lat(), 6);
               Serial.print("Longitude: ");
               Serial.println(gps.location.lng(), 6);
             }
           }
         }


**📱 Sending Data to Mobile Phone**
         **Option 1:** USB OTG Serial Monitor App
         
         Connect Arduino to phone using OTG cable.
         Use apps like Serial USB Terminal to view GPS data in real-time.
         
         **Option 2:** HC-05 Bluetooth Module (Optional)
         Connect HC-05 TX → Arduino RX, RX → Arduino TX
         
         Pair with phone
         Use Bluetooth Serial Monitor apps to view GPS data

**📈 Architecture Flow
[Arduino + GPS Module] --> [Phone via USB/Bluetooth] --> [Flutter App Receives Coordinates] --> [Server (via transmitter)] --> [Immediate action]**

****🚁 Future Scope**

         1.Long-range communication (LoRa)
         2.Victim location clustering
         3.Cloud-based dashboard for authorities
         4.Solar-powered standalone GPS tracker**

**👨‍💻 Team Info**
         Project Name: **Disaster Management App**
         
         Team:       **One-Byte**
         Team Lead:  **Tanishq Kumar Prasad**
         
         Built with: Flutter, Arduino UNO and NEO-6M

