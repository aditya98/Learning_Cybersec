1. Identify the balance of in-house, community, and proprietary components
2. Introduce SLO and measuring success
3. Understand resilience and reliability by design
4. Learn about balancing security, availability, and experience
5. Design for iteration on applications and systems
6. Design with defense in depth

The architecture of a system can be considered the choices that are harder to change, the patterns we follow as we make implementation decisions.

There are components that are *architecture components* that require group consensus, the elements of the shared understanding between employees on the way systems work, and work  
together. 

There are also components that are not so architecturally bound. These *non-architecturally bound* components are often specific to a function or vendor, fitting well within the architecture.

_Cloud Native_ means that a particular application or system was designed for distributed systems. _Cloud Native Compute Foundation_ (CNCF) approves the cloud native applications

code that can on-demand construct the virtual machines, containers, as well as bare-metal  
(direct to hardware) is commonly referred to as _Infrastructure-as-Code_ (IaC).
IAC means we are writing all of the configuration and using the chosen tools to create the  
infrastructure from code.


|Systems Component|Example IaC tool|
|---|---|
|Boot medium|Hashicorp Packer|
|Provisioning|Hashicorp Terraform|
|Configuration|Ansible|
|State enforcement|Monit|

> Table 1 - Example IaC component stack

The _boot medium_ is the install disk that installs the operating system to hardware or virtual machine. To make the boot medium as-code, we need to write up the automation to generate the boot medium file as code. A tool like _Hashicorp Packer_ does exactly this.

The _provisioning_ is the process of allocating hardware to an operating system and installing the operating system. To make the provisioning as code, we need to write the automation for the installation process of  the operating system as code. _Hashicorp Terraform_ can be  
used for this.

The _configuration_ is the installation and configuration of files within the operating system after it is installed. To make the configuration as code we need to write the automation of the  
configuration of applications and operating systems as code. A tool like _Ansible_ can be used for configuration.

The state enforcement is ensuring that the desired state of the machine is maintained and does not drift. To make state-enforcement as code, we need to write the automation for enforcing the state of our operating systems and applications. A tool like _Monit_ may be  
used for this.

All of these layers combined provide a full picture of infrastructure as code, allowing entire datacenters to be represented in text files that are the code and configuration files that are needed to build everything in that infrastructure from the operating systems up.

The SDLC is the writing and testing of code, publishing and distribution, maintenance, and deprecation of components. If a component doesn't have a healthy SDLC, it carries a  
much higher risk to security vulnerabilities, supply chain attacks, and other issues.

A component with a good SDLC has engaged developers, ensuring that the component is meeting the needs of the users. While it is possible that a component with no SDLC will do fine untouched for the rest of its use, long into the future, that type of component is likely to be a simple, well-designed program with a more trivial code base. A component that doesn't have an SDLC at all may also be _End-of-Life_ (EOL), meaning it is no longer maintained.

The SDLC of proprietary products might be better or worse than a given open source equivalent, so we should investigate how frequently patches and bug fixes are developed and delivered, as well as the operational costs of making changes to that component for updates.

Many organizations utilize a _Continuous Integration and Continuous Deployment_ (CICD) pipeline to build the environments.



>Cloud as an IT infrastructure system that abstracts the creation of resources on a fault-tolerant,  geographically distributed, and scalable infrastructure.
>Let's break down that definition a bit more.
- **Abstracts the creation of resources**: A cloud infrastructure must  
    have an easy-to-use method that can be automated for creating  
    resources, whether they are servers, storage, networks, etc.
- **Fault-tolerant**: The cloud infrastructure must be stable and  
    free from frequent interruptions.
- **Geographically distributed**: A cloud infrastructure in a single  
    location cannot be fault-tolerant. For this reason, it must be  
    geographically distributed.
- **Scalable infrastructure**: Finally, the infrastructure must be  
    able to quickly grow for the organization’s needs.

Each internal component or product should have a defined SDLC and release process, not only to ensure that changes are auditable, but so bugs and vulnerabilities are being fixed appropriately.

_Integration_ is the act of incorporating changes and new components into the systems. 
_Deployment_ is the movement and configuration of applications and systems from developer code, to running production systems. 
CI and CD are very popular because they include automation and testing of changes. 
An organization doesn't have to have CICD implemented, but likely wants to. We may choose to use just CI and not CD, or just CD and not CI; however, we most commonly want them both.

A _secret_ is different from _sensitive data_ in this context.  Secrets are encryption keys, passwords, and access credentials,  while sensitive data is anything else like _Personally Identifiable  
Information_ (PII) that we don't want exposed.


With centralization and PKI scopes aligned, we have unified identity within that centralization scope. The result of this is that management of data and identity are homogeneous within that scope.

These temporary, short-lived, systems are called _ephemeral_ systems. Systems which can be spun-up or down based on the requirement of the parties, like e.g. Amazon sale requires huge processing and we need a lot of servers to handle the capacity, but once things return to normal, we want to destroy those servers

As more components have become code-based, abstracting further away from hardware, it has become increasingly easier to create ephemeral systems. Ephemeral means capable of existing for short periods of time and then vanishing. Ephemeral systems can be created and destroyed repeatedly, because they rely on other systems or code that can create and destroy them quickly. Not all ephemeral systems are equally ephemeral. Some systems will classify a very specific type of service as ephemeral, even when all of the services are ephemeral to some degree.

Despite it's name, serverless doesn't mean there isn't a server involved, but instead means that the server isn't required to be customer-managed or customer-specific. Serverless is possible by having the server store the required customer function and host a separate API, and that API can create a very ephemeral instance that executes a custom function on demand, then terminates.

Many systems benefit from being designed to be short-lived. The benefit of making it possible for a system to be short-lived is that it can be faster to rebuild it, potentially decreasing maintenance  
complications.

Controls only need to be strong enough for a given moment in time, no control is perfect and no control is impossible to bypass Perfection is not attainable in security, only sufficient balance.

## CCNF Landscape

The cloud native world is vast, with many thousands of people and  organizations involved in creating components we can use to create our clouds. As we have learned, selecting which components to use is an important part of the process. We will look at an example component  
selection, as well as where to find the larger cloud native component lists.

https://landscape.cncf.io/

## Cloud Design and Patterns

Two types of architectures are employed generally while designing cloud architecture. These design patterns are a result of many trials and errors from different organisations.

2 Major types of Architectures are:
1. Microservice Architecture
2. Zero-trust Architecture

### Microservice Architecture
Microservices are not a single specification, but a design pattern. Microservice architecture is designed for loosely-coupled, purpose-built, modular services. Microservices work together to
accomplish the overall service tasks, rather than having a single monolithic service doing everything. Microservices don't have to be small, but typically are. What is more important than the size of a microservice, is the function of the service in regard to the whole of the system.

There are many security benefits that can come from the modular nature of microservices. We can apply hardening, networking, and isolation to each microservice rather than having to be more permissive with a larger application. Further, if one microservice has a vulnerability, we may be able to more easily patch that microservice compared to a singular large service.

Microservices require certain abstraction while logging and retrieving to not overload the users and get the requisite output. The logging output of each microservice is critical, but we also don't  want to expose everything in excruciating detail. Part of microservice design is what we describe as hiding complexity behind abstraction.  
The idea with this hiding is that the really complicated stuff can  be within the microservice, and that other microservices and people  should not need to know about that complexity in order to use or call  that microservice. So rather than forcing each other microservice  to learn all the inner workings of a new microservice to call it, we want to present a simple and standardized HTTP or _Remote Procedure  Call_ (RPC) API, both over TLS, with functions that can be called using standard protocols and specifications. We commonly will use gRPC for RPC APIs, and REST for HTTP APIs. The logs can then log the function being called and whether that function was successful or not, along with a short but helpful error message if there was a problem. Then the developers or maintainers of that microservice can use the log data, find the function that had an error, and debug from there.

### Zero Trust Architecture

_Zero Trust_ means that each request for a resource requires validation that the system or person requesting it is appropriate. _Zero Trust Architecture_ (ZTA) is when zero trust is part of the systems design. Both zero trust and ZTA are design responses to architectures that have security on the perimeter but very little security within the network, enabling devices within a network segment  
to be treated as trusted systems. In zero trust, we eliminate that implicit trust within each network segment.

Instead of allowing systems within a network to access resources in that network, in zero trust we perform authentication, then authorization for each resource request. The result of this is that  
in order for a person or software to use any resource, the identity of that person or software must first be confirmed with authentication, after which short term access is authorized, commonly via a token.

A common way to build up ZTA is to use _Open ID Connect_ (OIDC) to create _federated access_. Federated access means that if the authoritative identity service is active in the end user browser,  
then they are authorized already for any federated services. This is commonly encountered as a "sign in with Google" button.

|Component Area|Example|
|---|---|
|Physical hardware|TPM and disk encryption|
|Physical possession|Yubikey or card with reader|
|Proof of knowledge|Security questions|
|Short-lived access|JWT and Kerberos|
|Identity|Cryptographic signatures|
|Files and data|AES256 encryption|
|Audit and monitor|Privacy preserving logging|

> Table 3 - Layers of security and examples

### Cloud Architecture examples


Eliminating single points of failure is a continuous effort for clouds of all sizes. Many medium sized clouds also frequently have legacy systems connected to them, potentially including some virtual machines that do not have GSLB or automatic failover
