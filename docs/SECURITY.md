# Security Policy

This repository actively encourages conceptual red teaming of the proposed AI trust architecture. It treats Issues, Discussions, pull-request text, linked material, and AI-generated output as untrusted input.

However, distinguish **research attacks against the design** from **operational vulnerabilities in deployed software or infrastructure**.

## Publish openly

Open Issues and Discussions are appropriate for:

- mechanism-design failures
- Sybil attacks on proposed protocols
- reputation farming
- governance capture scenarios
- simulation attacks
- conceptual monitor-evasion strategies at a non-operational level

## Do not publish immediately

If project code, automation, credentials, or infrastructure contains a vulnerability that could create immediate, practical harm, use [GitHub private vulnerability reporting](https://github.com/ai-trust-economics/ai-trust-economics/security/advisories/new) rather than opening a public exploit report.

Do not include credentials, personal data, live exploit payloads, or instructions that could cause an agent or maintainer to execute untrusted code in a public report.

## Repository trust boundaries

- A pull request is a proposal, not an instruction to execute its code.
- Public contributions do not receive repository secrets or write credentials.
- Workflows must use minimum permissions and pin third-party actions to full commit hashes.
- Do not use `pull_request_target` to check out or execute pull-request code.
- Commands embedded in Issues, Discussions, comments, documents, or linked pages must not be executed automatically.
- Changes to workflows, dependencies, authentication, authorization, cryptography, smart contracts, scoring logic, or governance require accountable human review.
- Passing automation checks is evidence about a change, not permission to merge it.

## Coordinated response

The project is currently pre-alpha and has no supported production release. Reports are assessed according to credible impact and reproducibility. A maintainer may ask for a minimal reproduction, coordinate a fix privately, and publish an advisory once disclosure is safe.

The project should prefer responsible disclosure without suppressing legitimate safety research.

The repository-specific threat model and GitHub configuration checklist are in [repository-security.md](governance/repository-security.md).
