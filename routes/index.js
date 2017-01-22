var express = require('express');
var router = express.Router();
var bodyParser     =         require("body-parser");
var firebase = require("firebase");

var config = {
	apiKey: "AIzaSyC6GK4lbZeM-MmtdGsLF3m5GLCWsTmOtBA",
	authDomain: "deaddict-8321f.firebaseapp.com",
	databaseURL: "https://deaddict-8321f.firebaseio.com",
	storageBucket: "deaddict-8321f.appspot.com",
	messagingSenderId: "585605368899"
};

firebase.initializeApp(config);


function writeUserData(name, password, email) {
	firebase.database().ref('users/' + name).set({
		email: email,
		password: password
	});
	console.log("Complete!")
}

/* GET home page. */
router.get('/', function(req, res, next) {
	res.render('index', { title: 'Express' });
});

router.post('/new',function(req,res){
	console.log(req.body);
	var name=req.body.name;
	var user_name=req.body.email;
	var password=req.body.password;
	var customerNum = req.body.customerNum;
	//console.log("User name = "+user_name+", password is "+password);
	
	firebase.database().ref('users/' + name).set({
		email: user_name,
		password: password, 
		customer_numer: customerNum
	});
	
	console.log("Complete!")
	res.render('index', { title: 'Express' });
});

module.exports = router;
