public class LoginSOAPCallout{

    public static String getLoginResult(){
        String datasource = 'sldev';
        string username = 'dmason';
        string password = 'temp';
        schemasPlanviewComPveCore20080520.BasicHttpBinding_ILoginService iLoginService = new schemasPlanviewComPveCore20080520.BasicHttpBinding_ILoginService();
        String loginResult = iLoginService.Login(datasource,username,password);
        System.debug('$$$ loginresult value ' + loginResult);
        
        schemasPlanviewComPlanviewenterprise.BasicHttpBinding_ITimeReportedService stub = new schemasPlanviewComPlanviewenterprise.BasicHttpBinding_ITimeReportedService();
        stub.inputHttpHeaders_x = new Map<String,String>();
        stub.inputHttpHeaders_x.put('Cookie','LoginCert='+loginResult);
        
        
        schemasPlanviewComPlanviewenterprise.TimeReportedOptionsDto optionsDTO = new schemasPlanviewComPlanviewenterprise.TimeReportedOptionsDto();
        optionsDTO.AssignmentMustExist = false;
        optionsDTO.DateMustBeEqualToOrAfterCutoff = false;
        optionsDTO.StatusRulesMustBeFollowed = false;
        
        List<schemasPlanviewComPlanviewenterprise.TimeReportedDto> timeDTO = new List<schemasPlanviewComPlanviewenterprise.TimeReportedDto>();
        //trDto.ActivityKey  = 'key://2/$Plan/10692';
        schemasPlanviewComPlanviewenterprise.TimeReportedDto trDto = new schemasPlanviewComPlanviewenterprise.TimeReportedDto();  
        trDto.ActivityKey  = 'key://2/$Plan/2960';
        trDto.ResourceKey  = 'key://2/$Res/2537';
        trDto.ActualEffort =348;
        trDto.Date_x = datetime.newInstance(2013,10,30);
        trDto.IntegratedStatus = 'Entered';
        
        timeDTO.add(trDto);
        
        schemasPlanviewComPlanviewenterprise.ArrayOfTimeReportedDto dtos = new schemasPlanviewComPlanviewenterprise.ArrayOfTimeReportedDto();
        dtos.TimeReportedDto =  timeDTO;
        
        schemasPlanviewComPlanviewenterprise.OpenSuiteResult openSuiteResult = stub.Upsert_x(dtos,optionsDTO);
        
        
        /**
        List<schemasPlanviewComPlanviewenterprise.TimeReportedDto> timeDTO1 = new List<schemasPlanviewComPlanviewenterprise.TimeReportedDto>();
        //trDto.ActivityKey  = 'key://2/$Plan/10692';
        schemasPlanviewComPlanviewenterprise.TimeReportedDto trDto1 = new schemasPlanviewComPlanviewenterprise.TimeReportedDto();  
        trDto1.ActivityKey  = 'key://2/$Plan/2960';
        trDto1.ResourceKey  ='key://2/$Res/2537';
        trDto1.Date_x = datetime.newInstance(2013,10,30);
        timeDTO1.add(trDto1);
        
        schemasPlanviewComPlanviewenterprise.ArrayOfTimeReportedDto dtos1 = new schemasPlanviewComPlanviewenterprise.ArrayOfTimeReportedDto();
        dtos1.TimeReportedDto =  timeDTO1;
        
        schemasPlanviewComPlanviewenterprise.OpenSuiteResult openSuiteResult1 = stub.Read(dtos1);
        **/
        
        System.debug('$$$ openSuiteResult' + openSuiteResult);
        return loginResult;
    }



}