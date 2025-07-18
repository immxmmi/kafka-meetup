# Kafka Cluster mit ZooKeeper (Strimzi)

Dieses Beispiel zeigt einen klassischen Kafka-Cluster mit **ZooKeeper** unter Verwendung von **Strimzi Version 0.40.0**.  
Es dient als Ausgangspunkt für eine spätere Migration auf das neue **KRaft-Modell** (Kafka Raft Metadata Mode), das keinen ZooKeeper mehr benötigt.

## 📌 Warum ZooKeeper?

Früher basierte Apache Kafka auf ZooKeeper zur Verwaltung von Metadaten wie Topics, Partitionen und Controller-Informationen.  
Mit Kafka 3.5+ und Strimzi 0.40+ ist jedoch der neue **KRaft-Modus** verfügbar, der ZooKeeper ablöst.  
Der Wechsel zu KRaft reduziert die Komplexität, verbessert die Stabilität und vereinfacht die Verwaltung.

ZooKeeper ist ein zentrales Koordinationssystem, das verteilte Systeme synchron hält.  
In Kafka übernimmt es Aufgaben wie:
- die Wahl des Controller-Brokers
- das Verwalten von Topic- und Partition-Metadaten
- die Registrierung von Broker-Instanzen
- die Steuerung von Replikationsstatus und Partition-Leaders

Obwohl ZooKeeper über Jahre hinweg stabil funktioniert hat, bringt es zusätzliche Abhängigkeiten und erschwert dynamisches Scaling und Cloud-native Deployments.  
Deshalb wurde mit dem KRaft-Modus ein integriertes Metadatenmanagement in Kafka selbst entwickelt.

Dieses Repository stellt eine Testumgebung bereit, die auf dem folgenden 

## ⚠ Voraussetzungen für spätere Migration

- **Strimzi Version:** mindestens `0.40.0`
- **Kafka Version:** mindestens `3.7.0`
- **Backup:** Daten (Topics, Nachrichten, Konfiguration) vorher sichern
- **Testumgebung:** vor Live-Migration unbedingt testen

## ✅ Ziel

Der Cluster in diesem Verzeichnis ist die **Startversion mit ZooKeeper**, um:
- die Kafka-Basisfunktion zu testen
- einige Beispiel-Topics zu erzeugen
- und später die Migration auf KRaft besser nachvollziehen zu können

In einem separaten Verzeichnis (`kafka-kraft`) wird später der KRaft-basierte Cluster aufgebaut und dokumentiert.