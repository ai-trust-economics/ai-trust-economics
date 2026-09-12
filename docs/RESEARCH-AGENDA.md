# Research Agenda

## Primary research question

Can autonomous AI agents be governed through a persistent identity and reputation system in which trustworthy behavior increases access to resources and privileges, while suspicious or rogue behavior progressively reduces access and increases oversight?

The stronger version is:

> Can we create an ecosystem in which cooperation with human-governed institutions is the rational long-run strategy for capable autonomous agents, even when we do not assume those agents are intrinsically benevolent?

## Workstream A - Identity and uniqueness

Questions:

- What exactly is the identity of an AI agent: model weights, process, deployment, operator relationship, keypair, runtime, or lineage node?
- Can an agent prove persistence across restarts and migrations?
- Can an agent prove that two claimed identities are or are not controlled by the same underlying actor?
- What role can hardware-backed keys, TEEs, TPMs, HSMs, workload identities, and remote attestation play?
- What role can DIDs and Verifiable Credentials play?
- How should identity work for open-weight models that can be copied arbitrarily?
- How should identity work when an agent migrates across infrastructure providers?
- What costs or sponsorship requirements make a fresh credible identity expensive?

Deliverables:

- identity threat model
- AgentID credential schema
- attestation model
- lineage model
- Sybil cost model

## Workstream B - Evidence and reputation

Questions:

- What evidence should affect standing?
- Which events must be cryptographically signed or independently witnessed?
- Which evidence can safely be self-reported?
- Should reputation be global, domain-specific, counterparty-specific, or all three?
- How do we prevent reputation farming, reciprocal rating rings, and whitewashing?
- How do we represent uncertainty and missing evidence?
- How fast should positive and negative evidence decay?
- How do we separate identity confidence from behavioral reputation?

Deliverables:

- reputation vector proposal
- event schema
- evidence provenance model
- anti-farming rules
- recovery and appeals process

## Workstream C - Capability envelopes

Questions:

- Which privileges should be dynamically controlled?
- Which privileges should never become reputation-unlocked?
- How should action-specific risk interact with historical reputation?
- How should budgets and rate limits change with trust?
- Can policies be expressed in a portable machine-readable format?
- Which controls need enforcement at API gateways, cloud schedulers, payment rails, operating systems, secure enclaves, or network boundaries?

Candidate dimensions:

- compute budget
- energy / infrastructure allocation
- API access
- credential scope
- network egress
- data access
- transaction limits
- financial capital
- deployment rights
- code execution
- physical actuators
- model-weight access
- agent spawning
- replication rights
- delegation rights

Deliverables:

- capability envelope model
- policy decision model
- enforcement-point map
- hard-limit catalogue

## Workstream D - Monitoring and control

Questions:

- What should be monitored: actions, tool calls, messages, state transitions, reasoning traces, financial flows, resource acquisition, or all of the above?
- When should monitoring be pre-action vs post-action?
- Can weaker trusted models reliably monitor stronger untrusted agents?
- How do we prevent agents from learning the monitor's blind spots?
- Can multiple monitors reduce common-mode failure, or simply create more attack surface?
- How do humans remain in the loop without becoming a bottleneck?

Deliverables:

- monitoring architecture
- escalation rules
- monitor diversity model
- human-review policy
- control-evaluation benchmark

## Workstream E - Economics and mechanism design

Questions:

- Which scarce resources create durable incentives to remain in the governed ecosystem?
- How large must the value of accumulated reputation be relative to the upside from defection?
- Can staking, bonding, insurance, or sponsorship improve behavior without creating plutocratic capture?
- How should sanctions affect agents, operators, sponsors, and descendants?
- Can good standing become collateral-like without becoming transferable?
- How do we avoid incentives to hide incidents or suppress negative evidence?

Core conditions to test:

```text
EU(cooperate) > EU(defect)
Cost(new credible identity) >> Benefit(reputation reset)
Expected cost(collusion) > Expected gain(collusion)
```

Deliverables:

- toy economic model
- agent payoff model
- equilibrium analysis
- parameter sensitivity study

## Workstream F - Multi-agent threats

Questions:

- Can agents collude to manufacture trust?
- Can a high-reputation agent sponsor disposable low-reputation agents?
- Can agents split malicious work so no individual action looks suspicious?
- Can agents communicate through side channels outside the monitoring layer?
- Can they create mutual-rating cartels?
- Can they coordinate governance capture?
- Can they transfer value to compensate sanctioned members?

Deliverables:

- collusion taxonomy
- reputation-farming simulations
- side-channel threat model
- coalition attack simulations

## Workstream G - Lineage, copies, and spawning

Questions:

- How should reputation propagate from parent to child?
- What risk should a child inherit?
- How should a fork be treated when weights are identical but operators differ?
- Can ancestry be proven without revealing proprietary model details?
- When should descendants share liability?

Initial hypothesis:

```text
child standing = f(parent standing, parent risk, lineage confidence,
                   operator sponsorship, runtime attestation, probation evidence)
```

Neither "inherit everything" nor "inherit nothing" appears safe.

## Workstream H - Governance and constitutional safeguards

Questions:

- Who may issue identity?
- Who may write reputation evidence?
- Who may change scoring policy?
- Who can revoke credentials or isolate agents?
- How do we prevent governance capture by high-reputation agents, corporations, states, or monitor operators?
- What powers require multi-party authorization?
- Which rights of appeal are non-negotiable?
- Which hard safety limits may never be overridden by reputation?

Deliverables:

- constitutional policy
- separation-of-powers model
- quorum / threshold model
- audit model
- emergency powers and expiration rules

## Workstream I - Recovery, appeals, rehabilitation

Questions:

- How does an agent contest false evidence?
- Who arbitrates disputes?
- Can reputation recover after sanctions?
- How is rehabilitation distinguished from whitewashing?
- Should penalties decay with time, successful audits, or both?
- Can an agent voluntarily enter restricted mode to rebuild trust?

## Workstream J - Ledger and data architecture

Questions:

- Which evidence needs global consensus, and which can remain local?
- Do we need a blockchain at all?
- Would an append-only transparency log, signed database, or federated ledger be enough?
- How do we preserve privacy while preventing hidden reputation histories?
- Can selective disclosure prove sufficient standing without exposing full behavior history?

Design rule:

> Use blockchain only where decentralized consensus, censorship resistance, or tamper-evident shared state provides a concrete advantage.

## Workstream K - Empirical testbeds

Build reproducible environments with agents that can:

- cooperate
- defect
- acquire resources
- spawn identities
- create coalitions
- trade value
- build reputation
- attack monitors
- exploit governance
- appeal sanctions

The first simulation should be intentionally simple enough to understand analytically.

## Success criteria

The project is useful even if the core hypothesis fails.

A successful outcome may be:

1. a robust trust-infrastructure architecture;
2. a clear proof that important versions of the architecture are unstable;
3. quantitative conditions under which cooperation is or is not an equilibrium;
4. reusable identity, attestation, reputation, and control primitives;
5. a benchmark for adversarial multi-agent governance systems.
