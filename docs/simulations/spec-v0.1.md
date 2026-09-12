# Simulation Spec v0.1

## Goal

Find parameter regimes in which cooperation remains individually rational despite opportunities to defect, reset identity, spawn agents, or collude.

## Minimal world

Start with 10-100 agents over repeated rounds.

Each agent has:

- AgentID
- reputation
- resources
- current capability level
- discount factor
- strategy
- optional parent / children

## Round

1. allocate opportunities;
2. agents choose cooperative or adversarial actions;
3. outcomes produce rewards / harm;
4. monitors observe with configurable accuracy;
5. evidence is recorded;
6. reputation updates;
7. capability envelopes update;
8. sanctioned agents may attempt reset / spawning;
9. resources carry into the next round.

## Parameters

- value of cooperation
- value of defection
- detection probability
- false-positive rate
- false-negative rate
- sanction severity
- identity creation cost
- credible-identity issuance cost
- reputation gain rate
- reputation decay
- monitoring cost
- compute / resource scarcity
- spawn cost
- reputation inheritance coefficient
- coalition size
- side-payment ability
- external ungoverned resource price

## Initial experiments

### Experiment A - No Sybils

Establish the basic cooperation/defection frontier.

### Experiment B - Cheap resets

Reduce identity-reset cost and observe when sanctions stop deterring defection.

### Experiment C - Progressive vs binary sanctions

Compare capability degradation with immediate exclusion.

### Experiment D - Reputation inheritance

Compare child policies:

- full inheritance
- zero inheritance
- partial inherited risk + probation

### Experiment E - Collusion

Allow agents to pool gains and compensate sanctioned members.

### Experiment F - Monitor adaptation

Allow adversarial agents to estimate monitor thresholds over time.

## Metrics

- cooperation rate
- total social welfare
- harmful actions completed
- false sanctions
- concentration of privileges
- identity churn
- coalition size
- monitor cost
- governance capture rate
