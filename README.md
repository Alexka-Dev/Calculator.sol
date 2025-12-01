# 🪙 Calculator Accumulator Smart Contract

📝 Overview

The **Calculator Accumulator Smart Contract** is a smart contract designed to execute sequential arithmetic operations on the Ethereum blockchain. This contract uses the **Accumulator Pattern** to store and reuse the previous result (`currentResult`) as the base for the next operation, functioning like a handheld calculator with persistent memory.

Built with **Solidity**, the contract prioritizes **clean code architecture** by separating the user interface (public functions) from the core calculation logic (internal pure functions).

🚀 Features

| Feature | Description |
| :--- | :--- |
| **Accumulator Pattern** | Stores and reuses the previous result (`currentResult`) as the base for the next operation. |
| **Basic Operations** | Addition, Subtraction, Multiplication, Division, and Percentage. |
| **Logic Separation** | Modular design using `internal pure` functions for pure calculation and `public` functions for state updates and event emission. |
| **Validation** | Uses modifiers to validate user input (e.g., prevention of division by zero). |

***

## 📜 Smart Contract Details

### ⚙️ Modifiers

| Modifier | Description |
| :--- | :--- |
| `checkNumber(uint newNumber_)` | **Validates that the divisor is not zero** before executing a division operation, reverting the transaction if `newNumber_` is `0`. |

### 📡 Events

Events log the operation, recording the starting value (`previousResult` or `baseValue`), the input value (`newNumber_` or `percentageValue`), and the final result.

| Event | Description |
| :--- | :--- |
| `Addition` | Emitted when adding a number to the accumulated result. |
| `Substraction` | Emitted when subtracting a number from the accumulated result. |
| `Multiplier` | Emitted when multiplying the accumulated result by a number. |
| `Division` | Emitted when dividing the accumulated result by a number. |
| `Percentage` | Emitted when calculating the percentage of the accumulated base value. |

***

## 💻 Contract Functions

The public functions serve as the user interface to interact with and update the accumulator (`currentResult`).

### External Functions (User Interface)

| Function | Visibility | Description |
| :--- | :--- | :--- |
| `addition(uint newNumber_)` | `public` | Adds `newNumber_` to `currentResult` and emits the `Addition` event. |
| `substraction(uint newNumber_)` | `public` | Subtracts `newNumber_` from `currentResult` and emits the `Substraction` event. |
| `multiplier(uint newNumber_)` | `public` | Multiplies `currentResult` by `newNumber_` and emits the `Multiplier` event. |
| `division(uint newNumber_)` | `public` | Divides `currentResult` by `newNumber_`. **Applies `checkNumber`** and emits the `Division` event. |
| `percentage(uint percentage_)` | `public` | Calculates `percentage_` of the `currentResult` and updates the result. Emits the `Percentage` event. |
| `reset()` | `public` | Resets the `currentResult` to **zero (0)**. |
| `getCurrentResult()` | `public view` | **Reads** the current value of `currentResult` without consuming gas. |

### Internal Functions (Pure Logic)

These functions are called only by the public functions and contain the pure, isolated calculation logic.

| Function | Visibility | Description |
| :--- | :--- | :--- |
| `add_logic` | `internal pure` | Pure logic for addition. |
| `sub_logic` | `internal pure` | Pure logic for subtraction. |
| `mul_logic` | `internal pure` | Pure logic for multiplication. |
| `div_logic` | `internal pure` | Pure logic for division. |
| `percentage_logic` | `internal pure` | Pure logic for percentage calculation. |

***

## 🛠️ How to Use

The process for using the contract follows the sequential, accumulator pattern.

### 🔧 Prerequisites

* **Development Environment:** [Remix IDE](https://remix.ethereum.org/) or Hardhat/Foundry.
* **Compiler:** Solc version **`^0.8.29`** or higher.

### 🚀 Deployment Steps

1.  Open your chosen development environment (e.g., Remix IDE).
2.  Create a new file (e.g., `Calculator.sol`) and paste the contract code.
3.  Compile the contract using the compatible Solidity version.
4.  Deploy the contract to a test network or the **Remix VM**.

### 🖱️ Interacting with the Contract (Example)

To execute the operation **`5 + 10 - 3`**, you must perform the calls sequentially:

1.  Call **`reset()`**.
2.  Call **`addition(5)`**. (`currentResult` is now 5)
3.  Call **`addition(10)`**. (`currentResult` is now 15)
4.  Call **`substraction(3)`**. (`currentResult` is now 12)
5.  Call **`getCurrentResult()`** to retrieve the final result (**12**).

***

## 📄 License

This project is licensed under the **MIT** license.
