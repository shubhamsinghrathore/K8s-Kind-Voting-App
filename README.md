# k8s-kind-voting-app

A sample cloud-native voting application designed to demonstrate Kubernetes orchestration using [kind](https://kind.sigs.k8s.io/). This project showcases a microservices-based architecture with .NET, Redis, PostgreSQL, and Kubernetes.

---

## Architecture Overview

```
+----------------+      +----------------+      +------------------+
|                |      |                |      |                  |
|   Web Frontend +----->+   API Server   +----->+   PostgreSQL DB  |
|  (Voting App)  |      | (.NET Core)    |      |                  |
|                |      |                |      +------------------+
+----------------+      |                |
                        |                |      +------------------+
                        |                +----->+   Redis Cache    |
                        |                |      |                  |
                        +----------------+      +------------------+
                                |
                                v
                        +----------------+
                        |    Worker      |
                        | (.NET Worker)  |
                        +----------------+
```

- **Web Frontend**: User interface for voting and viewing results.
- **API Server**: Handles business logic, connects to Redis and PostgreSQL.
- **Redis**: Caching layer for fast vote tallying.
- **PostgreSQL**: Persistent storage for votes and results.
- **Worker**: Background service for processing votes from Redis to PostgreSQL.

---

## Features

- Vote for your favorite option in real-time.
- Results update live using Redis pub/sub.
- Scalable microservices, each in its own container.
- Easily deployable to a local Kubernetes cluster using kind.

---

## Prerequisites

- [Docker](https://www.docker.com/)
- [kind](https://kind.sigs.k8s.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [.NET 7 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/7.0)

---

## Getting Started

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-org/k8s-kind-voting-app.git
   cd k8s-kind-voting-app
   ```

2. **Build Docker images:**
   ```sh
   docker build -t voting-app-frontend ./frontend
   docker build -t voting-app-api ./api
   docker build -t voting-app-worker ./worker
   ```

3. **Create a kind cluster:**
   ```sh
   kind create cluster --name voting-app
   ```

4. **Deploy to Kubernetes:**
   ```sh
   kubectl apply -f k8s/
   ```

5. **Access the app:**
   - Find the service URL using `kubectl get svc`.

---

## Project Structure

```
k8s-kind-voting-app/
├── api/         # .NET Core API server
├── frontend/    # Web frontend (React/Angular/etc.)
├── worker/      # .NET Worker service
├── k8s/         # Kubernetes manifests
└── README.md
```

---




## Monitoring Dashboards

### Grafana
![Grafana Dashboard](./grafana.png)

### Prometheus
![Prometheus Dashboard](./prometheus.png)

## Technologies Used

- .NET 7
- StackExchange.Redis
- Npgsql (PostgreSQL)
- Newtonsoft.Json
- Kubernetes (kind)
- Docker

---

## License

MIT License


