# Repository Security and Automation Policy

This document translates the project threat model into controls for the GitHub organization and repository. It is a maintainer runbook, not a claim that GitHub or the repository is fully secure.

## Assets to protect

- integrity of `main`, releases, tags, and project history
- maintainer accounts, signing keys, tokens, and recovery methods
- GitHub Actions credentials and repository secrets
- contributor privacy and unpublished vulnerability reports
- the distinction between reviewed research and accepted project policy

## Credible threats

1. A maintainer account or local credential is compromised.
2. A malicious pull request attempts dependency or CI compromise.
3. An Issue, Discussion, comment, or linked page contains prompt injection intended for an automated agent.
4. An action or dependency is replaced upstream after it has been trusted.
5. Coordinated accounts manufacture consensus, reputation, or approvals.
6. Spam and adversarial volume consume maintainer attention.
7. Automation merges a syntactically valid but unsafe governance or protocol change.

The practical risk is ordinary account, supply-chain, social-engineering, and automation compromise. No assumption about a hypothetical rogue AI is needed for these threats to matter.

## Controls stored in this repository

- Pull-request CI has read-only repository permission and receives no declared secrets.
- The checkout action is pinned to a full commit hash.
- CI rejects whitespace errors and broken local Markdown links.
- Dependabot proposes updates to GitHub Actions; those updates still require review.
- The contribution and security policies treat all public content as untrusted input.
- Operationally sensitive changes are explicitly excluded from automatic approval.

## One-time GitHub configuration

Apply these settings in the web interface. GitHub settings and labels can change over time, so verify the current description before saving.

### Maintainer account

- Enable a passkey or hardware security key and a second independent authentication method.
- Store recovery codes offline or in a password manager separate from the primary device.
- Review active sessions, authorized OAuth applications, GitHub Apps, SSH keys, deploy keys, and personal access tokens. Remove anything unused.
- Give every SSH key a narrow purpose and recognizable name. Prefer separate authentication and commit-signing keys.
- Keep at least two organization owners only when the second owner is a genuinely independent, secured person; do not create a shared owner account.

### Organization

In organization **Settings**:

- Under **Authentication security**, require two-factor authentication and allow only secure 2FA methods.
- Under **Member privileges**, keep base permissions at `Read` and restrict repository creation and deletion to owners.
- Give bots and GitHub Apps the minimum repository selection and permissions. Prefer a GitHub App with short-lived tokens over a broadly scoped personal access token.
- Review the organization audit log after membership, application, authentication, or ruleset changes.

### Default-branch ruleset

Under repository **Settings -> Rules -> Rulesets**, create an active branch ruleset targeting the default branch (`main`) with:

- restrict deletions
- block force pushes
- require a pull request before merging
- require at least one approval from someone other than the author
- dismiss stale approvals when new commits are pushed
- require approval of the most recent reviewable push
- require all conversations to be resolved
- require the `Documentation security checks` status check after it has completed once
- require linear history
- no routine bypass actors

For a one-person project, the independent-approval rule deliberately prevents unattended merging. If no reviewer is available, leave the pull request open rather than weakening the rule permanently.

Require signed commits after existing unsigned branches have been merged or replaced. Do not enable it mid-review without checking which open pull requests it would block.

### Actions

Under repository **Settings -> Actions -> General**:

- allow only GitHub-authored actions and specifically reviewed external actions
- set workflow permissions to **Read repository contents and packages**
- disable **Allow GitHub Actions to create and approve pull requests**
- require approval before workflows from new external contributors run

Never expose secrets to workflows triggered by untrusted forks. Never combine `pull_request_target`, checkout of contributor-controlled code, and execution of that code.

### Code security and reporting

Under repository **Settings -> Advanced Security** or **Code security and analysis**:

- enable private vulnerability reporting
- enable Dependabot alerts and security updates
- enable secret scanning and push protection
- enable code scanning when executable code is added

## Automation policy

Automation may classify, summarize, label, test, and prepare changes. It must not be the final authority for changes that can alter trust or execute with privilege.

| Risk | Examples | Automatic merge |
| --- | --- | --- |
| Low | spelling, formatting, generated indexes | Allowed only after deterministic checks and a narrow path allowlist are implemented |
| Medium | research text, simulations, ordinary code | No; accountable review required |
| High | workflows, dependencies, authentication, cryptography, scoring, governance, releases | Never |

An automated agent must treat repository content as data, use a read-only token by default, operate on a branch, produce an auditable pull request, and stop when a request expands its permissions or changes a protected policy.

## Incident response

If compromise is suspected:

1. Revoke or rotate the affected token or key before investigating with it.
2. Remove suspicious sessions, apps, deploy keys, and collaborators.
3. Preserve audit-log, workflow, commit, and network evidence.
4. Disable the affected workflow or integration without deleting evidence.
5. Review recent merges, releases, ruleset changes, and force pushes.
6. Publish a security advisory when disclosure no longer increases harm.

Security controls reduce likelihood and impact; they do not establish that an identity, score, maintainer, or AI system is trustworthy.
