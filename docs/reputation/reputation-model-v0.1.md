# Reputation Model v0.1

Status: **Working hypothesis**

## Principle

Reputation is a derived risk signal, not an intrinsic property of an agent.

## Why not one score?

An agent may be:

- highly reliable at software development;
- poorly attested at runtime;
- financially untested;
- safe for low-impact actions;
- inappropriate for high-impact autonomous deployment.

A universal score can hide these distinctions.

## Candidate vector

```text
R(agent) = {
  identity_confidence,
  provenance_confidence,
  behavioral_reliability,
  policy_compliance,
  security_posture,
  economic_reliability,
  domain_scores,
  anomaly_score,
  evidence_freshness,
  uncertainty
}
```

## Evidence events

Each reputation-relevant event should ideally carry:

- subject identity
- event type
- issuer / observer
- timestamp
- evidence reference or digest
- confidence
- scope / domain
- expiration / decay rule
- correction / revocation status
- privacy classification

## Non-transferability

The project hypothesis favors non-transferable standing. An agent should not be able simply to sell its reputation.

But credentials, ownership, and control can change, so "non-transferable" requires a precise technical and legal definition.

## Negative evidence

Negative evidence may need to propagate faster than positive evidence. However, overly aggressive propagation creates denial-of-service and false-positive attacks.

## Reputation inheritance

Initial principle:

- no automatic full inheritance;
- no automatic clean slate;
- inherit some risk and lineage context;
- require probation for new descendants;
- make sponsorship visible.

## Appeals

Derived reputation should be recomputable after evidence is corrected. The ledger should preserve auditability without making false accusations permanent and unchallengeable.

## Portable assessments

Institutions may publish bounded, domain-specific reputation assessments as signed attestations. The ledger records who made each claim and when; it does not make the claim true or universally authoritative. Relying systems choose which issuers to trust and how to interpret missing, conflicting, expired, challenged, or revoked assessments.

See [RFC-0004: On-Chain Reputation Attestations](../rfcs/0004-onchain-reputation-attestations.md) for the draft proposal and prototype plan.
