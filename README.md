# notary
Blockchain-Based Notary Service on Stacks

**Abstract**

This project introduces a blockchain-based notary service on the Stacks blockchain, secured by Bitcoin. The service allows individuals to link their identity to a Stacks wallet by certifying it in front of a human notary. Once verified, the wallet is cryptographically connected to the individual's identity, enabling them to sign contracts and agreements on-chain with the assurance that the signatures are valid and legally binding. The service also provides a mechanism for individuals to notify the system if their wallet is compromised, ensuring the integrity of the identity-to-wallet link.

**Introduction**

_What is a Blockchain?_
A blockchain is like a super-secure digital notebook shared across many computers. When something is written in this notebook, it can't be changed unless everyone agrees. This makes blockchain perfect for things like digital money (cryptocurrencies) and secure, unchangeable records.
_The Role of a Notary_
A notary is a person who checks that people are who they say they are and that they are signing documents willingly. Notaries help prevent fraud and make sure that legal documents are trustworthy.
_What is a Smart Contract?_
A smart contract is like a digital agreement written in computer code. Instead of being on paper, this contract lives on the blockchain. When certain conditions are met, the smart contract automatically does what it’s supposed to, like transferring money or recording a signature.
_Identity Verification_
Identity verification is how we make sure someone is really who they say they are. In this system, identity verification happens when a person proves to a notary that they own a specific digital wallet on the Stacks blockchain.
_On-Chain Cryptographic Verification_
On-chain cryptographic verification is a fancy way of saying that the blockchain can check if a digital signature (like one from a wallet) is valid. This helps us trust that the person signing a document really is who they say they are.

**How the Notary Service Works**

_Overview:_ Our notary service lets people link their real-world identity to a digital wallet on the Stacks blockchain. Here’s how it works:
1. Get Certified: A person meets with a human notary to certify that a specific Stacks wallet belongs to them. The notary confirms their identity and that they alone have access to the wallet.
2. Upload Certification: The person then uploads a digitized copy of the notarized document to the "on-chain-notary" service's website. This document proves that the person owns the wallet.
3. On-Chain Certification: After the "on-chain-notary" service checks the document, they confirm the link between the person’s identity and their wallet on the Stacks blockchain. This makes the wallet officially connected to the person’s identity.
4. Signing Contracts: The service provides a simple tool on its website where users can write contracts or agreements. These contracts are then turned into smart contracts (using Clarity language) on the Stacks blockchain. The involved parties can sign these contracts using their certified wallets.
5. Compromised Wallets: If a person’s wallet gets hacked or compromised, they must immediately notify the "on-chain-notary" service. They’ll need to certify this with a new notarized document, which the service will use to update the blockchain and unlink the wallet from their identity.

_Simple Steps for Signing Contracts_
1. Draft the Agreement: Write the contract or agreement text on the "on-chain-notary" service website.
2. Deploy the Contract: The service creates a smart contract from your text and deploys it on the Stacks blockchain.
3. Sign the Contract: Each person involved in the agreement signs it using their certified wallet. The blockchain records each signature, making it secure and official.

_Why Use This Service?_
1. Security: The service uses the security of the Bitcoin blockchain to protect your identity and contracts.
2. Transparency: Everything is recorded on the blockchain, so nothing can be changed or hidden.
3. Convenience: You can sign contracts from anywhere, without needing to visit a notary every time.
4. Trust: Because your wallet is certified, others can trust that your digital signatures are genuine.

**Technical Details**
_Stacks Blockchain_: Stacks is a blockchain that works with Bitcoin. It allows for smart contracts and decentralized apps (dApps) while using Bitcoin’s power to keep everything secure.
_Clarity Language_: Clarity is the programming language used to write smart contracts on the Stacks blockchain. It’s designed to be predictable and secure, making it perfect for important agreements like contracts.
_Certification Smart Contract_: A smart contract on the Stacks blockchain will handle the certification process. This contract keeps track of which wallets are linked to which people, based on the notarized documents uploaded to the "on-chain-notary" service.
_Signature Verification_: When you sign a contract with your wallet, the blockchain checks the signature against the certified wallet address. This ensures that the person signing is the same person who owns the wallet, making the signature legally valid.
