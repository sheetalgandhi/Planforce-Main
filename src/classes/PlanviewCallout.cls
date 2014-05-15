public class PlanviewCallout {
    
    
    @Future(callout=true) 
    public static void planviewCalloutSOAP() {
        
             List<schemasPlanviewComPlanviewenterprise.TimeReportedDto> timeDto = new List<schemasPlanviewComPlanviewenterprise.TimeReportedDto>();
             timeDto[0].ActivityKey  = 'key://2/$Plan/10692';
             timeDto[0].ResourceKey  ='key://2/$Res/2465';
             timeDto[0].Date_x = datetime.newInstance(2014,03,01);
             schemasPlanviewComPlanviewenterprise.ArrayOfTimeReportedDto dto = new schemasPlanviewComPlanviewenterprise.ArrayOfTimeReportedDto(); 
             dto.TimeReportedDto     =  timeDto;  
             //dto.inputHttpHeaders_x.put('Authorization', '2uRDhHEOgwspNzqaSZs42Vml4lWoulAbFCtKDeu467duUZVJDvRJAO6BqxtwazXIxYTEmzL8ohdoF8BLd7n9ureHOVTGk2qz6Gw5fYmcActC%2bh6OBRBLGjyd5OvZp%2bek1oW3Dc0cljePtJwOGvy78W9Es%2fldlki5pLI6wIL%2bO6CuJEQ51GrASUtHtgUb9ro2Ooz1pN26LbDHH3sSc3TLuiZgL%2fZCPKWboYHJs1F6K2c%3d'); 
             //GynJ3DHCk4UjrvFLnS7muUCVn7Mqrv3KvvEhyUwkvj2OQK%2fVs%2bqW%2byRzwrsu52tklT4ALBiXe%2bJ3EukyRp0BJv89XfI7pGgRuDZvznfltNMd1XnzHASV2P71htyVVjiEqI553UEIclhQS24A9bkHrKO69NTuktIzU%2brdZmlHVFZNgU0vO73b9AGG2bMsTTEMHoE9NtSGGCuyObiSn3Azc5TrDAoIv1BK8lU%2bIgD83ilNJXQawV%2bjC9wldWuOU3dNwIKzzni7YAXFe05Cr7CjFmVQCfHpTsDUYPGOxBdJJPY%3d
             schemasPlanviewComPlanviewenterprise.OpenSuiteResult result = new  schemasPlanviewComPlanviewenterprise.OpenSuiteResult();
             schemasPlanviewComPlanviewenterprise.BasicHttpBinding_ITimeReportedService port = new schemasPlanviewComPlanviewenterprise.BasicHttpBinding_ITimeReportedService();
             result = port.Read( dto);
             system.debug('result is' +result);
    }
       
    
}