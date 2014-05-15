@isTest
private class WebSvcCalloutTest {
    @isTest static void testEchoString(){
        //Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
        String output = WebSvcCallout.callLoginResult('sldev', 'schopde', 'temp');
        System.debug('output &&& ' + output);

    }
}