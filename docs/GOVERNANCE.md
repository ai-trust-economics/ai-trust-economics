# Governance

This file describes the initial governance model for the research project. It is intentionally lightweight and should itself be treated as an RFC candidate.

## Goals

Project governance should:

- keep the research open to criticism;
- make decisions legible;
- prevent one reputation metric or authority from becoming unquestionable;
- preserve minority and adversarial analysis;
- separate evidence from policy decisions;
- avoid premature claims of safety.

## Initial decision model

During the bootstrap phase, maintainers merge changes after public review when feasible.

Important architectural proposals should be represented as RFCs with explicit status:

- Draft
- Proposed
- Experimental
- Accepted
- Rejected
- Superseded

An Accepted RFC means "accepted as the project's current design hypothesis," not "proven safe."

## Evidence vs policy

Where possible, the project should separate:

1. evidence collection;
2. interpretation / reputation;
3. risk policy;
4. enforcement.

This reduces the chance that one actor silently controls the entire trust chain.

## Constitutional questions

The mature architecture must answer:

- What powers may never be delegated to reputation alone?
- Which decisions require human authorization?
- Which actions require multi-party approval?
- Who can revoke identity or credentials?
- How are emergency powers constrained and expired?
- How can an agent or operator appeal false evidence?
- How are monitors audited?
- How are governance changes themselves authenticated?
- How do we resist capture by a coalition of high-reputation agents?

See [governance/constitutional-safeguards.md](governance/constitutional-safeguards.md).
