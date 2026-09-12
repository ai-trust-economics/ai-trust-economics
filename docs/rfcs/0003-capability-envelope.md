# RFC-0003: Dynamic Capability Envelope

Status: **Draft**

## Problem

A trust system is ineffective if its output does not constrain real capabilities.

## Proposal

Every consequential agent deployment has a policy-derived capability envelope controlling access to resources and actions.

## Inputs

- identity confidence
- reputation vector
- requested action
- consequence / reversibility
- resource value
- attestation state
- recent anomalies
- monitoring coverage
- human authorization
- constitutional rules

## Outputs

- allow
- deny
- allow with limits
- require sandbox
- require stronger monitoring
- require human approval
- require multi-party approval

## Non-negotiable principle

A high reputation cannot automatically unlock every capability.

## Open questions

1. What is the portable policy format?
2. How frequently should envelopes be recomputed?
3. How do we revoke rights already delegated downstream?
4. Which enforcement points are mandatory for a meaningful deployment?
