Public class callExternalWS  
{ 
  public String loginResponse(String userName,String password,String dataSource){
    // dataSource = sldev , username = dmason , pwd = temp
    String LoginResultCookie = null;
    System.debug('Start LoginResponse');
    HttpRequest httpRequest = new HttpRequest();  
    System.debug('Set HTTPRequest Method');  
    httpRequest.setMethod('POST');  
    httpRequest.setEndpoint('https://salesforce.pvcloud.com/planview/services/LoginService.svc');  
    httpRequest.setHeader('Content-Type', 'text/xml; charset=utf-8');  
    httpRequest.setHeader('SOAPAction', 'http://schemas.planview.com/PVE/Core/2008/05/20/ILoginService/Login');
    String soapRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://schemas.planview.com/PVE/Core/2008/05/20">'+
                 '<soapenv:Header/>'+
                 '<soapenv:Body>'+
                 '<ns:Login>'+
                 '<ns:datasource>' + dataSource + '</ns:datasource>'+
                 '<ns:userName>' + userName + '</ns:userName>'+
                 '<ns:password>' + password + '</ns:password>'+
                 '</ns:Login>'+
                 '</soapenv:Body>'+
                 '</soapenv:Envelope>';  
    httpRequest.setBody(soapRequest);  
    Http http = new Http();  
    try {  
      //Execute web service call her         
      HTTPResponse response = http.send(httpRequest);     
      //Helpful debug messages  
      System.debug('Read response body : ' + response.getBody());
      System.debug('Request String : ' + response.toString());  
      System.debug('STATUS:'+response.getStatus());  
      System.debug('STATUS_CODE:'+response.getStatusCode());
      
      System.debug('Start parsing xml for LoginResponse');
      Dom.Document doc = response.getBodyDocument();
      System.debug('Retrieve the root element for this document.');
      Dom.XMLNode domRoot = doc.getRootElement();
      Dom.XMLNode domBody = domRoot.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
      Dom.XMLNode domLoginResponse = domBody.getChildElement('LoginResponse', 'http://schemas.planview.com/PVE/Core/2008/05/20');
      LoginResultCookie = domLoginResponse.getChildElement('LoginResult', 'http://schemas.planview.com/PVE/Core/2008/05/20').getText();
      System.debug('Login Result Cookie : ' + LoginResultCookie);
    } catch(System.CalloutException e) {  
        //Exception handling goes here....  
    }
    return LoginResultCookie;
  } 

    public void upsertMinutes(String activityKey,String resourceKey,String date,Decimal hours)  
    { 
      hours = 168;
      String LoginResultCookie = loginResponse('dmason','temp','sldev');
        System.debug('Start upsert');
        HttpRequest reqUpsert = new HttpRequest();  
        //Set HTTPRequest Method  
        reqUpsert.setMethod('POST');  
        reqUpsert.setEndpoint('https://salesforce.pvcloud.com/planview/services/TimeReportedService.svc');  
        reqUpsert.setHeader('Content-Type', 'text/xml; charset=utf-8');
        reqUpsert.setHeader('Cookie', 'LoginCert=' + LoginResultCookie);
        reqUpsert.setHeader('SOAPAction', 'http://schemas.planview.com/PlanviewEnterprise/Services/TimeReportedService/2013/03/ITimeReportedService/Upsert'); 
        String b = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://schemas.planview.com/PlanviewEnterprise/Services/TimeReportedService/2013/03" xmlns:ns1="http://schemas.planview.com/PlanviewEnterprise/OpenSuite/Dtos/TimeReportedDto/2013/03" xmlns:ns2="http://schemas.planview.com/PlanviewEnterprise/OpenSuite/Dtos/TimeReportedOptionsDto/2013/03">'+
            '<soapenv:Header/>'+
            '<soapenv:Body>'+
            '<ns:Upsert>'+
            '<ns:dtos>'+
            '<ns1:TimeReportedDto>'+
            '<ns1:ActivityKey>key://2/$Plan/2960</ns1:ActivityKey>'+
            '<ns1:ActualEffort>'+ hours + '</ns1:ActualEffort>'+
            '<ns1:Date>2013-10-30</ns1:Date>'+
            '<ns1:IntegratedStatus>Entered</ns1:IntegratedStatus>'+
            '<ns1:ResourceKey>key://2/$Res/2537</ns1:ResourceKey>'+
            '</ns1:TimeReportedDto>'+
            '</ns:dtos>'+
            '</ns:Upsert>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';  
        reqUpsert.setBody(b);  
        Http httpUpsert = new Http();  
        try {  
          //Execute web service call here         
          HTTPResponse resUpsert = httpUpsert.send(reqUpsert);     
          //Helpful debug messages  
          System.debug('body : ' + resUpsert.getBody());
          System.debug('Resquest String : ' + resUpsert.toString());  
          System.debug('STATUS:'+resUpsert.getStatus());  
          System.debug('STATUS_CODE:'+resUpsert.getStatusCode()); 
       } catch(System.CalloutException e) {  
            //Exception handling goes here....          
       }
   }  
}