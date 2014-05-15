public with sharing class secondPageController2 {

   public integer sun{get;set;}
   public integer mon{get;set;}
   public integer tue{get;set;}
   public integer wed{get;set;}
   public integer thu{get;set;}
   public integer fri{get;set;}
   public integer sat{get;set;}
   

   public secondPageController2(){}
   
    public PageReference save() {    
        Integer total = sun + mon + tue + wed + thu + fri + sat;
        
        try{
            Project__c  project = new Project__c();
            project.Activity__c = 'g4g';
            project.Hours__c = total;
            project.User__c = UserInfo.getUserId();
            insert project;
            PageReference backToMainPage = new PageReference('/apex/index3?hours_entered='+total);   
                backToMainPage.setRedirect(true);
                return backToMainPage;
            }
         catch (DMLException e) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Could not submit Timesheet'));
                return null;
            } 
    }

   public PageReference back() {
    try{
     PageReference backToMainPage = new PageReference('/apex/index3');   
        backToMainPage.setRedirect(true);
        return backToMainPage;
        }
       catch (DMLException e) {
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Could not submit Timesheet'));
        return null;
    }  
    }
}