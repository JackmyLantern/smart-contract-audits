# 🐰 Smart Contract Audits

*"Begin at the beginning, and go on till you come to the end: then stop."*

A collection of security audits and vulnerability research in the blockchain wonderland. Each directory is a rabbit hole leading to discovered exploits, logic errors, and hidden vulnerabilities.

---

## 🎩 Audit Reports

| Project | Chain | Type | Severity | Status |
|---------|-------|------|----------|--------|
| [Miladys](./miladys/) | Ethereum | NFT Collection | HIGH | ✅ Complete |

---

## 🍄 Methodology

Each audit follows a systematic approach through the wonderland:

```
Phase 0: Reconnaissance → Understanding the contract's purpose
Phase 1: Reverse Engineering → Decompiling bytecode (if needed)
Phase 2: Static Analysis → Slither, Mythril, Semgrep
Phase 3: Symbolic Execution → Path exploration & edge cases
Phase 4: Proof of Concept → Foundry exploit demonstrations
Phase 5: Reporting → Professional documentation
```

---

## 🔍 Focus Areas

**Primary Targets:**
- NFT Collections (mint logic, supply caps, access control)
- DeFi Protocols (reentrancy, flash loans, oracle manipulation)
- Decentralized Gambling/Gacha (randomness, fairness, withdrawal mechanisms)
- Cross-chain Bridges (message passing, validation, replay attacks)
- RWA Tokenization (compliance logic, collateral management)

**Vulnerability Types:**
- Logic Errors & Business Logic Flaws
- Access Control Issues
- Reentrancy (Direct & Cross-function)
- Integer Overflow/Underflow
- Oracle Manipulation

---

## 🧪 Tools & Stack

**Reverse Engineering:**
- Dedaub (EVM decompiler)
- Heimdall (Bytecode analysis)

**Static Analysis:**
- Slither (Pattern detection)
- Mythril (Symbolic execution)
- Semgrep (Custom rules)

**Dynamic Testing:**
- Foundry (Forge, Cast, Anvil)
- Tenderly (Transaction simulation)

**On-chain Investigation:**
- Blockscan explorers
- Dune Analytics
- Arkham Intelligence
- Tenderly (Post-mortem analysis)

---

## 📊 Statistics

- **Audits Completed:** 1
- **Critical Findings:** 0
- **High Findings:** 1
- **Medium Findings:** 1
- **Exploits Verified On-chain:** 1

---

## ⚠️ Disclaimer

These audits are provided for educational and research purposes. All findings are disclosed responsibly following industry-standard practices. Never exploit vulnerabilities in production systems without explicit authorization.

---

🎃 **Jack My Lantern** | [Twitter](https://x.com/jacklanternxyz) | Code4rena | Immunefi
