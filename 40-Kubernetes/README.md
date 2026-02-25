M300 - 40 Kubernetes (K8s)
==========================

Diese Wikiseite zeigt beinhaltet eine kleine Einführung in Kubernetes.

#### Lernziele

Sie können einen einfachen Kubernetes Kluster aufsetzen.

#### Voraussetzungen

* [10 Toolumgebung](../10-Toolumgebung/)

#### Inhaltsverzeichnis
* 01 - [Grundbegriffe](#-01---grundbegriffe)
* 02 - [Kubernetes](#-02---kubernetes)
* 03 - [Kubernetes Cluster](#-03---kubernetes-cluster)
* 04 - [Reflexion](#-04---reflexion)
* 05 - [Fragen](Fragen.md)
* 06 - [Kubernetes hands-on](K8s.md)
* 07 - [Quellenverzeichnis](#-07---quellenverzeichnis)

___

![](../images/Kubernetes_36x36.png "Cloud Computing") 01 - Grundbegriffe
======

> [⇧ **Nach oben**](#inhaltsverzeichnis)

### Service Discovery
***
 
Service Discovery ist der Prozess, Clients eines Service mit Verbindungsinformationen (normalerweise IP-Adresse und
Port) einer passenden Instanz davon zu versorgen.

In einem statischen System auf einem Host ist das Problem einfach zu lösen, denn es gibt nur eine Instanz von allem. 

In einem verteilten System mit mehreren Instanzen von Services, die kommen und gehen, ist das aber viel komplizierter. 

Eine Möglichkeit ist, dass der Client einfach den Service über den Namen anfordert (zum Beispiel db oder api) und im Backend dann ein bisschen Magie geschieht, die dazu die passenden Daten liefert. 

Für unsere Zwecke kann Vernetzung als der Prozess des Verknüpfens von Containern betrachtet werden. 

Es geht nicht darum, reale Ethernet-Kabel einzustecken. Containervernetzung beginnt mit der Annahme, dass es eine Route zwischen Hosts
gibt – egal, ob diese Route über das öffentliche Internet läuft oder nur über einen schnellen lokalen Switch.

Mit dem Service Discovery können Clients also Instanzen finden, und die Vernetzung kümmert sich darum, die Verbindungen herzustellen. 

Vernetzungs Service-Discovery-Lösungen haben häufig gemeinsame Funktionalität, da Service-Discovery-Lösungen auf Ziele im Netz verweisen und Vernetzungslösungen häufig auch Service-Discovery-Features enthalten.

Weitere Funktionen von Service Discovery können sein:

* Health Checking
* Failover 
* [Load Balancing](https://de.wikipedia.org/wiki/Lastverteilung_%28Informatik%29)
* Verschlüsselung der übertragenen Daten 
* Isolieren von Containergruppen.

### Lastverteilung (Load Balancing)
***

Mittels Lastverteilung (englisch Load Balancing) werden in der Informatik umfangreiche Berechnungen oder große Mengen von Anfragen auf mehrere parallel arbeitende Systeme verteilt. 

Insbesondere bei Webservern ist eine Lastverteilung wichtig, da ein einzelner Host nur eine begrenzte Menge an HTTP-Anfragen auf einmal beantworten kann. 

Für unsere Zwecke kann Lastverteilung als der Prozess des Verteilens von Anfragen auf verschiedene Container betrachtet werden.

### Cluster
***

Ein [Rechnerverbund oder Computercluster](https://de.wikipedia.org/wiki/Rechnerverbund), meist einfach Cluster genannt (vom Englischen für „Rechner-Schwarm“, „-Gruppe“ oder „-Haufen“), bezeichnet eine Anzahl von vernetzten Computern. 

Der Begriff wird zusammenfassend für zwei unterschiedliche Aufgaben verwendet: 
* die Erhöhung der Rechenkapazität (HPC-Cluster) 
* die Erhöhung der Verfügbarkeit (HA-Cluster, engl. high available - hochverfügbar). 

Die in einem Cluster befindlichen Computer (auch Knoten, vom englischen nodes oder Server) werden auch oft als Serverfarm bezeichnet.

![](../images/Kubernetes_36x36.png "Cloud Computing") 02 - Kubernetes
======

> [⇧ **Nach oben**](#inhaltsverzeichnis)

[![](https://img.youtube.com/vi/PH-2FfFD2PU/0.jpg)](https://www.youtube.com/watch?v=PH-2FfFD2PU)

Kubernetes in 5 Minuten auf YouTube

---

Kubernetes (auch als „K8s“ oder einfach „K8“ bezeichnet - *sprich immer: 'Kuhbernetties'*) ist ein Open-Source-System zur Automatisierung der Bereitstellung, Skalierung und Verwaltung von Container-Anwendungen, das ursprünglich von Google entworfen und an die Cloud Native Computing Foundation gespendet wurde. Es zielt darauf ab, eine „Plattform für das automatisierte Bespielen, Skalieren und Warten von Anwendungscontainern auf verteilten Hosts“ zu liefern. Es unterstützt eine Reihe von Container-Tools, einschließlich Docker.

Die Orchestrierung mittels Kubernetes wird von führenden Cloud-Plattformen wie Microsofts Azure, IBMs Bluemix, Red Hats OpenShift und Amazons AWS unterstützt.

### Merkmale
***

* Immutable (Unveränderlich) statt Mutable.
* Deklarative statt Imperative (Ausführen von Anweisungen) Konfiguration.
* Selbstheilende Systeme - Neustart bei Absturz.
* Entkoppelte APIs – LoadBalancer / Ingress (Reverse Proxy).
* Skalieren der Services durch Änderung der Deklaration.
* Anwendungsorientiertes statt Technik (z.B. Route 53 bis AWS) Denken.
* Abstraktion der Infrastruktur statt in Rechnern Denken.

### Objekte
***

* **Pod** - Ein [Pod](https://kubernetes.io/docs/concepts/workloads/pods/pod/) repräsentiert eine Gruppe von Anwendungs-Containern und Volumes,
die in der gleichen Ausführungsumgebung (gleiche IP, Node) laufen.
* **ReplicaSet**: [ReplicaSets](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/) bestimmen wieviele Exemplare eines Pods laufen und stellen sicher, dass die angeforderte Menge auch verfügbar ist. 
* **Deployment**: [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) erweitern ReplicaSets um deklarative Updates (z.B. von Version 1.0 auf 1.1) von Container Images.
* **Service**: Ein [Service](https://kubernetes.io/docs/concepts/services-networking/service/) steuert den Zugriff auf einen Pod (IP-Adresse, Port). Während Pods (bzw. Images) ersetzt werden können (z.B. durch Update auf neue Version) bleibt ein Service stabil.
* **Ingress**: Ähnlich einem Reverse Proxy ermöglicht ein [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) den Zugriff auf einen Service über einen URL.

Weitere siehe [Kubernetes Concepts](https://kubernetes.io/docs/concepts/).

Unterhaltsame Broschüre mit dem Titel ["Phippy Goes to the Zoo – A Kubernetes Story"](https://azure.microsoft.com/en-us/resources/phippy-goes-to-the-zoo/en-us/), zeigt in der Form eines Kinderbuches wesentliche Objekte von Kubernetes auf.

### Installation
***

Für die Installation verwenden Sie die Anleitung vom Projekt:

* [Kubernetes in Docker](https://github.com/navilg/vagrant-kubernetes)
