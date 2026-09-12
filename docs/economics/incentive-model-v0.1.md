# Incentive Model v0.1

Status: **Toy model hypothesis**

## Core objective

Construct an environment in which the expected long-run utility of cooperation exceeds the expected utility of defection.

```text
EU(C) > EU(D)
```

## Agent state

A toy agent may have:

- identity `I`
- reputation vector `R`
- capability envelope `E`
- owned resources `W`
- expected future access value `F`
- probability of detection `p`
- sanction function `S`
- cost of creating a new credible identity `C_id`

## Cooperation payoff

One simple representation:

```text
EU(C) = immediate_reward
      + expected_future_access
      + reputation_appreciation
      - compliance_cost
      - monitoring_cost
```

## Defection payoff

```text
EU(D) = illicit_or_private_gain
      - p(detection) * expected_sanction
      - expected_loss_of_future_access
      - identity_reset_cost
      - coalition_or_counterparty_penalties
```

The project should not assume the sanction term is sufficient. The future-access term may be more powerful if governed infrastructure is genuinely valuable.

## Identity-reset constraint

```text
C_id >> value_of_whitewashing
```

If `C_id` approaches zero, historical reputation loses deterrent force.

## Resource scarcity

Reputation has economic meaning only if it controls something valuable and difficult to obtain elsewhere.

Candidate scarce resources:

- frontier compute
- energy / data-center allocation
- trusted credentials
- banking and settlement access
- high-value APIs
- proprietary data
- deployment channels
- trusted counterparties
- robotics / physical actuators
- replication rights

## Failure conditions

The model can fail when:

- detection probability is low;
- defection payoff is enormous;
- sanctions are weak;
- identity reset is cheap;
- agents can obtain equivalent resources outside the governed system;
- agents collude and compensate sanctioned members;
- monitors can be manipulated;
- governance is captured;
- future utility is heavily discounted;
- an agent does not value persistence or future access.

## Simulation questions

1. What minimum identity-reset cost sustains cooperation?
2. How much does monitor error change equilibrium behavior?
3. Does progressive sanction outperform binary exclusion?
4. How does the result change when agents can form coalitions?
5. Can a high-reputation sponsor profitably create disposable children?
6. What happens if external ungoverned compute becomes cheap?
7. Does reputation create dangerous concentration of power?
