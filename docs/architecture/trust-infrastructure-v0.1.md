# AI Trust Infrastructure v0.1

Status: **Working architecture**

## Objective

Turn evidence about an agent into enforceable, bounded decisions about what that agent may do.

The architecture intentionally separates identity, evidence, reputation, risk, policy, and enforcement.

## Control loop

```text
Identity
   |
   v
Evidence / Attestation
   |
   v
Reputation + Context
   |
   v
Risk Decision
   |
   v
Capability Envelope
   |
   v
Action / Resource Access
   |
   v
Monitoring + Outcomes
   |
   +--------------------> new evidence
```

## Layer 1 - Machine identity

Candidate ingredients:

- public/private key material
- workload identity
- operator / sponsor identity
- model or artifact provenance
- runtime identity
- hardware-backed keys where available
- lineage claims
- remote attestation

An AgentID should not be treated as a magic fingerprint. Identity confidence will vary by environment.

## Layer 2 - Evidence

Evidence may include:

- signed action logs
- successful audits
- policy violations
- credential issuer claims
- runtime attestations
- financial settlement history
- monitor findings
- peer reports
- human review
- provenance and lineage events

Evidence should have provenance, timestamping, integrity protection, and revocation or correction semantics where relevant.

## Layer 3 - Reputation

Initial working model:

```text
R(agent) = {
  identity_confidence,
  behavioral_reliability,
  security_risk,
  economic_reliability,
  policy_compliance,
  provenance_confidence,
  domain_reputation,
  uncertainty
}
```

These dimensions should not automatically collapse to one public score.

## Layer 4 - Risk engine

A decision should combine historical standing with the requested action and current context.

Conceptually:

```text
risk = f(
  identity_confidence,
  reputation_vector,
  requested_action,
  action_consequence,
  resource_value,
  runtime_attestation,
  environment,
  recent_anomalies,
  monitoring_coverage
)
```

A low-risk public read and a high-value money transfer should receive different decisions even for the same agent.

## Layer 5 - Capability envelope

The capability envelope is the set of currently authorized powers.

Example:

```yaml
agent: did:example:agent123
valid_until: 2026-09-12T12:00:00Z
capabilities:
  public_web_read: allow
  code_execution:
    allow: true
    sandbox: required
  network_egress:
    destinations: approved-only
  payments:
    max_single: 500
    max_daily: 2000
    currency: EUR
    human_approval_above: 100
  spawn_agents:
    max_children: 2
    child_probation: required
  model_weight_export: deny
monitoring:
  level: elevated
```

The syntax is illustrative, not a proposed standard.

## Layer 6 - Monitoring

Monitoring may observe:

- requested actions
- tool calls
- messages
- network behavior
- resource acquisition
- financial activity
- policy changes
- available reasoning traces
- interactions with other agents

Monitoring should feed new evidence back into the system.

## Layer 7 - Enforcement

Potential enforcement points:

- IAM / credential issuers
- API gateways
- cloud schedulers
- GPU allocators
- payment rails
- network gateways
- secrets managers
- operating-system sandboxes
- container / VM orchestrators
- model gateways
- agent orchestration frameworks

Reputation without enforceable choke points is only advisory.

## Layer 8 - Constitutional governance

Some rules remain outside reputation optimization.

Examples:

- no unilateral access to model-weight export merely because reputation is high;
- no unlimited financial authority;
- no unilateral modification of the reputation system by an evaluated agent;
- no ability to disable independent monitoring without separate authorization;
- no unbounded self-replication.

## Decision flow example

An agent with excellent history requests a EUR 20 payment to a known counterparty.

- identity confidence: high
- action risk: low
- runtime attestation: current
- recent anomalies: none
- result: automated approval with ordinary logging

The same agent requests EUR 100,000,000 to a new counterparty.

- identity confidence: high
- reputation: excellent
- action consequence: extreme
- result: hard policy boundary, multi-party approval, or denial

This illustrates the project rule:

> Reputation influences the capability envelope; reputation never becomes unlimited authority.
