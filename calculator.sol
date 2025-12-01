// SPDX-License-Identifier: MIT

pragma solidity ^0.8.29;

contract calculator {
    
    // Variables
    uint public currentResult;

    constructor() {
        currentResult = 0;
    }

    // Modifiers
    modifier checkNumber(uint newNumber_) {
        if (newNumber_ == 0) revert ('Cannot divide by "0"');
        _;
    }

    // Events
    event Addition(uint previousResult, uint newNumber, uint finalResult);
    event Substraction(uint previousResult, uint newNumber, uint finalResult);
    event Multiplier(uint previousResult, uint newNumber, uint finalResult);
    event Division(uint previousResult, uint newNumber, uint finalResult);
    event Percentage(uint baseValue, uint percentageValue, uint calculatedAmount);




    // -------------------------🌍 EXTERNAL FUNCTIONS.-----------------------------------
    

    function addition(uint newNumber_) public returns(uint result_) {
        uint previousResult = currentResult;
        
        currentResult = add_logic(currentResult, newNumber_);
        result_ = currentResult;

        emit Addition(previousResult, newNumber_, result_);
    }

    function substraction(uint newNumber_) public returns(uint result_) {
        uint previousResult = currentResult;
        
        currentResult = sub_logic(currentResult, newNumber_);
        result_ = currentResult;

        emit Substraction(previousResult, newNumber_, result_);
    }

    function multiplier(uint newNumber_) public returns(uint result_) {
        uint previousResult = currentResult;
        
        currentResult = mul_logic(currentResult, newNumber_);
        
        emit Multiplier(previousResult, newNumber_, currentResult); 
        return currentResult;
    }

    function division(uint newNumber_) public checkNumber(newNumber_) returns(uint result_) {
        uint previousResult = currentResult;
        
        currentResult = div_logic(currentResult, newNumber_);
        result_ = currentResult;

        emit Division(previousResult, newNumber_, result_);
    }
    
    function percentage(uint percentage_) public returns(uint calculatedAmount_) {
        uint baseValue = currentResult;
        
        currentResult = percentage_logic(currentResult, percentage_);

        emit Percentage(baseValue, percentage_, currentResult);
        
        return currentResult;
    }

    function reset() public {
        currentResult = 0;
    }

    function getCurrentResult() public view returns (uint) {
        return currentResult;
    }


    //  ----------------------------⚙️ INTERNAL FUNCTIONS.--------------------------------


    function add_logic(uint operand1, uint operand2) internal pure returns(uint result_) {
        result_ = operand1 + operand2;
    }
    
    function sub_logic(uint operand1, uint operand2) internal pure returns(uint result_) {
        result_ = operand1 - operand2;
    }

    function mul_logic(uint operand1, uint operand2) internal pure returns(uint result_) {
        result_ = operand1 * operand2;
    }

    function div_logic(uint operand1, uint operand2) internal pure returns(uint result_) {
        // La validación de 'operand2 != 0' se hace en el modificador de la función externa.
        result_ = operand1 / operand2;
    }

    function percentage_logic(uint baseValue, uint percentageValue) internal pure returns(uint result_) {
        result_ = (baseValue * percentageValue) / 100;
    }
}