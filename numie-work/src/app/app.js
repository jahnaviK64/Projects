// import React from 'react';
// import ReactDOM from 'react-dom';

// var LoginComponent = React.createClass({
	  // getInitialState:function(){
     // return {
        // textVal:''
     // }
 // },
            // render: function() {
                // return(
				// <div>
				// <h4>{this.props.user}</h4>
				// <input type="text" className="form-control" value={this.state.textVal} autofocus="autofocus" placeholder = "Username/ Email"/>
				// <h4>{this.props.uspw}&nbsp;&nbsp;&nbsp;&nbsp;</h4>
				// <input type="password" className="form-control" value={this.state.textVal} autofocus="autofocus" placeholder = "Password"/> <br/>
				// <button type="button" className="btn btn-default">Sign In</button> &nbsp;
				// <button type="button" className="btn btn-primary">Login with Facebook</button>
				// </div>         
                // );
            // }
        // });

        // ReactDOM.render(
                // <div>
                    // <LoginComponent user="User Name:" uspw="Password:"/>
                // </div>,
                // document.querySelector('.js-app')
        // );
		
		
	// ************************ Code I am not able to integrate ************************
	// link: https://www.npmjs.com/package/react-facebook-login-component
	
	// Getting node component: npm install --save react-facebook-login-component
	
			// import React from 'react';
			// import { FacebookLogin } from 'react-facebook-login-component';
			 
			// class Login extends React.Component{
			 
			  // constructor (props, context) {
				// super(props, context);
			  // }
			 
			  // responseFacebook (response) {
				// console.log(response);
				// //anything else you want to do(save to localStorage)... 
			  // }
			 
			  // render () {
				// return (
				  // <div>
					// <FacebookLogin socialId="yourAppID"
								   // language="en_US"
								   // scope="public_profile,email"
								   // responseHandler={this.responseFacebook}
								   // xfbml={true}
								   // version="v2.5"
								   // class="facebook-login"
								   // buttonText="Login With Facebook"/>
				  // </div>
				// );
			  // }
			 
			// }
			 
			// export default Login;

import React from 'react';
import { FacebookLogin } from 'react-facebook-login-component';
import ReactDOM from 'react-dom';

var LoginComponent = React.createClass({
	  getInitialState:function(){
     return {
        textVal:''
     }
 },
            render: function() {
                return(
						<div>					
							<h4>{this.props.user}</h4>
							<input type="text" className="form-control" value={this.state.textVal} placeholder = "Username/ Email"/>
							<h4>{this.props.uspw}&nbsp;&nbsp;&nbsp;&nbsp;</h4>
							<input type="password" className="form-control" value={this.state.textVal} placeholder = "Password"/> <br/>
							<button type="button" className="btn btn-success">Sign In</button>  <br /> <br />
							<FacebookLogin socialId="178989525932133"
								   language="en_US"
								   scope="public_profile,email"
								   responseHandler={this.responseFacebook}
								   xfbml={true}
								   version="v2.5"
								   class="btn btn-primary" 
								   buttonText="Login With Facebook"
								   icon="fa-facebook"/>
						</div>         
                );
            }
        });

        ReactDOM.render(
                <div>
                    <LoginComponent user="User Name:" uspw="Password:"/>
                </div>,
                document.querySelector('.js-app')
        );
	function mapStateToProps(state) {
    return {
        errorMessage: state.auth.error,
        message: state.auth.message,
        authenticated: state.auth.authenticated
    };
}
	export default (mapStateToProps)(LoginComponent);
	// btn btn-lg btn-primary btn-block 
	// projects > numie-work