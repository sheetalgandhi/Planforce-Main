public  class IndexController{
    
    Integer hours;
    public String project_selected{get;set;}
    public integer g4g{get;set;}
    public integer ooo{get;set;}
    public integer dt{get;set;}
    //integer total = g4g + ooo + dt;
    public IndexController(){
        /*for(Activity_Resource__c ar : activityResourceList){
            names.add(ar.Activity_Name__c);
        }*/
    }
    
   public PageReference nextPage(){
        try{
            PageReference gotonextpage = new PageReference('/apex/second_page?project='+project_selected);   
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
    
    public List<Activity_Resource__c> activityResourceList{
        get {
           // return [SELECT Last_Week_Hours__c, Activity_Name__c FROM Activity_Resource__c WHERE Resource_Name__c = :'005i0000002PqVa'];
            return [SELECT Last_Week_Hours__c, Activity_Name__c, Default_Value__c FROM Activity_Resource__c WHERE Resource_Name__c = :UserInfo.getUserId()];
        }
        set;
    }
 
   public List<Project__c> projectList{
        get{
             return [Select Project__c.Hours__c, Project__c.Activity__r.Name from Project__c WHERE User__c = :UserInfo.getUserId()];  
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
    
    public void save(){
    
    }
    
    public void saveAsLastWeek(){
    
    }
    
    public void submit(){
    
    }

}