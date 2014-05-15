public class WebSvcCallout{
    public static String callLoginResult(String datasource, String username, String password){
        schemasPlanviewComPveCore20080520.BasicHttpBinding_ILoginService sample = new schemasPlanviewComPveCore20080520.BasicHttpBinding_ILoginService();
        String echo = sample.Login(datasource,username,password);
        return echo;
    }
}