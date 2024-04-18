// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract MedicalLogging {
		address public owner;
		
		// constructor
    constructor() {
        owner = msg.sender; // 스마트 계약이 생성된 주소를 owner 변수에 저장
    }
    
		struct LoggingDetail {
        string transactionHash;
        string date;
    }
    
    struct Hospital{
			  LoggingDetail[] loggings;
			  uint256 loggingsCount;
		}
		
		
		mapping(address => Hospital) private hospitals;
		uint256 public hospitalCount;
    address[] private hospitalKeys;
     
		// 병원별 로깅 저장
    function addHospitalRecord(
        string memory _transactionHash,
        string memory _date
    ) public {
        Hospital storage record = hospitals[msg.sender];
        LoggingDetail memory detail = LoggingDetail({
            transactionHash: _transactionHash,
            date: _date
        });
        
        record.loggings.push(detail);
			  record.loggingsCount++;
			  
        // getter를 위해
				hospitalKeys.push(msg.sender);
				hospitalCount++;
    }
		
		function getHospitalRecord(address _address) public view returns (Hospital memory) {
        return hospitals[_address];
    }
    
    function getHospitalRecords() public view returns (Hospital[] memory){
		    Hospital[] memory records = new Hospital[](hospitalCount);
				for (uint256 i = 0; i < hospitalKeys.length; i++) {
						records[i] = hospitals[hospitalKeys[i]];
				}
				return records;
    }
		
}
