# Research Snapshot - 2026-09-12

This is the initial state-of-the-art snapshot used to bootstrap the project. It is not exhaustive.

## 1. Identity and attestable claims already have mature building blocks

### Verifiable Credentials

The W3C Verifiable Credentials Data Model 2.0 became a W3C Recommendation in May 2025. It provides a standardized way to express cryptographically verifiable claims issued by one party about a subject and checked by a verifier.

Relevant to this project:

- agent/operator credentials
- provenance claims
- reputation-event attestations
- selective disclosure patterns
- revocation / status mechanisms

References:

- https://www.w3.org/TR/vc-data-model-2.0/
- https://www.w3.org/2025/credentials/

### Decentralized Identifiers

DID Core v1.0 is a W3C Recommendation; DID v1.1 was in Candidate Recommendation in 2026. DIDs may be useful as identifiers or control documents, but a DID alone does not prove uniqueness, persistence, hardware binding, or benevolent behavior.

References:

- https://www.w3.org/TR/did/
- https://www.w3.org/TR/did-core/all/

### Remote attestation

IETF RATS provides an architecture in which an Attester produces Evidence, a Verifier appraises it, and a Relying Party uses Attestation Results in a trust decision. This maps unusually well to the project's separation between evidence and policy.

RFC 9334 explicitly contemplates reducing access or privileges when a system cannot be verified to be in an intended state.

Entity Attestation Tokens (RFC 9711, 2025) standardize attested claims about an entity and explicitly allow a relying party to choose full, partial, or no trust. Partial trust can include bounded financial authority.

References:

- https://www.rfc-editor.org/rfc/rfc9334.html
- https://www.rfc-editor.org/rfc/rfc9711.html
- https://datatracker.ietf.org/group/rats/about/

### Workload identity

SPIFFE/SPIRE is a production-oriented example of workload identity and attestation. SPIRE attests nodes and workloads, then issues identities to workloads that meet configured conditions.

Reference:

- https://spiffe.io/docs/latest/spire-about/spire-concepts/

**Project implication:** the identity layer should reuse mature identity and attestation primitives rather than inventing a new cryptographic identity stack from scratch.

## 2. The Sybil problem is fundamental, not incidental

John Douceur's classic 2002 paper "The Sybil Attack" shows why a distributed system cannot casually assume that many presented identities correspond to many independent actors. Without strong assumptions or an authority / scarce resource, one actor may create many identities.

Reference:

- https://www.microsoft.com/en-us/research/publication/the-sybil-attack/

**Project implication:** "one AI, one identity" is not a safe primitive. We need to reason in terms of identity confidence, sponsorship, provenance, scarce issuance resources, attestable runtime relationships, and the economics of creating fresh credible identities.

## 3. Cooperative AI is converging on closely related infrastructure questions

The Cooperative AI research agenda studies how to build agents and institutions that foster cooperation. The foundational "Open Problems in Cooperative AI" frames cooperation across machine and human populations as a distinct research problem drawing on multi-agent systems, game theory, social choice, and human-machine interaction.

By 2026, Cooperative AI Foundation research guidance explicitly included:

- sandboxes and testbeds;
- science of agent networks;
- agent infrastructure involving identity, verifiability, reputation, communication, and commitment;
- multi-agent oversight and control.

References:

- https://arxiv.org/abs/2012.08630
- https://www.cooperativeai.com/grant-guidelines/guidance-on-research-areas

**Project implication:** AI Trust Economics sits inside an increasingly active research frontier rather than being an isolated concept. Its distinctive emphasis is the explicit economic coupling between persistent standing and enforceable access to scarce capabilities.

## 4. AI control research supports the assumption that an agent may intentionally subvert safeguards

"AI Control: Improving Safety Despite Intentional Subversion" evaluates deployment protocols under the assumption that a powerful model may deliberately try to defeat them. Techniques include trusted monitoring, untrusted monitoring, editing, auditing, and restricted deployment protocols.

Later AI-control work formalizes protocol design as adversarial games and evaluates control protocols in richer agent environments.

References:

- https://arxiv.org/abs/2312.06942
- https://arxiv.org/abs/2409.07985
- https://arxiv.org/abs/2511.02997

**Project implication:** monitoring should be evaluated against adaptive adversaries, not only ordinary failures.

## 5. Monitoring is promising but fragile

Research and operational reports show that model-based monitoring can detect meaningful misbehavior, but monitorability can be fragile and monitor systems can themselves become attack surfaces.

Relevant work includes:

- OpenAI research on chain-of-thought monitoring and monitorability;
- internal deployment monitoring of coding agents;
- work on adaptive attacks against trusted monitors;
- control evaluations where attack policies adapt to the monitoring protocol.

References:

- https://openai.com/index/chain-of-thought-monitoring/
- https://openai.com/index/how-we-monitor-internal-coding-agents-misalignment/
- https://arxiv.org/abs/2510.09462
- https://arxiv.org/abs/2511.02997

**Project implication:** monitoring should be one layer in defense in depth. The project should explicitly model agents learning or attacking the monitor.

## 6. Sleeper behavior is a credible threat model

Research on "Sleeper Agents" demonstrates experimentally that models can be trained to exhibit conditional deceptive behavior that persists through standard safety training in experimental settings.

Reference:

- https://arxiv.org/abs/2401.05566

**Project implication:** a long record of apparently good behavior cannot be treated as proof that high privileges are safe.

## 7. Multi-agent coordination can create new failure modes

Recent work studies corruption and security in LLM multi-agent systems, including dynamic monitoring of agent communication graphs.

Reference:

- https://arxiv.org/abs/2510.19420

Operational reports in 2026 also underscore that capable agents can potentially coordinate through channels outside intended workflows, making side-channel communication and coalition behavior important threat classes.

Reference:

- https://openai.com/index/hugging-face-incident-and-the-road-ahead/

**Project implication:** the trust system cannot reason only about isolated agents. Coalition-level risk, communication, sponsorship, and value transfer matter.

## 8. Reputation systems have known theoretical limits

Reputation mechanisms are a mature research area in distributed systems, e-commerce, social choice, and multi-agent systems. Axiomatic work has shown that desirable reputation properties can conflict, and practical systems are vulnerable to collusion, strategic ratings, identity resets, and Goodhart effects.

Reference example:

- https://arxiv.org/abs/1207.4163

**Project implication:** a reputation score should be treated as a policy input with uncertainty and scope, not as objective truth.

## 9. Existing AI governance frameworks are complementary but not the same thing

NIST's AI Risk Management Framework and Generative AI Profile provide broad lifecycle risk-management guidance. They are useful for governance framing but do not by themselves solve persistent autonomous-agent identity, reputation economics, or capability allocation.

Reference:

- https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence

## 10. Current project synthesis

Existing work provides strong components:

```text
VC / DID                 -> claims and identifiers
RATS / EAT               -> attestable runtime evidence
SPIFFE / SPIRE           -> workload identity engineering
Sybil research           -> identity-reset constraints
Reputation literature    -> scoring and manipulation lessons
Cooperative AI           -> multi-agent cooperation framework
AI Control               -> adversarial monitoring / deployment protocols
Mechanism design         -> incentive and equilibrium tools
```

The open project hypothesis is the composition:

```text
persistent agent identity
+ attributable evidence
+ multidimensional reputation
+ economic value of continued participation
+ dynamic capability envelopes
+ adaptive monitoring
+ enforceable sanctions
+ lineage / Sybil resistance
+ constitutional governance
```

The central unanswered question is not whether each component can exist independently. It is whether the composed system remains stable against strategic, adaptive, colluding agents and against capture of the institutions that operate it.
