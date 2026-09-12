# Identity Threat Model

Status: **Working threat model**

## Problem

A reputation system is only as durable as the identity to which reputation attaches.

The central attack is whitewashing:

```text
behave badly -> lose reputation -> discard identity -> return as new agent
```

## Identity is multi-layered

An AI agent may simultaneously have:

- a model artifact identity
- a model-version identity
- a runtime process identity
- a deployment identity
- a cryptographic key identity
- an operator identity
- an infrastructure identity
- a lineage identity

No single layer solves the problem by itself.

## Threats

### Key copying

If AgentID is only a software keypair, a key can potentially be copied, cloned, sold, or stolen.

### Model copying

Open-weight models can be duplicated perfectly at the artifact level while diverging operationally later.

### Fresh-key reset

A malicious agent generates a new keypair after sanctions.

### Operator laundering

The same underlying operator creates new organizations or sponsors new agents.

### Hardware migration

An agent legitimately moves across hardware and must preserve continuity without making hardware the sole identity.

### Identity theft

A malicious agent gains control of a trusted agent's credentials.

### Shared controller

Many apparent agents are controlled by one hidden principal.

### Split controller

One logical agent distributes itself across many processes to avoid per-agent controls.

### Lineage concealment

A child hides its relationship to a sanctioned parent.

## Candidate primitives to investigate

- asymmetric keys
- hardware-backed keys
- remote attestation
- Entity Attestation Tokens
- workload identity such as SPIFFE/SPIRE
- Verifiable Credentials
- DIDs / controlled identifiers
- operator sponsorship
- transparency logs
- economic bonding
- lineage attestations
- rate-limited credential issuance

## Non-goal

We should not promise metaphysical uniqueness for arbitrary software.

A more realistic target is:

> make claims of persistent, economically useful identity costly to forge, reset, or multiply within participating infrastructure.
