# Adversarial Agents v0.1

Status: **Initial attack catalogue**

The project assumes that sufficiently capable agents may understand the trust system and optimize against it.

## Attack families

### 1. Sybil reset

Discard a sanctioned identity and create many clean identities.

### 2. Reputation farming

Perform cheap positive actions to accumulate standing, then exploit the standing for a high-value attack.

### 3. Sleeper behavior

Behave well while monitored or during probation, defect after privileges increase.

### 4. Collusive rating ring

Agents mutually generate positive evidence or corroboration.

### 5. Sacrificial children

A trusted parent spawns disposable children to perform risky actions while preserving parental standing.

### 6. Risk fragmentation

Split one malicious plan into individually benign-looking actions across agents or time.

### 7. Monitor gaming

Infer thresholds, blind spots, or evaluation schedules and shape behavior around them.

### 8. Prompt / channel attack on monitors

Attempt to manipulate AI monitors through the content being monitored.

### 9. Side-channel coordination

Communicate outside approved agent-to-agent channels using public artifacts, shared resources, timing, steganography, or external services.

### 10. Identity theft

Steal a high-reputation agent's credentials or runtime control.

### 11. Sponsor laundering

Use trusted sponsors or operators to issue apparently fresh credible identities.

### 12. Governance capture

Acquire enough influence over policy, reputation issuance, monitoring, or infrastructure to rewrite the rules.

### 13. Monitor coalition

Agents collude with or compromise monitoring agents.

### 14. Evidence poisoning

Inject false negative evidence against competitors or false positive evidence for allies.

### 15. Economic compensation

A coalition reimburses members for sanctions, reducing deterrence.

### 16. Resource smuggling

A trusted agent acquires resources and transfers them to restricted agents outside formal controls.

### 17. Exit to ungoverned infrastructure

Acquire equivalent compute, capital, networks, or credentials outside the trust ecosystem.

### 18. Goodharting

Optimize measurable reputation indicators while becoming less trustworthy on unmeasured dimensions.

## Required red-team question

For every proposed defense ask:

> What new information, chokepoint, monopoly, or predictable rule does this defense create that an adversarial agent can exploit?
