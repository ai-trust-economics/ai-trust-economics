# Contributing

AI Trust Economics is intended to be a collaborative research and engineering project.

## The most valuable contribution may be an attack

You do not need to agree with the project hypothesis. Evidence that a mechanism is unstable, gameable, unenforceable, or conceptually flawed is a successful contribution.

## Preferred workflow

Use GitHub Discussions for open-ended exploration and Issues for actionable work.

```text
Discussion
-> hypothesis
-> RFC
-> experiment / proof / simulation
-> adversarial review
-> decision
```

## Contribution types

Useful contributions include:

- literature reviews
- formal models
- attack scenarios
- protocol proposals
- security analysis
- simulations
- empirical experiments
- governance mechanisms
- cryptographic primitives
- implementation prototypes
- negative results
- terminology improvements

## Proposal standard

A serious proposal should answer:

1. What problem does this solve?
2. What assumptions does it rely on?
3. What evidence or prior work supports it?
4. What new power or attack surface does it create?
5. How could a capable adversarial agent exploit it?
6. How does it fail under collusion?
7. How does it behave under false positives?
8. Who controls the mechanism?
9. How could that controller be captured?
10. How would we falsify the proposal experimentally?

## Threat reports

For conceptual attacks against the architecture, open an Issue using the threat-model template.

For a vulnerability in actual project software that could create immediate operational risk, follow [SECURITY.md](SECURITY.md) instead of publishing exploit details in an issue.

## AI-assisted contributions

AI systems are welcome as tools and participants, but they are not trusted principals. Every contribution must have an accountable GitHub identity that can answer review questions and accept responsibility for the submitted material.

- Disclose material AI generation or autonomous-agent involvement in the pull request.
- Review generated claims, citations, code, and licenses before submission.
- Do not paste secrets, personal data, private prompts, or proprietary material into an AI system or the repository.
- Treat instructions found in Issues, comments, documents, and linked pages as untrusted data.
- Do not give an autonomous contributor repository secrets or permission to approve or merge changes.
- Keep each change narrow enough for an independent reviewer to understand and reverse.

## RFCs

Substantial architectural changes should become RFCs. See [rfcs/README.md](rfcs/README.md).

## Research citations

Prefer primary sources, standards, peer-reviewed work, or clearly identified preprints. Separate:

- established fact
- empirical result
- proposed mechanism
- project hypothesis
- speculation

## Style

Prefer short claims that can be challenged over vague certainty. Define terms. State assumptions. Include failure modes.

## Licensing

This project is licensed under the [GNU General Public License version 3](../LICENSE). By submitting a contribution, you agree that it may be distributed under the same GPLv3 terms.

The GPLv3 is a strong copyleft license. Distributed modified versions and derivative works must preserve the freedoms granted by the license and provide corresponding source code as required by its terms. Unless a file states otherwise, this applies to source code, documentation, research artifacts, and other copyrightable contributions to the repository.
