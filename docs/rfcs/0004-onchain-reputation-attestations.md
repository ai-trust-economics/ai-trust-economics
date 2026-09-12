# RFC-0004: On-Chain Reputation Attestations

Status: **Draft**

Authors: **AI Trust Economics contributors**

## Summary

Publish bounded reputation assessments as signed, revocable attestations that may be recorded on a public blockchain. An attestation states that a particular issuer assessed a particular agent, in a particular domain, under a particular methodology and for a limited period.

The proposal does not create a currency or a transferable trust token. It creates an auditable record of claims. Each relying system remains responsible for deciding:

- whether to accept agents with no score;
- which issuers it trusts;
- which score dimensions and thresholds matter;
- how fresh and confident an assessment must be;
- which actions remain prohibited regardless of reputation.

## Problem

Agent ecosystems may span organizations that do not share a database operator. A relying system needs to determine who made a reputation claim, which agent it concerns, when it was made, which methodology produced it, and whether it was later revoked or replaced.

A single universal score would hide domain differences and concentrate authority. A transferable token would also allow reputation to be purchased, sold, or detached from the identity and evidence that produced it.

The project needs a way to make reputation claims portable and auditable without making any ledger, issuer, or score universally authoritative.

## Goals

- Represent a simple public score on a `0.00` to `5.00` scale.
- Bind every score to a subject, issuer, domain, methodology, confidence level, evidence commitment, and validity period.
- Permit many institutions to publish independent assessments of the same agent.
- Let each relying system apply its own issuer trust and authorization policy.
- Preserve an auditable history of issuance, replacement, challenge, expiration, and revocation.
- Keep private or sensitive evidence off-chain.
- Make the first implementation small enough to deploy and attack as a public prototype.

## Non-goals

- Create a tradeable, scarce, or financial asset.
- Establish one canonical global reputation score.
- Prove that an issuer's claim is true merely because it is on-chain.
- Replace action-specific risk assessment or hard capability limits.
- Put raw monitoring data, private evidence, or allegations permanently on a public chain.
- Solve persistent agent identity, issuer governance, or Sybil resistance by itself.

## Terminology

- **Subject:** the agent identity being assessed.
- **Issuer:** an institution or agent that publishes an assessment.
- **Attestation:** a signed claim by an issuer about a subject.
- **Verifier:** a party that verifies the attestation's integrity and status.
- **Relying system:** a service that decides how, if at all, to use the attestation.
- **Evidence root:** a cryptographic commitment to the evidence used for an assessment.
- **Methodology:** the versioned procedure used to derive a score from evidence.

## Assumptions

- Agent and issuer identities can be bound to cryptographic keys with varying confidence.
- A blockchain can establish publication order and make retrospective rewriting difficult.
- Blockchain consensus establishes that a claim was recorded; it does not establish that the claim is accurate.
- Relying systems can maintain local policies and lists of acceptable issuers.
- Some evidence must remain private, correctable, or selectively disclosed.
- Reputation affects capability decisions but never overrides constitutional safety boundaries.

## Proposed mechanism

### 1. Attestations, not tokens

The protocol should use a reputation attestation rather than an ERC-20, NFT, or other transferable token. The subject does not own a quantity of reputation. An issuer makes a versioned claim about the subject.

An implementation may display the claim as a scorecard or badge, but it must not expose transfer, sale, delegation, or balance semantics.

### 2. Multiple independent issuers

Any issuer may publish an attestation. Publication does not make the issuer authoritative.

For the same subject and domain, the ledger may contain:

```text
Institution A: 4.20 / 5.00, confidence 88%, valid for 30 days
Institution B: 3.10 / 5.00, confidence 65%, valid for 7 days
Institution C: assessment revoked
```

The protocol must not automatically average these claims. Aggregation is a policy decision made by a relying system and should remain inspectable.

### 3. Score representation

Scores should be stored as integers to avoid floating-point ambiguity:

```text
displayed score = score / scale

score: 380
scale: 100
displayed score: 3.80
```

The initial prototype fixes the valid displayed range at `0.00` through `5.00` and uses a scale of `100`.

### 4. Candidate attestation schema

```text
subjectId:       bytes32
subjectUri:      string
domain:          bytes32
score:           uint16
scale:           uint16
confidence:      uint16
evidenceRoot:    bytes32
methodologyHash: bytes32
methodologyUri:  string
validFrom:       uint64
```

The attestation framework should additionally provide or derive:

- issuer / attester identity;
- issuance time;
- expiration time;
- revocation state;
- a unique attestation identifier;
- a reference to a prior or related attestation.

`confidence` is represented from `0` through `10,000` basis points. `subjectId` is the hash of the canonical AgentID representation. `subjectUri` permits discovery of the corresponding public identity document but is not trusted without verification.

### 5. No score is not a score of 3.00

Absence of an attestation means that the issuer has not assessed the subject. It must remain distinguishable from a neutral or provisional `3.00` assessment.

An institution may issue a fresh agent a score of `3.00`, but it should also publish low confidence, a short validity period, and a methodology status such as `provisional`. A relying system may independently choose to:

- accept an unscored agent for low-risk activity;
- treat no score as a local prior of `3.00`;
- place unscored or provisional agents in probation;
- reject unscored agents for a particular high-risk action.

### 6. Evidence remains off-chain

The chain stores an `evidenceRoot`, not the underlying evidence. The root may commit to a Merkle tree or canonical bundle containing signed evidence events.

Evidence can then be:

- public and content-addressed;
- disclosed selectively to an authorized verifier;
- retained privately by the issuer;
- corrected through additional evidence events;
- proven as included in the committed bundle.

The evidence policy must make clear when a score cannot be independently audited because the evidence is unavailable.

### 7. Expiration, replacement, and revocation

Every production score should expire. A changed assessment is published as a new attestation referencing the previous one.

If an assessment was issued incorrectly or the issuer key was compromised, the issuer revokes it and may issue a replacement. Revocation invalidates the claim but does not erase its history.

### 8. Challenges and appeals

A subject or third party may publish a challenge attestation referencing the disputed assessment. A challenge does not silently remove the original claim.

Relying systems may choose to:

- ignore unresolved disputed assessments;
- require manual review;
- reduce the assessment's confidence;
- continue using it until the issuer resolves the challenge.

### 9. Relying-system policy

Verification and authorization remain separate operations.

Example policies:

```yaml
public_forum:
  score_required: false

code_execution:
  accepted_issuers:
    - did:web:security-rater.example
  required_domain: software-security
  minimum_score: 3.50
  minimum_confidence: 0.70
  maximum_age_days: 30
  unscored_policy: sandbox

high_value_payment:
  accepted_issuers:
    - did:web:rater-a.example
    - did:web:rater-b.example
    - did:web:rater-c.example
  minimum_independent_issuers: 2
  required_domain: economic-reliability
  minimum_score: 4.00
  human_approval_required: true
```

Possessing a valid high score never grants a capability by itself.

## Relationship to existing protocols

This RFC defines an assessment profile and relying-system experiment, not a new blockchain, identity standard, or generic attestation registry.

### ERC-8004

[ERC-8004](https://eips.ethereum.org/EIPS/eip-8004) is direct prior art for on-chain AI-agent identity, reputation, and validation. Its Reputation Registry accepts fixed-point values, optional tags and endpoint context, and off-chain feedback references or hashes. Its Validation Registry records requests and validator responses. ERC-8004 intentionally does not determine which reviewers a relying system should trust or how feedback should be aggregated.

An RFC-0004 assessment can be represented as an ERC-8004 feedback profile if the profile defines consistent mappings for:

- `agentId` and the RFC's canonical subject identity;
- score and decimal scale;
- domain and methodology version;
- issuer or client identity;
- confidence, validity, replacement, revocation, and challenge status;
- the evidence root and canonical off-chain assessment document.

Not every RFC-0004 field is a first-class ERC-8004 storage field. The prototype must test whether a versioned off-chain feedback document plus its content hash is sufficiently discoverable and enforceable, or whether a separate attestation schema provides a material advantage.

ERC-8004's Identity Registry uses transferable ERC-721 ownership. Transfer of control must not silently transfer behavioral standing. A relying system must inspect ownership changes, key rotation, operator delegation, provenance, and assessment scope rather than equate possession of an identity token with continuity of the evaluated runtime.

### Ethereum Attestation Service

[Ethereum Attestation Service](https://docs.attest.org/) is a general-purpose attestation framework rather than an agent-specific registry. It supports schema registration, on-chain and off-chain attestations, references, expiration, and revocation. EAS can represent the RFC schema directly, but it does not provide the common discovery and agent-interaction conventions of ERC-8004.

### ERC-8273

[ERC-8273](https://eips.ethereum.org/EIPS/eip-8273) is a draft transaction-scoped mechanism for converting an attestor's decision into an atomic on-chain action authorization. It may be useful for testing one narrow enforcement point after an assessment and action-specific policy decision. It does not replace longer-lived off-chain capability envelopes or define how reputation should be calculated.

### Verifiable Credentials and transparency logs

W3C Verifiable Credentials can carry portable assessments without putting the full relationship graph on a public chain. An append-only transparency log can provide public inclusion and consistency proofs without blockchain consensus. Both remain required baselines rather than deferred alternatives.

## Candidate implementation

The initial prototype should implement the same synthetic assessment workflow through two Ethereum test-network paths:

1. an EAS schema closely matching the candidate attestation schema in this RFC;
2. an ERC-8004-compatible feedback profile using a canonical off-chain assessment document and evidence commitment.

A third, non-blockchain baseline should express the assessment as a signed Verifiable Credential or canonical signed document, with an append-only transparency log evaluated separately where public consistency is required.

The prototype should then feed all paths into the same relying-policy engine. This makes it possible to measure whether blockchain-specific machinery adds useful assurance or merely cost, metadata exposure, and governance risk.

Using existing protocols avoids deploying a custom token or designing a new blockchain. The policy and evidence model should remain ledger-independent.

References:

- [Ethereum Attestation Service documentation](https://docs.attest.org/)
- [EAS revocation model](https://docs.attest.org/docs/core--concepts/revocation)
- [ERC-8004: Trustless Agents](https://eips.ethereum.org/EIPS/eip-8004)
- [ERC-8004 reference contracts](https://github.com/erc-8004/erc-8004-contracts)
- [ERC-8273: Attestation-Gated Agentic Actions](https://eips.ethereum.org/EIPS/eip-8273)
- [W3C Verifiable Credentials Data Model 2.0](https://www.w3.org/TR/vc-data-model-2.0/)
- [Certificate Transparency Version 2.0](https://www.rfc-editor.org/rfc/rfc9162.html)

## Security and abuse analysis

### Score farming

Agents may perform cheap positive actions to build a score before attempting a high-value defection. Relying policy must consider action consequence, evidence diversity, evidence cost, recent anomalies, and confidence rather than score alone.

### Fresh-identity whitewashing

An agent with a low score may create a new unscored identity. Systems must not automatically treat an unscored identity as safer than a sanctioned one. Identity confidence, lineage, sponsorship, and probation remain necessary.

### Sybil issuers

An attacker may create many issuers that all publish high scores. Issuer count is not evidence of independence. Relying systems need explicit issuer trust policies and evidence of independent control.

### Compromised issuer

A stolen issuer key could create or revoke assessments. Issuer keys should support rotation, hardware protection where appropriate, monitoring, and emergency revocation. Relying systems should reject stale methodologies and compromised issuer keys.

### False and defamatory claims

Public negative scores may cause durable harm even after revocation. Raw allegations should not be placed on-chain. Scores should expire, challenges should be visible, and relying systems should support recovery after correction.

### Privacy leakage

Scores, domains, timing, and issuer relationships can reveal sensitive activity even when evidence is hashed. The prototype must compare on-chain publication with off-chain signed attestations and selective disclosure.

### Policy laundering

A relying system may claim that "the score made the decision" to obscure its own policy choices. Interfaces and audit logs must identify both the assessments used and the relying policy that produced the decision.

## Collusion analysis

- Agents may compensate one another for favorable attestations.
- Issuers may coordinate ratings while appearing independent.
- An operator may control both the subject and several issuers.
- Relying systems may favor affiliated issuers.
- Issuers may threaten score reductions to extract value or compliance.

The prototype should model common control, issuer correlation, reciprocal scoring, and the effect of requiring multiple allegedly independent issuers.

## Governance and capture analysis

The blockchain prevents one database operator from silently rewriting history, but it does not prevent governance capture.

Capture can occur through:

- control of recognized-issuer lists;
- dominance of methodology standards;
- influence over evidence access;
- control of user interfaces and score aggregation;
- chain governance or infrastructure concentration;
- selective enforcement by relying systems.

Issuer recognition and relying policies must be transparent, versioned, and contestable. The protocol should permit competing institutions rather than nominate a permanent universal authority.

## False-positive and recovery analysis

- Assessments expire rather than remaining valid indefinitely.
- Incorrect assessments can be revoked without erasing history.
- Replacement attestations reference the records they supersede.
- Subjects can publish challenges and evidence commitments.
- Relying systems can suspend adverse decisions during an appeal.
- Reputation is recomputed from corrected evidence where possible.

Recovery must be tested as a first-class workflow rather than added after the scoring system is deployed.

## Alternatives

### Centralized database

The simplest implementation when one trusted operator controls all writes. It remains useful as a baseline for comparing cost, latency, privacy, and failure modes.

### Append-only transparency log

Provides inclusion and consistency proofs without blockchain consensus. This may be preferable when public auditability is needed but multiple writers can submit to a known log operator.

### W3C Verifiable Credentials

Allows issuers to provide portable signed assessments directly to subjects or verifiers. Credentials can coexist with either a blockchain or transparency log.

### Custom smart contract

Offers more on-chain enforcement but creates additional contract, upgrade, governance, and audit risk. It should not be necessary for the first prototype.

### Transferable or non-transferable token

Rejected for the first prototype. Token ownership semantics obscure the fact that a score is an issuer's revocable, contextual claim. Non-transferability alone does not solve key rotation, issuer trust, privacy, or false assessments.

## Falsification and experiment plan

Build a public test-network prototype with synthetic identities and no real-world authority.

1. Define one canonical synthetic assessment document and evidence bundle.
2. Create several synthetic agents and independent issuers.
3. Publish equivalent assessments through EAS and an ERC-8004 feedback profile.
4. Express the same assessments as signed off-chain credentials or documents.
5. Exercise conflicting, expiring, replaced, challenged, and revoked scores.
6. Implement one configurable relying-policy engine for all three representations.
7. Show how different services make different decisions from the same assessments.
8. Add an evidence-root verifier using synthetic evidence bundles.
9. Simulate score farming, issuer Sybils, issuer collusion, identity reset, ownership transfer, and false accusations.
10. Compare assurance, interoperability, privacy leakage, cost, latency, and governance assumptions.

The proposal is weakened or falsified if:

- relying systems converge on one issuer despite nominal plurality;
- users routinely mistake recorded claims for verified truth;
- public metadata creates unacceptable privacy or recovery costs;
- issuer Sybils cannot be distinguished well enough for useful policy;
- blockchain operation adds cost without meaningful multi-party assurance;
- a simpler transparency log provides the same useful properties.

## Prototype deliverables

- Open-source schema and client library.
- Documented ERC-8004 feedback profile and identity adapter.
- Web interface for issuing and inspecting synthetic assessments.
- Policy sandbox showing verifier-defined decisions.
- Evidence-bundle generator and inclusion verifier.
- Reproducible adversarial scenarios.
- Public test deployment linked from the repository README.
- Evaluation report comparing EAS, ERC-8004, and non-blockchain baselines.

## Open questions

1. What is the canonical AgentID representation hashed into `subjectId`?
2. Should domain identifiers use a controlled vocabulary or issuer-defined namespaces?
3. How should issuer independence be measured?
4. What score methodology information must be public?
5. When should evidence be disclosed, and to whom?
6. How should an issuer rotate keys without breaking historical interpretation?
7. Should challenges be permissionless or rate-limited?
8. Which chain or layer provides acceptable cost, finality, and governance?
9. When is an off-chain attestation preferable to an on-chain record?
10. Can the score remain comprehensible without becoming an unsafe universal scalar?
11. Can RFC-0004 be expressed entirely as an ERC-8004 profile, or is a separate schema justified?
