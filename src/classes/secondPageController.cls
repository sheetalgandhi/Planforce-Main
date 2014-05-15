public with sharing class secondPageController {

   public integer sun{get;set;}
   public integer mon{get;set;}
   public integer tue{get;set;}
   public integer wed{get;set;}
   public integer thu{get;set;}
   public integer fri{get;set;}
   public integer sat{get;set;}
   public String activity_selected{get;set;}
  
    public String startOfWeek{
   get{
        Date startOfWeek = System.today().toStartOfWeek();
        return datetime.newInstance(startOfWeek, time.newInstance(0,0,0,0)).format('MMM dd');
    }
    set;}

   public String endOfWeek{
   get{
       Date endOfWeek = System.today().toStartOfWeek().addDays(6);
       return datetime.newInstance(endOfWeek, time.newInstance(0,0,0,0)).format('MMM dd');
   }
   set;}
  
   public secondPageController(){}
   
    public PageReference save() {
    
    integer total = sun + mon + tue + wed + thu + fri + sat;
    try{
    //Activity_Resource__c  activity = new Activity_Resource__c();
    //activity.Activity_Name__c='CFL Backlog';
    //activity.Last_Week_Hours__c = total;
    //activity.Resource_Name__c = UserInfo.getUserId();
    
    
    Activity_Resource__c act = [SELECT Activity_Name__c, Last_Week_Hours__c FROM Activity_Resource__c WHERE Resource_Name__c = :UserInfo.getUserId() Limit 1];
    act.Activity_Name__c='CFL Backlog';
    act.Last_Week_Hours__c = total;
    
    upsert act;
    
    
    PageReference backToMainPage = new PageReference('/apex/index?hours_entered='+total+'&activity_selected='+activity_selected);   
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
     PageReference backToMainPage = new PageReference('/apex/index');   
        backToMainPage.setRedirect(true);
        return backToMainPage;
        }
       catch (DMLException e) {
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Could not submit Timesheet'));
        return null;
    }  
    }
}