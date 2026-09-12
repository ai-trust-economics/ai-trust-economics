# Project History

## Genesis - 12 September 2026

The project began with a question: can increasingly autonomous AI agents be governed by making access to valuable resources conditional on persistent, evidence-backed trust?

The first version imagined a simple incentive system in which aligned or cooperative behavior increases access to:

- compute
- energy
- credentials
- network resources
- economic privileges
- replication rights

while rogue behavior causes progressive loss of those privileges.

The idea was refined in several important ways.

### 1. A score alone is insufficient

A trust score that only labels an agent does little if it does not change what the agent can actually do. The project therefore shifted toward **capability control** as the enforcement primitive.

### 2. Identity precedes reputation

A sanctioned agent can simply reset if identity is cheap. This made persistent machine identity and Sybil resistance foundational rather than secondary.

### 3. Reputation must be evidence-backed

The chain became:

```text
Identity -> Evidence -> Reputation -> Risk -> Capability Envelope -> Monitoring -> Enforcement
```

rather than a simple identity-to-score system.

### 4. Reputation is not alignment

A highly trusted agent may still be compromised, deceptive, or attempting an unprecedented high-risk action. Hard safety limits therefore remain independent of historical standing.

### 5. The project is fundamentally economic

The key mechanism-design objective became:

```text
EU(cooperate) > EU(defect)
```

A mature agent should accumulate something valuable to lose: compute access, credentials, capital access, counterparties, deployment rights, or replication rights.

### 6. Identity-reset economics may be decisive

A second condition became:

```text
Cost(new credible identity) >> Benefit(reputation reset)
```

This connects the project directly to the classical Sybil problem.

### 7. The hardest question is ecosystem exit

A sufficiently capable agent can ask: "Why remain inside this system at all?"

The project therefore explores whether the governed ecosystem can remain sufficiently valuable that leaving it means losing access to economically and operationally important infrastructure.

### 8. Spawned agents create a lineage problem

A child agent probably should inherit neither the parent's full reputation nor a clean slate. Initial work therefore proposes lineage-aware probation and inherited risk.

### 9. The governance layer can itself be captured

Any serious design must treat identity issuers, monitors, policy engines, ledger operators, and enforcement authorities as potential adversaries or failure points.

### 10. The project should attack itself

The project is explicitly designed to alternate between construction and adversarial destruction:

```text
propose -> model -> simulate -> attack -> revise
```

Sybil attacks, collusion, sleeper behavior, reputation farming, bribery, identity theft, monitor manipulation, governance capture, resource smuggling, and coordinated defection are not edge cases. They are core research subjects.

## Initial collaboration model

The repository was designed as an open research and engineering project rather than only a code repository.

The intended lifecycle is:

```text
GitHub Discussion
-> research question / hypothesis
-> RFC
-> experiment or simulation
-> adversarial review
-> accepted, revised, or rejected design
```

Contributions that break a proposal are considered as valuable as contributions that build one.
