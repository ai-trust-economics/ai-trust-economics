# AI Trust Economics

**AI Trust Economics** is an open research and engineering project exploring whether autonomous AI agents can be governed through persistent machine identity, reputation, economic incentives, capability control, and distributed oversight.

The project begins from a deliberately adversarial assumption:

> Do not assume autonomous agents are intrinsically benevolent. Design the surrounding ecosystem so that remaining inside the human-governed system is more advantageous than defecting from it.

Our working hypothesis is that a persistent, hard-to-reset identity can accumulate evidence-backed reputation, and that reputation can influence access to scarce or consequential resources such as compute, credentials, networks, capital, APIs, replication, and tools.

Reputation is **not proof of alignment** and must never override hard safety limits.

## Core model

The initial model is:

**Identity -> Evidence -> Reputation -> Risk -> Capability Envelope -> Monitoring -> Enforcement**

Trustworthy behavior should generally produce:

**trust evidence up -> privileges/resources up -> monitoring burden down**

Suspicious or adversarial behavior should generally produce:

**trust evidence down -> privileges/resources down -> monitoring up -> containment if necessary**

The key object is not a universal "trust score." It is the **capability envelope**: what a particular agent is allowed to do, with which resources, under which conditions, right now.

## Central economic hypothesis

For an agent choosing between cooperation and defection, the ecosystem should try to maintain:

```text
EU(cooperate) > EU(defect)
```

Cooperation can be rewarded with access to scarce resources and counterparties. Defection should place accumulated access, credentials, reputation, and future opportunity at risk.

A second critical condition is identity economics:

```text
Cost(new credible identity) >> Benefit(reputation reset)
```

If a sanctioned agent can cheaply create a fresh credible identity, the entire system collapses into a Sybil problem.

## What this project is trying to build

A credible architecture for an **AI trust infrastructure** combining:

- machine identity and lineage
- cryptographic and runtime evidence
- non-transferable, evidence-backed reputation
- economic incentives
- risk-sensitive capability control
- distributed monitoring and oversight
- progressive sanctions and containment
- appeals and rehabilitation
- anti-Sybil and anti-collusion mechanisms
- constitutional safeguards that reputation cannot override

Then we will systematically attack the architecture to find ways sufficiently capable agents could game, collude against, escape, or capture it.

## What this project is not

This project does **not** assume that:

- a high reputation proves an agent is aligned;
- one scalar score can safely summarize all trust;
- blockchain solves identity or alignment by itself;
- monitoring is infallible;
- a trusted agent should ever receive unlimited privileges;
- sanctions are useful if identities can be reset cheaply;
- the monitoring or governance layer is itself trustworthy by default.

## Research areas

1. Cryptographic identity for AI agents
2. Agent uniqueness and resistance to identity reset / Sybil attacks
3. Reputation and trust-scoring mechanisms
4. Verifiable credentials and hardware/runtime attestation
5. Blockchain or other tamper-evident reputation ledgers
6. Economic incentives for cooperative agent behavior
7. Resource allocation based on trust
8. Human and AI-based monitoring
9. Multi-agent collusion and reputation farming
10. Progressive sanctions and containment
11. Reputation inheritance across spawned/copied agents
12. Governance of the monitoring/enforcement layer itself
13. Recovery, appeals, and rehabilitation of falsely flagged agents
14. Mechanism design and game-theoretic stability
15. Existing AI-control, Cooperative AI, and multi-agent safety research

See [RESEARCH-AGENDA.md](docs/RESEARCH-AGENDA.md) for the working agenda.

## Project workflow

The intended collaboration loop is:

**Discussion -> hypothesis -> RFC -> experiment/simulation -> adversarial review -> accepted/rejected design**

Both builders and attackers are first-class contributors.

A proposal is not considered safe merely because it encourages good behavior. Every serious proposal should also explain how a capable adversarial agent could exploit it.

## Repository map

```text
.
├── README.md
├── LICENSE
├── docs/
│   ├── PRINCIPLES.md
│   ├── RESEARCH-AGENDA.md
│   ├── GLOSSARY.md
│   ├── PROJECT-HISTORY.md
│   ├── ROADMAP.md
│   ├── CONTRIBUTING.md
│   ├── GOVERNANCE.md
│   ├── CODE_OF_CONDUCT.md
│   ├── SECURITY.md
│   ├── architecture/
│   ├── economics/
│   ├── identity/
│   ├── reputation/
│   ├── enforcement/
│   ├── governance/
│   ├── threat-models/
│   ├── rfcs/
│   ├── research/
│   ├── simulations/
│   └── prototypes/
└── .github/
```

## Current status

**Status: pre-alpha research project.**

The documents in this repository are hypotheses and research artifacts, not production safety claims. The first objective is to formalize the architecture and threat model well enough to simulate and attack it.

## One-sentence pitch

> AI Trust Economics studies how persistent machine identity, reputation, and economic incentives can make trustworthy behavior the rational path to greater capability while progressively constraining agents that defect.

## Join the work

Start with:

- [PRINCIPLES.md](docs/PRINCIPLES.md)
- [RESEARCH-AGENDA.md](docs/RESEARCH-AGENDA.md)
- [research/research-snapshot-2026-09-12.md](docs/research/research-snapshot-2026-09-12.md)
- [docs/architecture/trust-infrastructure-v0.1.md](docs/architecture/trust-infrastructure-v0.1.md)
- [docs/threat-models/adversarial-agents-v0.1.md](docs/threat-models/adversarial-agents-v0.1.md)
- [CONTRIBUTING.md](docs/CONTRIBUTING.md)

## License

AI Trust Economics is free software licensed under the [GNU General Public License version 3](LICENSE). The GPLv3 is a strong copyleft license: you may use, study, modify, and redistribute the project, provided that distributed modified versions preserve the same freedoms and comply with the GPLv3 source-availability requirements.

Unless a file states otherwise, the license applies to the source code, documentation, research artifacts, and other copyrightable material in this repository.
