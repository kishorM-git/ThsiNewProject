global class BatchAccount implements Database.Batchable<sObject>{
	
	global Database.QueryLocator start(Database.BatchableContext BC){
		return Database.GetQueryLocator('select Id,Type,Rating from Account where Rating != \'Hot\' and Type = \'Prospect\'');
	}
	global void execute(Database.BatchableContext BC, List<Account> accList){
		if(!accList.isEmpty()){
			for(Account objAcc : accList){
				objAcc.Rating = 'Hot';
			}
		}
		Database.Update(accList,false);
	}
	global void finish(Database.BatchableContext BC){
	
	}
}