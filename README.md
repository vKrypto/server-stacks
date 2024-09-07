# Tech Stack Architectures

This repository contains various tech stack architectures with configurations for different environments. Each stack is implemented with the following deployment methods:

1. **[Docker Compose](#docker-compose)**: Quick and easy deployment for local environments.
2. **[Docker Stack (Swarm)](#docker-stack-swarm)**: Scalable architecture using Docker Swarm.
3. **[Docker Stack (Kubernetes)](#docker-stack-kubernetes)**: Using Kubernetes for production-grade container orchestration.
4. **[Kubernetes](#kubernetes)**: Pure Kubernetes YAML configurations.
5. **[Terraform](#terraform)**: Infrastructure as Code (IaC) for deploying the architecture on cloud platforms.
6. **[Ansible](#ansible)**: Automating stack setup and configurations for smoother deployment processes.

Feel free to use and customize these stacks according to your project's needs.

## Contents

### 1. [Server Monitoring Stacks](#server-monitoring-stacks)
#### a) [ELK Stack (Elasticsearch, Logstash, Kibana)](#elk-stack)
- Docker Compose, Docker Stack (Swarm), Docker Stack (Kubernetes), Kubernetes, Terraform, and Ansible configurations for setting up centralized logging and monitoring using ELK.

#### b) [Prometheus & Grafana](#prometheus-grafana)
- Configurations for server and application monitoring using Prometheus for metrics collection and Grafana for visualization, available in multiple environments.

### 2. [Server Technology Stacks](#server-technology-stacks)
#### a) [MEAN/MERN/Vue.js Stack](#mean-mern-vuejs-stack)
- **MEAN Stack** (MongoDB, Express.js, Angular, Node.js)
- **MERN Stack** (MongoDB, Express.js, React, Node.js)
- **Vue.js Stack** (MongoDB, Express.js, Vue.js, Node.js)

#### b) [Django Stack](#django-stack)
- A Python-based web development framework with deployment configurations for Docker, Kubernetes, and more.

#### c) [FastAPI Stack](#fastapi-stack)
- High-performance web APIs built with FastAPI, including monitoring and scaling configurations.

#### d) [Next.js Stack](#nextjs-stack)
- Production-ready React framework with both static and server-side rendering capabilities, tailored for various environments.

### 3. [Message Queues](#message-queues)
#### a) [Apache Kafka](#apache-kafka)
- Configurations for message streaming, fault tolerance, and scalability using Kafka.

#### b) [RabbitMQ](#rabbitmq)
- **RabbitMQ**: From basic RabbitMQ setups to advanced deployments using Docker, Kubernetes, and Terraform.
- **RabbitMQ with Celery**: Distributed task queues and worker management.

---

## Deployment Methods

### [Docker Compose](#docker-compose)
Easily deploy and manage stacks in local environments with simple Docker Compose configurations.

### [Docker Stack (Swarm)](#docker-stack-swarm)
Utilize Docker Swarm for scalable, production-ready deployments with service discovery and load balancing.

### [Docker Stack (Kubernetes)](#docker-stack-kubernetes)
Leverage Kubernetes orchestration using Docker Stack for high availability and automatic scaling.

### [Kubernetes](#kubernetes)
Deploy using pure Kubernetes YAML manifests to fully take advantage of Kubernetes' container orchestration capabilities.

### [Terraform](#terraform)
Infrastructure as Code (IaC) for setting up and managing your cloud infrastructure to deploy any of the stacks.

### [Ansible](#ansible)
Automate your infrastructure and application deployment with Ansible playbooks for all supported stacks.

---

## How to Use
Each stack has its own directory containing configuration files, deployment instructions, and any necessary scripts. Follow the instructions in each folder’s `README.md` for detailed setup steps.

## Folder Structure

```
tech-stack-architectures/
│
├── monitoring/
│   ├── elk/
│   │   ├── docker-compose/
│   │   ├── docker-swarm/
│   │   ├── docker-kubernetes/
│   │   ├── kubernetes/
│   │   ├── terraform/
│   │   └── ansible/
│   └── prometheus-grafana/
│       ├── docker-compose/
│       ├── docker-swarm/
│       ├── docker-kubernetes/
│       ├── kubernetes/
│       ├── terraform/
│       └── ansible/
│
├── server-tech/
│   ├── mean/
│   │   ├── docker-compose/
│   │   ├── docker-swarm/
│   │   ├── docker-kubernetes/
│   │   ├── kubernetes/
│   │   ├── terraform/
│   │   └── ansible/
│   ├── mern/
│   │   ├── docker-compose/
│   │   ├── docker-swarm/
│   │   ├── docker-kubernetes/
│   │   ├── kubernetes/
│   │   ├── terraform/
│   │   └── ansible/
│   ├── vuejs/
│   │   ├── docker-compose/
│   │   ├── docker-swarm/
│   │   ├── docker-kubernetes/
│   │   ├── kubernetes/
│   │   ├── terraform/
│   │   └── ansible/
│   ├── django/
│   │   ├── docker-compose/
│   │   ├── docker-swarm/
│   │   ├── docker-kubernetes/
│   │   ├── kubernetes/
│   │   ├── terraform/
│   │   └── ansible/
│   ├── fastapi/
│   │   ├── docker-compose/
│   │   ├── docker-swarm/
│   │   ├── docker-kubernetes/
│   │   ├── kubernetes/
│   │   ├── terraform/
│   │   └── ansible/
│   └── nextjs/
│       ├── docker-compose/
│       ├── docker-swarm/
│       ├── docker-kubernetes/
│       ├── kubernetes/
│       ├── terraform/
│       └── ansible/
│
└── message-queues/
    ├── kafka/
    │   ├── docker-compose/
    │   ├── docker-swarm/
    │   ├── docker-kubernetes/
    │   ├── kubernetes/
    │   ├── terraform/
    │   └── ansible/
    ├── rabbitmq/
    │   ├── docker-compose/
    │   ├── docker-swarm/
    │   ├── docker-kubernetes/
    │   ├── kubernetes/
    │   ├── terraform/
    │   └── ansible/
    └── rabbitmq-celery/
        ├── docker-compose/
        ├── docker-swarm/
        ├── docker-kubernetes/
        ├── kubernetes/
        ├── terraform/
        └── ansible/
```