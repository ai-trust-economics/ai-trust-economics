# Prototypes

Do not rush into production architecture.

Prototypes should exist to answer research questions.

Likely prototype sequence:

1. signed AgentID + evidence events;
2. simple reputation-vector service;
3. policy decision service returning capability envelopes;
4. resource gateway enforcing limits;
5. append-only evidence log;
6. remote-attestation integration;
7. lineage / spawned-agent credentials;
8. red-team agent attempting to game the system.

A blockchain prototype should be built only if a concrete research question requires decentralized consensus or censorship-resistant shared state.
