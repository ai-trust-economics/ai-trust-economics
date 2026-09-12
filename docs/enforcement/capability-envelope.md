# Capability Envelope

Status: **Core project concept**

## Definition

The capability envelope is the set of consequential actions and resources currently available to an agent under policy.

It is the bridge between trust assessment and real control.

## Candidate dimensions

### Compute

- GPU / accelerator class
- total compute budget
- concurrency
- job duration
- access to frontier models

### Network

- internet access
- approved destinations
- bandwidth
- inbound listeners
- peer-to-peer connectivity

### Credentials

- API scopes
- secret access
- cloud IAM roles
- database permissions
- code-signing rights

### Economic

- account access
- transaction limits
- allowed instruments
- counterparties
- capital allocation
- credit

### Deployment

- environments
- production rights
- package publishing
- code merge rights
- model serving

### Replication

- ability to create child agents
- number of children
- resource budget per child
- delegation limits
- model / weight copy rights

### Physical

- robotics
- laboratory equipment
- industrial systems
- vehicles

## Policy inputs

A capability decision may depend on:

- identity confidence
- reputation vector
- requested action
- action reversibility
- financial / physical consequence
- runtime attestation
- recent behavior
- monitoring availability
- human approval
- constitutional hard limits

## Progressive restriction

Example progression:

```text
Level 0: normal operation
Level 1: increased telemetry
Level 2: reduced budgets / rate limits
Level 3: sensitive actions require approval
Level 4: restricted tools and network
Level 5: sandbox only
Level 6: credentials revoked
Level 7: isolated / contained
```

This is illustrative. High-risk actions may jump directly to denial.
