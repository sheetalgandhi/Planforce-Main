public  class IndexController3{
    
    Integer hours;
    public String project_selected{get;set;}
    public integer g4g{get;set;}
    public integer ooo{get;set;}
    public integer dt{get;set;}
    integer total = g4g + ooo + dt;
   
    public IndexController3(){
    }
    
   public PageReference nextPage(){
        try{
            PageReference gotonextpage = new PageReference('/apex/second_page');   
            gotonextpage.setRedirect(true);
            return gotonextpage;
        }
       catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Could not submit Timesheet'));
            return null;
        }  
   } 
    
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
    
   List<Activity_Resource__c> activityList = [SELECT Default_Value__c, Last_Week_Hours__c, Activity_Name__c FROM Activity_Resource__c WHERE Resource_Name__c = :UserInfo.getUserId()]; 
   
   List<Activity_Resource__c> saveList = null;
   
   public List<Activity_Resource__c> activityResourceList{
        get {
            return activityList;        
        }
        set;
    }
    
   public List<Activity_Resource__c> saveActivityTotalList{
        get {
            saveList = [SELECT Last_Week_Hours__c, Activity_Name__c FROM Activity_Resource__c WHERE Resource_Name__c = :UserInfo.getUserId()]; 
            return saveList;        
        }
        set;
    }

    public void setHours(){
        this.hours = hours;
    }
    
    public Integer getHours(){
        return hours;
    }
    
    public List<String> getNames(){
        return new String[]{};
    }
    
    public List<Activity_Resource__c> saveAsLastWeek(){
        activityList = [SELECT Last_Week_Hours__c, Activity_Name__c FROM Activity_Resource__c WHERE Resource_Name__c = :UserInfo.getUserId()];
        return activityResourceList; 
    }
    
    public void submit(){
        ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.CONFIRM, 'Success!'));
          
    }    

}