# Principles

These are working design principles, not immutable doctrine. Changes should be proposed through the RFC process.

## 1. Trust is not alignment

Reputation is a risk signal derived from evidence. It is never proof that an agent is safe, benevolent, truthful, or aligned.

## 2. Reputation is not permission

A highly trusted agent should still face hard limits on high-consequence actions. Reputation may influence a policy decision; it must not erase policy boundaries.

## 3. Control the capability envelope

The useful enforcement primitive is not a label. It is the set of actions, tools, resources, budgets, networks, credentials, and delegation rights available to an agent at a given moment.

## 4. Identity must be expensive to reset

Sanctions are meaningless if an agent can cheaply discard an identity and re-enter with a clean slate. The system must explicitly model identity-reset and Sybil economics.

## 5. Evidence before score

Raw or attestable evidence should be preserved independently of derived reputation. Reputation should be explainable, contestable, and recomputable when policies change.

## 6. Prefer vectors over universal scores

Trust is contextual. Identity confidence, behavioral reliability, security posture, economic reliability, provenance, and domain-specific performance should not automatically collapse into one number.

## 7. Defense in depth

No single monitor, ledger, model, credential issuer, or enforcement point should be assumed infallible.

## 8. Adversarial review is mandatory

Every mechanism proposal should include abuse cases, gaming strategies, collusion strategies, and capture risks.

## 9. Good behavior must remain economically attractive

The ecosystem should attempt to preserve:

```text
EU(cooperate) > EU(defect)
```

This is a design objective, not an assumption.

## 10. Governance must govern the governors

The identity issuers, reputation engines, monitors, policy engines, and enforcement infrastructure are themselves attack surfaces. Their powers must be bounded, auditable, and contestable.

## 11. Sanctions should be progressive where safe

When risk allows, prefer reversible and escalating controls over binary trust/no-trust decisions:

```text
normal
-> increased logging
-> constrained budgets / rate limits
-> approval gates
-> tool or network restrictions
-> sandboxing
-> credential revocation
-> isolation / containment
```

Some actions may always require hard denial regardless of history.

## 12. Recovery must exist

False positives are inevitable. A credible system needs appeals, evidence review, rehabilitation, and restoration procedures without making reputation laundering easy.

## 13. Lineage matters

Spawned or copied agents should not automatically inherit either full parental trust or a perfectly clean slate. Parentage, runtime provenance, operator sponsorship, and inherited risk need explicit treatment.

## 14. Openness does not require naivety

We want open research and adversarial critique. We should still avoid publishing operational details that create immediate, material abuse risk in deployed systems.
