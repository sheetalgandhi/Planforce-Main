@isTest
global class WebServiceMockImpl implements WebServiceMock {
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType){
                schemasPlanviewComPveCore20080520.LoginResponse_element responseElement = new schemasPlanviewComPveCore20080520.LoginResponse_element();
                responseElement.LoginResult = 'Mock Response';
                response.put('response_x', responseElement);
           }


}