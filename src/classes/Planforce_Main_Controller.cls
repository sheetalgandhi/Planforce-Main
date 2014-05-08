public class Planforce_Main_Controller {

    public String nextPage { get; set; }
    public String myString {get; set;}
    public Integer defaultValue {get; set;}
     public String allHours {get; set;}
     public String currentHours {get; set;}    
//     public String total {get; set;}
//     public String currentActivity {get; set;}
    
    
    /* public void setAllHours(List<String> hours) {
    Integer i=0;
       for(String h : hours)
       {
       allHours[i] = Integer.valueOf(h) ;
       i++;  
       } 
      }   */
      

    public String sendCurrentHours() 
    {
 //       currentHours = Apexpages.currentPage().getParameters().get('currentHours');
         currentHours = '10';
        return currentHours;
    }
    
    public PageReference save() {
     List<String> temp = allHours.split(',');
     Integer i=0;
     for(Activity_Resource__c act : activityList)
      {
        act.Last_Week_Hours__c = Integer.valueOf(temp[i]);
        i++;
         upsert act;
      }
      
      PageReference gotoNextPage = new PageReference('/apex/Sheetal_Planforce?flag=true');   
            gotoNextPage.setRedirect(true);
            return gotonextpage;
       
    }
    

//        public PageReference saveCurrentHours() {
//         return null;
//    }

    public Planforce_Main_Controller() {
        setUserName();
        myString = '';
        defaultValue = 0;
    }

    // Method for testing a hidden field functionality 
    public PageReference myMethod(){
        System.debug('myString: ' + myString);
        return null;
    }



    private final Account account;
    public String userName{get;set;}
    
    
    public String getfakeError() {
        return 'This is error';
    }
    
   public String startOfWeek{
   get{
        Date startOfWeek = System.today().toStartOfWeek();
        return datetime.newInstance(startOfWeek, time.newInstance(0,0,0,0)).format('MMM dd');
    }
    set;}

   public List<String> wholeWeek{
   get{
       Date startOfWeek = System.today().toStartOfWeek();
        List<String> week = new List<String>();
       for(Integer i=0;i<7;i++){
        Date nextDay = System.today().toStartOfWeek().addDays(i);
        week.add(datetime.newInstance(nextDay, time.newInstance(0,0,0,0)).format('E, MMM dd'));
       }
       return week;
    }
    set;}

   public List<String> nextWeek{
   get{
       Date startOfWeek = System.today().toStartOfWeek();
        List<String> week = new List<String>();
       for(Integer i=0;i<7;i++){
        Date nextDay = System.today().toStartOfWeek().addDays(i);
        week.add(datetime.newInstance(nextDay, time.newInstance(0,0,0,0)).format('MMM dd'));
       }
       return week;
    }
    set;}

   public String endOfWeek{
   get{
       Date endOfWeek = System.today().toStartOfWeek().addDays(6);
       return datetime.newInstance(endOfWeek, time.newInstance(0,0,0,0)).format('MMM dd');
   }
   set;}

    public List<Activity_Resource__c> activityList{
        get {
            //PlanviewCallout.planviewCalloutSOAP();
            return [SELECT Activity_Name__c, Last_Week_Hours__c, Current_Week_Hours__c FROM Activity_Resource__c WHERE Resource_Name__c = :UserInfo.getUserId()];
        }
        set;
    }

    public void setUserName(){
        this.userName = UserInfo.getName();
    }
    public void testWS(){
        //wsdl callout
      system.debug('Before Callout');
      PlanviewCallout.planviewCalloutSOAP();
      system.debug('After Callout');
    }
    public PageReference getNextPage(){
        try{
            PageReference gotoNextPage = new PageReference('/apex/second_page');   
            gotoNextPage.setRedirect(true);
            return gotonextpage;
        }
       catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Could not submit Timesheet'));
            return null;
        }  
   }     
 }