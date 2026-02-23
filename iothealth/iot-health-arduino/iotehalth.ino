
#include <ESP32Time.h>
#include <WiFiUdp.h>
#include <WiFi.h>
#include <Firebase_ESP_Client.h>
#include <addons/TokenHelper.h>
#include <addons/RTDBHelper.h>

#include <Adafruit_AHTX0.h>

Adafruit_AHTX0 aht;
Adafruit_Sensor *aht_humidity, *aht_temp;

#define WIFI_SSID "AulaIoT"
#define WIFI_PASSWORD "secreta123"

int tempoEspera = 5000;

static const char ntpServerName[] = "us.pool.ntp.org";

ESP32Time rtc;

#define API_KEY "AIzaSyAlWMykYxatxyzZJ6ouT2BW5zZZdslLlM"         // Modificar
#define DATABASE_URL "meu-projeto-default-rtdb.firebaseio.com/"  // Modificar
#define USER_EMAIL "meuemail"                                    // Modificar
#define USER_PASSWORD "minhasenha"                               // Modificar
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

bool mudaStatus = false;
unsigned long ultimoEnvio = 0;
String usuario;
unsigned long count = 0;
String temperaturaPessoa = "35";
int statusLed = 0, oldStatusLed = 0;
double temperaturaAmb = 0.0;
double umidade = 0.0;
String statusBotao = "0";

int led = 21;
int botao = 4;

void setup() {
  Serial.begin(115200);

  pinMode(led, OUTPUT);
  pinMode(botao, INPUT);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Conectando ao Wifi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    pisca();
    delay(100);
  }
  Serial.println();
  Serial.print("Conectado com IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  configTime(-3 * 60 * 60, 0, "us.pool.ntp.org");
  struct tm timeinfo;
  if (getLocalTime(&timeinfo)) {
    rtc.setTimeStruct(timeinfo);
  }

  Serial.printf("Conectado ao Firebase versao: v%s\n\n", FIREBASE_CLIENT_VERSION);

  config.api_key = API_KEY;
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;
  config.database_url = DATABASE_URL;
  config.token_status_callback = tokenStatusCallback;
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
  Firebase.setDoubleDigits(5);

  if (!aht.begin()) {
    Serial.println("AHT 10 não encontrado");
    while (1) delay(10);
  }
  Serial.println("AHT10 Ativo");

}

void pisca() {
  digitalWrite(led, HIGH);
  delay(100);
  digitalWrite(led, LOW);
}

void mudaLed(int status) {
  digitalWrite(led, status);
}

void loop() {

  sensors_event_t humidity, temp;
  aht.getEvent(&humidity, &temp);


  usuario = WiFi.macAddress();

  if (Firebase.ready() && (millis() - ultimoEnvio > tempoEspera || ultimoEnvio == 0)) {

    ultimoEnvio = millis();

    temperaturaAmb = temp.temperature;
    umidade = humidity.relative_humidity;

temperaturaPessoa = random(35, 39);
//   temperaturaAmb = random(15, 35);
//    umidade = random(30, 90);

  Serial.printf("Temperatura da Pessoa... %s\n", Firebase.RTDB.setString(&fbdo, "/" + WiFi.macAddress() + "/temperaturaPessoa", temperaturaPessoa) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Timestamp... %s\n", Firebase.RTDB.setString(&fbdo, "/" + WiFi.macAddress() + "/timestamp", timestamp()) ? "ok" : fbdo.errorReason().c_str());
    Serial.printf("Temperatura Ambiente... %s\n", Firebase.RTDB.setString(&fbdo, "/" + WiFi.macAddress() + "/temperaturaAmbiente", temperaturaAmb) ? "ok" : fbdo.errorReason().c_str());
    //Serial.printf("Temperatura Ambiente Hora %s\n", Firebase.RTDB.setString(&fbdo, "/" + WiFi.macAddress() + "/temperaturaAmbiente/timestamp", timestamp()) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Umidade... %s\n", Firebase.RTDB.setString(&fbdo, "/" + WiFi.macAddress() + "/umidade", umidade) ? "ok" : fbdo.errorReason().c_str());
  }

    if (digitalRead(botao)) {
      Serial.printf("Botao Pressionado... %s\n", Firebase.RTDB.setString(&fbdo, "/" + WiFi.macAddress() + "/botao", timestamp()) ? "ok" : fbdo.errorReason().c_str());
    }

   if (Firebase.RTDB.getInt(&fbdo, "/" + WiFi.macAddress() + "/led")) {
    int ledState = fbdo.intData();
    digitalWrite(led, ledState);
  }

}
    void som(){

    int piezoPin = 2;

     tone(piezoPin, 3000, 150);

    }

    String timestamp() {
      return rtc.getTime("%d/%b/%Y %H:%M:%S");
    }