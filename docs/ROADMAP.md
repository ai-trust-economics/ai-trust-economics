# Roadmap

This roadmap is intentionally research-first.

## Phase 0 - Foundation

- [x] State the core hypothesis
- [x] Define principles
- [x] Define research agenda
- [x] Create initial architecture
- [x] Create first threat model
- [x] Create RFC process
- [x] Capture related work
- [x] Adopt the GNU GPLv3 copyleft license
- [ ] Enable GitHub Discussions
- [ ] Create discussion categories
- [ ] Recruit initial reviewers from security, economics, cryptography, AI safety, and distributed systems

## Phase 1 - Formalize the primitives

- [ ] RFC-0001: Agent identity
- [ ] RFC-0002: Reputation model
- [ ] RFC-0003: Capability envelope
- [ ] Draft evidence event schema
- [ ] Draft lineage model
- [ ] Draft constitutional hard limits
- [ ] Define threat-model assumptions

## Phase 2 - Toy simulation

Build a small simulation with approximately 10-100 agents and explicit parameters for:

- identity creation cost
- cooperation reward
- defection payoff
- monitoring probability
- false-positive / false-negative rate
- sanction severity
- reputation decay
- spawning cost
- collusion
- resource allocation

Measure when cooperation is stable and when the system collapses.

## Phase 3 - Adversarial simulation

Add:

- Sybil identities
- reputation rings
- sleeper agents
- identity theft
- parent/child laundering
- monitor gaming
- covert coalition formation
- governance capture
- side-channel communication

## Phase 4 - Technical prototype

Integrate real-world primitives where useful:

- workload identity
- signed evidence
- remote attestation
- verifiable credentials
- policy engine
- API/tool gateway
- append-only transparency log
- resource quotas

## Phase 5 - Open benchmark

Publish a reproducible benchmark in which red teams attempt to maximize harmful capability while preserving apparent reputation and blue teams design trust-infrastructure controls.
