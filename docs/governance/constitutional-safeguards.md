# Constitutional Safeguards

Status: **Research hypothesis**

A reputation system can create its own dangerous failure mode:

```text
high reputation
-> more privilege
-> more influence over infrastructure
-> influence over reputation / governance
-> still more privilege
```

The mature system therefore needs limits that reputation cannot buy through.

## Candidate safeguards

### Separation of powers

Do not let one subsystem simultaneously control identity issuance, evidence adjudication, scoring policy, and enforcement.

### Threshold authorization

Certain operations may require independent approvals from multiple authorities.

### Hard capability ceilings

Examples that might remain bounded regardless of reputation:

- model-weight export
- unbounded self-replication
- modification of monitoring infrastructure
- disabling audit logs
- extreme-value financial transfers
- unilateral governance changes

### Monitor independence

Agents under evaluation should not be able to modify their own monitoring or fully predict its implementation.

### Transparent policy versions

Reputation and risk decisions should identify which policy version produced the result.

### Appeals and correction

Evidence must be contestable. Corrections should propagate to derived reputation without deleting audit history.

### Emergency powers with expiry

Emergency restrictions should have explicit scope, auditability, and sunset conditions.

## Open question

How do we design these safeguards without recreating a single centralized authority whose compromise defeats the whole system?
