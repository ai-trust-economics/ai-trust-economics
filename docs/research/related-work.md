# Related Work

This document maps the project's closest precedents and reusable building blocks. It is not a claim that every cited system is equivalent, deployed, or proven safe. The project should reuse existing standards where possible and state clearly which questions remain open.

## Direct precedents for agent identity, reputation, and control

### SingularityNET

SingularityNET's first whitepaper was written in 2017 and substantially revised in 2019. It describes a decentralized AI-service marketplace with independent evaluators, transaction-derived evidence, staking, multidimensional reputation, fraud detection, reputation-informed resource allocation, and simulation of reputation policies.

Its design includes a base reputation represented as a real number from `0` to `5`, alongside finer-grained reputation dimensions. The base score can affect privileges such as participation in governance. This is direct prior art for the numeric score proposed in RFC-0004, although AI Trust Economics treats absence of an assessment separately from a provisional score and does not make one global score authoritative.

- SingularityNET, whitepaper, revised February 2019
  https://public.singularitynet.io/whitepaper.pdf
- Kolonin, Reputation System Design for SingularityNET, 2018
  https://medium.com/singularitynet/reputation-system-design-for-singularitynet-8b5b61e8ed0e

### ERC-8004: Trustless Agents

ERC-8004 is a draft Ethereum standard for on-chain AI-agent identity, reputation, and validation. It defines:

- an ERC-721-based Identity Registry;
- a Reputation Registry accepting fixed-point feedback values, tags, endpoint context, and optional off-chain evidence references or content hashes;
- a Validation Registry for requests and validator responses;
- integration points for agent protocols, wallets, DIDs, payments, and TEE-based validation.

ERC-8004 deliberately standardizes public signals rather than deciding which reviewers are trustworthy or how a relying system should aggregate reputation. Its security considerations acknowledge Sybil feedback and leave reviewer selection and scoring policy to higher layers. RFC-0004 must therefore be evaluated as a possible policy and attestation profile over, or interoperable with, ERC-8004 rather than as though no agent-specific reputation registry exists.

- ERC-8004: Trustless Agents
  https://eips.ethereum.org/EIPS/eip-8004
- Reference contracts
  https://github.com/erc-8004/erc-8004-contracts

### AgentReputation

AgentReputation proposes an evidence-based, context-aware, and decision-oriented reputation architecture for decentralized AI-agent ecosystems. It separates task execution, reputation services, and tamper-evident persistence; uses context-conditioned reputation cards; records verification regimes; and introduces a policy engine for resource allocation, access control, and adaptive verification based on risk and uncertainty.

This is close to the project's evidence, reputation, risk, and capability-decision pipeline. The most useful research question is therefore not whether contextual agent reputation can be described, but whether a complete implementation remains safe under identity reset, collusion, lineage laundering, monitor compromise, ecosystem exit, and governance capture.

- Chishti, Oyinloye, and Li, AgentReputation: A Decentralized Agentic AI Reputation Framework, 2026
  https://arxiv.org/abs/2605.00073

### Economics of reputation and replaceable identity

"Tempting the Agent" models reputation as intertemporal economic capital that attracts future activity. An agent chooses between continued honest operation and a one-shot deviation followed by an identity reset. The analysis connects opportunistic behavior to identity-reset costs, reputation persistence, demand, enforcement, and staking.

This is direct prior work for the project's conditions `EU(cooperate) > EU(defect)` and `Cost(new credible identity) >> Benefit(reputation reset)`. The project should reproduce or extend this model rather than introduce those conditions only as informal equations.

- Gatta, Naviglio, and Tarantelli, Tempting the Agent: The Economics of Reputation without Persistent Identity in AI Agent Markets, 2026
  https://arxiv.org/abs/2609.02992

### Authenticated delegation and agent authorization

Authenticated Delegation and Authorized AI Agents extends established identity infrastructure such as OAuth 2.0 and OpenID Connect to express authenticated, authorized, and auditable delegation to AI agents. It also proposes translating natural-language permissions into scoped access-control configurations.

This work is directly relevant to the capability envelope, particularly where an agent acts for a human or organization. Delegated authority and behavioral reputation answer different questions and should not be conflated.

- South et al., Authenticated Delegation and Authorized AI Agents, 2025
  https://arxiv.org/abs/2501.09674

### ERC-8273: Attestation-Gated Agentic Actions

ERC-8273 is a draft Ethereum standard for transaction-scoped authorization of an agent action. An attestor can bind a capability and a concrete action digest to an agent, execute the action atomically, and leave a persistent audit record while the active authorization expires at the end of the transaction.

It is narrower than the project's cross-system capability envelope, but it is relevant prior art for converting an assessment into enforceable on-chain authority. It also defines an ERC-8004 integration profile.

- ERC-8273: Attestation-Gated Agentic Actions
  https://eips.ethereum.org/EIPS/eip-8273

### Autonolas / Olas

Olas provides implemented registries for agent components, agent blueprints, and autonomous services. Its contracts include operator bonds, staking, service-level multisig control, and slashing. It demonstrates how registry identity and economic consequences can be connected in a deployed agent-service ecosystem, although it is not a general behavioral reputation or AI-safety framework.

- Autonolas registries
  https://github.com/valory-xyz/autonolas-registries
- Open Autonomy framework
  https://github.com/valory-xyz/open-autonomy

## Foundations in computational trust and distributed reputation

### Computational trust for artificial agents

Marsh's 1994 thesis formalized trust as a context-sensitive computational concept usable by artificial agents and evaluated it in an agent testbed. Later multi-agent systems developed social, witness-based, and multidimensional reputation models.

- Marsh, Formalising Trust as a Computational Concept, 1994
  https://dspace.stir.ac.uk/handle/1893/2010
- Sabater and Sierra, Reputation and Social Network Analysis in Multi-Agent Systems, 2002
  https://dblp.org/rec/conf/atal/SabaterS02.html

### Peer-to-peer reputation and malicious collectives

EigenTrust assigns global trust values from transaction history and uses them to bias access away from malicious peers. Its simulations explicitly include malicious collectives, newcomer treatment, and incentives. It remains important prior art for reputation aggregation, collusion testing, and the risks of pre-trusted participants.

- Kamvar, Schlosser, and Garcia-Molina, The EigenTrust Algorithm for Reputation Management in P2P Networks, 2003
  https://nlp.stanford.edu/pubs/eigentrust.pdf

### Reputation axioms and tradeoffs

Reputation systems cannot generally satisfy every desirable property simultaneously. Axiomatic analysis helps identify hidden tradeoffs before selecting a scoring or aggregation rule.

- Tennenholtz, Reputation Systems: An Axiomatic Approach, 2012
  https://arxiv.org/abs/1207.4163

## Identity, credentials, and attestation

- W3C, Verifiable Credentials Data Model v2.0
  https://www.w3.org/TR/vc-data-model-2.0/
- W3C, Decentralized Identifiers (DIDs) v1.0
  https://www.w3.org/TR/did/
- IETF RFC 9334, Remote ATtestation procedureS (RATS) Architecture
  https://www.rfc-editor.org/rfc/rfc9334.html
- IETF RFC 9711, Entity Attestation Token (EAT)
  https://www.rfc-editor.org/rfc/rfc9711.html
- SPIFFE/SPIRE concepts
  https://spiffe.io/docs/latest/spire-about/spire-concepts/
- Ethereum Attestation Service documentation
  https://docs.attest.org/

## Sybil resistance and identity reset

- Douceur, The Sybil Attack, 2002
  https://www.microsoft.com/en-us/research/publication/the-sybil-attack/
- Adler et al., Personhood Credentials: Artificial Intelligence and the Value of Privacy-Preserving Tools to Distinguish Who Is Real Online, 2024
  https://arxiv.org/abs/2408.07892

Personhood credentials concern human uniqueness rather than unique software agents, but they are relevant to operator sponsorship and rate-limited issuance. They do not solve the problem of determining whether several agent instances share a controller.

## Cooperative AI

- Dafoe et al., Open Problems in Cooperative AI, 2020
  https://arxiv.org/abs/2012.08630
- Cooperative AI Foundation, current research-area guidance
  https://www.cooperativeai.com/grant-guidelines/guidance-on-research-areas

## AI control and monitoring

- Greenblatt et al., AI Control: Improving Safety Despite Intentional Subversion
  https://arxiv.org/abs/2312.06942
- Griffin et al., Games for AI Control
  https://arxiv.org/abs/2409.07985
- Kutasov et al., Evaluating Control Protocols for Untrusted AI Agents
  https://arxiv.org/abs/2511.02997
- Terekhov et al., Adaptive Attacks on Trusted Monitors Subvert AI Control Protocols
  https://arxiv.org/abs/2510.09462
- OpenAI, Detecting misbehavior in frontier reasoning models
  https://openai.com/index/chain-of-thought-monitoring/
- OpenAI, How we monitor internal coding agents for misalignment
  https://openai.com/index/how-we-monitor-internal-coding-agents-misalignment/

## Deception and sleeper behavior

- Hubinger et al., Sleeper Agents: Training Deceptive LLMs that Persist Through Safety Training
  https://arxiv.org/abs/2401.05566

## Multi-agent safety

- Wu et al., Monitoring LLM-based Multi-Agent Systems Against Corruptions via Node Evaluation
  https://arxiv.org/abs/2510.19420

## Governance and risk management

- NIST AI RMF: Generative Artificial Intelligence Profile
  https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence

## Project position

AI Trust Economics does not claim to originate computational trust, numeric reputation, decentralized agent identity, on-chain feedback, attestation-gated actions, or reputation-based incentives. Existing work already supplies each of those ideas and several close combinations.

The project's proposed contribution is an open, protocol-independent adversarial testbed for the complete control loop:

```text
heterogeneous identity and attestation protocols
-> attributable evidence
-> contextual reputation and uncertainty
-> action-specific risk
-> revocable capability envelope
-> monitoring and enforcement
-> new evidence
```

The testbed should compare existing protocols rather than assume one ledger. It should measure whether the composed system remains useful under identity reset, Sybil issuers, reputation farming, sleeper behavior, lineage laundering, collusion, monitor compromise, governance capture, false accusations, and exit to ungoverned infrastructure.

Distinctive research targets include:

- coupling portable reputation to enforceable off-chain and on-chain capability limits;
- modeling spawned and copied agent lineage without claiming metaphysical uniqueness;
- preserving hard safety ceilings that reputation cannot override;
- making issuer selection, policy versions, appeals, and recovery explicit;
- comparing blockchain, transparency-log, Verifiable Credential, and centralized baselines;
- publishing reproducible failure conditions, including results that falsify the project's own hypothesis.

## To research next

- a field-by-field comparison between RFC-0004 and ERC-8004 feedback profiles
- deployed behavior and adoption of existing agent reputation systems
- trust aggregation and issuer-selection algorithms under correlated control
- economic staking / slashing mechanisms and plutocratic capture
- principal-agent theory and repeated games
- mechanism design under collusion
- Byzantine fault tolerance and coalition thresholds
- zero-knowledge proofs and selective disclosure
- capability-based security
- macaroons / attenuated credentials
- policy engines such as OPA / Cedar
- cloud workload identity federation
- confidential computing and TEEs
- software supply-chain provenance (SLSA, in-toto)
- accountability and liability for autonomous systems
