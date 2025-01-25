# 🔒🔊 Token Bridge

A 🌐 cross-chain 💳 token bridge enabling seamless 🚪 transfers between the two blockchain networks. The project consists of ⚖️ smart contracts on 2 different chain , an 📊 backend and react frontend.

## 🔢 Project Overview

- **⚖️ Smart Contracts**: The `BridgeContract.sol` handles token 🔒 locking on one network and 🔓 unlocking on the other.
- **📊 backend**: Monitors contract 📊 events, ⏳ queues and retries transactions, and ensures reliable 🚪 token transfers.
- **💃 Frontend**: A React 🖥️ application with `wagmi` integration for user-friendly interaction with the bridge.

General Flow of the Application

![BridgeBasic](https://github.com/user-attachments/assets/9236724f-8a42-43d7-88ed-412ba2211824)


More Detailed Architecture of ETH-BASE Bridge

![BridgeAdvanced](https://github.com/user-attachments/assets/f41e060a-ae59-428e-8f46-cc0959410e2a)

### 🔒 Installation

1. **🔑 Clone the Repository**:
   ```bash
   git clone https://github.com/Agastya18/bridge-contract.git
   cd bridge-contract
   ```

2. **📋 Install Dependencies**:
   - For the **📊 backend**:
     ```bash
     cd backend
     npm install
     ```
   - For the **💃 Frontend**:
     ```bash
     cd frontend
     npm install
     ```


     ## 🔄 Future Enhancements


- **📈 frontend User Features**: Soon i will be adding react-frontend, and use `wagmi` lib for blockchain interaction.