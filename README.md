We are using SAML 2.0, and the heavy part, as usual, is done at the server level (thanks Dave). 

In this scenario, we only need to present a web view with the login page. After authenticating the user, we need to retrieve the token, and that could be done with a custom scheme. If we, from the web, triger a link to something like `fwk://cbe?token=thisisatoken`, then, we can set ourselves as the scheme handler. The OS is going to call us, and we can extract the token from the url, and activate the app. 

The current app illustrate the basic flow. 