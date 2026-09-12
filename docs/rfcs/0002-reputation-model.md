# RFC-0002: Evidence-Backed Reputation

Status: **Draft**

## Problem

A scalar trust score is easy to game, hard to interpret, and dangerous if treated as permission.

## Proposal

Represent reputation as a vector derived from attributable evidence.

```text
R = {
  identity_confidence,
  provenance_confidence,
  behavioral_reliability,
  policy_compliance,
  security_posture,
  economic_reliability,
  domain_scores,
  anomaly_score,
  uncertainty
}
```

## Requirements

- evidence remains separately auditable;
- reputation is recomputable;
- scores are contextual;
- uncertainty is explicit;
- negative evidence can be appealed;
- score ownership is non-transferable by default;
- policy versions are recorded.

## Attacks to solve

- reciprocal reputation farming
- compromised evidence issuers
- false accusations
- strategic good behavior before defection
- domain hopping
- whitewashing
- collusive corroboration

## Open questions

1. Which dimensions are universal vs domain-specific?
2. What evidence should decay?
3. How should inherited lineage risk appear?
4. Can selective disclosure preserve privacy while proving minimum standing?
