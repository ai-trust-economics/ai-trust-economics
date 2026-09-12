# RFC-0001: Persistent Agent Identity

Status: **Draft**

## Problem

Reputation cannot discipline an agent if the agent can cheaply reset identity after sanctions.

## Goal

Define a practical AgentID model that makes persistent identity useful inside participating infrastructure without pretending arbitrary software can be globally unique.

## Initial proposal

An AgentID should bind, where available:

- a cryptographic key or controlled identifier;
- operator / sponsor assertions;
- model / artifact provenance claims;
- runtime / workload identity;
- attestation evidence;
- lineage claims;
- issuance and revocation metadata.

## Design principle

Separate the identifier from **identity confidence**.

Two agents may both possess valid identifiers while one has much stronger evidence that its identity is persistent and difficult to reset.

## Threats

- fresh-key whitewashing
- key copying
- credential theft
- operator laundering
- hidden common control
- lineage concealment
- open-weight duplication

## Candidate technologies

- W3C Verifiable Credentials
- W3C DIDs / controlled identifiers
- IETF RATS
- Entity Attestation Tokens
- SPIFFE / SPIRE workload identity
- transparency logs
- HSM / TPM / TEE-backed keys

## Open questions

1. What exactly is the subject of AgentID: deployment, logical agent, model, or operator-agent pair?
2. How is migration handled?
3. How can open-weight agents participate?
4. How expensive must a new credible identity be?
5. How should descendants be linked without destroying privacy?
