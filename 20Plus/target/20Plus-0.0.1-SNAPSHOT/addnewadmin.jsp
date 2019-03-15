<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error/admin_error_page.jsp"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
	<script src="js/validation.js" type="text/javascript"></script>
	
	
<script>
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="css/myStyles.css">
<style>

input[type=text], input[type=textarea], input[type=password],input[type=number], input[type=email], select {
width: 95%;
color: black;
padding: 6px 20px;
margin: 8px 0;
display: inline-block;
border: 1px solid #ccc;
border-radius: 4px;
box-sizing: border-box;
font-size: 18px;

}


label {
    /* display: inline-block; */
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 500;
}



.tex {
	font-family: sans-serif;
	display: inherit;
	
}
.fil{
	margin-left: 40px;
}





.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  
}




.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
  width: 255px;
}

.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}

.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}

.button {
    position: relative;
    background-color: #1E90FF;
    border: none;
    font-size: 22px;
    color: #FFFFFF;
    padding: 0px;
    width: 140px;
    height: 45px;
    border-radius: 5px;
    text-align: center;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    text-decoration: none;
    overflow: hidden;
    cursor: pointer;
}

.button:after {
    content: "";
    background: white;
    display: block;
    position: absolute;
    padding-top: 300%;
    padding-left: 350%;
    margin-left: -20px!important;
    margin-top: -120%;
    opacity: 0;
    transition: all 0.8s
}

.button:active:after {
    padding: 0;
    margin: 0;
    opacity: 1;
    transition: 0s
}

* {
box-sizing: border-box;
}

.wrapper {
display: flex;
align-items: center;
flex-direction: column; 
justify-content: center;
width: 100%;
min-height: 60%;
padding: 20px;
}
.login {

border-radius: 19px 19px 19px 19px;
padding: 15px 20px 20px 20px;
width: 110%;
max-width: 420px;
background: #ffffff;
position: relative;
padding-bottom: -5px;
box-shadow: 12px 29px 94px rgba(0, 0, 0, 0.3);
height: 415px;
border: 1px groove white;

}

</style>
</head>
<%
	if(session.getAttribute("isEnabled")==null){
		response.sendRedirect("admin.jsp");
	}
%>
<body>

<nav class="navbar navbar-inverse" style="background-color:#1E90FF;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="color:white;font-size:25px">TwentyPlus</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" style="color:white"><span class="glyphicon glyphicon-user"></span> ${admin_name}</a></li>
            <li><a href="adminhome.jsp" style="color:white"><span class="glyphicon glyphicon-home"></span> Dashboard</a></li>
      <li><a href="adminlogout.jsp" style="color:white"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<link href="//db.onlinewebfonts.com/c/a4e256ed67403c6ad5d43937ed48a77b?family=Core+Sans+N+W01+35+Light" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="form.css" type="text/css">
<div class="body-content">
<div class="module">
<br><br><br>
<img src="images/adduser.png" width="80px" height="80px" style="margin-top:-67px;margin-left:650px"/>
<h1 style="margin-left: 600px;color:black;margin-top:2px;font-family:serif">Add New Admin</h1>
<br/>

<div id="hid" style="margin-left:90px; margin-top:-60px">
<div class="wrapper">
<form class="login" action="addnewAdmin" style="margin-top:5px;" method="post">
<label class="tex" style="font-size: 18px;fant-family:serif">Name </label>
<input type="text" onkeypress="checkNum5()" name="userName"><br/>
<label class="tex" style="font-size: 18px;fant-family:serif">Address </label>
<input type="text" name="userAddress" placeholder="" maxlength="50" required> <br/>
<input type="text" onkeypress="checkNum3()" name="pinCode" min="0" max="999999" maxlength="6" placeholder="Pin Code" required><br/>
<label class="tex" style="font-size: 18px;fant-family:serif " required>Phone Number </label>
<input type="text" id="addUserMobileNo" name="phoneNo" onkeypress="checkNum1()" required min="0" max="9999999999" maxlength="10" placeholder="+91" required> 
<br/><input class="button" type="submit" style="margin-left: 100px;margin-top:30px" value="Submit"/>
</form>


</p>
</div>
</div>
</div>
<script>
function checkNum1(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>
 <script>
function checkNum2(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>
 <script>
function checkNum3(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>

<script>
function checkNum4(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>

<script>
function checkNum5(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[A-z]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>





<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var countries = [
"Anantapur",
"Chittoor",
"East Godavari",
"Guntur",
"Krishna",
"Kurnool",
"Prakasam",
"Srikakulam",
"Sri Potti Sriramulu Nellore",
"Visakhapatnam",
"Vizianagaram",
"West Godavari",
"Y.S.R.",
"Arunachal Pradesh",
"Anjaw",
"Changlang",
"Dibang Valley (Upper Dibang Valley)",
"East Kameng",
"East Siang",
"Kra Daadi ( Kurung Kumey)",
"Kurung Kumey",
"Lohit",
"Longding ( Tirap)",
"Lower Dibang Valley",
"Lower Siang (West Siang & East Siang)",
"Lower Subansiri",
"Namsai ( Lohit)",
"Papum Pare",
"Siang ( West Siang & East Siang)",
"Tawang",
"Tirap",
"Upper Siang",
"Upper Subansiri",
"West Kameng",
"West Siang",
"Assam",
"Baksa",
"Barpeta",
"Biswanath ( Sonitpur)",
"Bongaigaon",
"Cachar",
"Charaideo ( Sivasagar)",
"Chirang",
"Darrang",
"Dhemaji",
"Dhubri",
"Dibrugarh",
"Dima Hasao",
"Goalpara",
"Golaghat",
"Hailakandi",
"Hojai ( Nagaon)",
"Jorhat",
"Kamrup",
"Kamrup Metropolitan",
"Karbi Anglong",
"Karimganj",
"Kokrajhar",
"Lakhimpur",
"Majuli ( Jorhat)",
"Morigaon",
"Nagaon",
"Nalbari",
"Sivasagar",
"Sonitpur",
"South Salmara-Mankachar ( Dhubri)",
"Tinsukia",
"Udalguri",
"West Karbi Anglong ( Karbi Anglong)",
"Bihar",
"Araria",
"Arwal",
"Aurangabad",
"Banka",
"Begusarai",
"Bhagalpur",
"Bhojpur",
"Buxar",
"Darbhanga",
"Gaya",
"Gopalganj",
"Jamui",
"Jehanabad",
"Kaimur",
"Katihar",
"Khagaria",
"Kishanganj",
"Lakhisarai",
"Madhepura",
"Madhubani",
"Munger",
"Muzaffarpur",
"Nalanda",
"Nawada",
"Pashchim Champaran",
"Patna",
"Purba Champaran",
"Purnia",
"Rohtas",
"Saharsa",
"Samastipur",
"Saran",
"Sheikhpura",
"Sheohar",
"Sitamarhi",
"Siwan",
"Supaul",
"Vaishali",
"Chandigarh",
"Chandigarh",
"Chhattisgarh",
"Balod (← Durg)",
"Baloda Bazar ( Raipur)",
"Balrampur ( Surguja)",
"Bastar",
"Bemetara (Durg)",
"Bijapur",
"Bilaspur",
"Dakshin Bastar Dantewada",
"Dhamtari",
"Durg",
"Gariaband ( Raipur)",
"Janjgir-Champa",
"Jashpur",
"Kabirdham (Kabeerdham)",
"Kondagaon ( Bastar)",
"Korba",
"Koriya",
"Mahasamund",
"Mungeli ( Bilaspur)",
"Narayanpur",
"Raigarh",
"Raipur",
"Rajnandgaon",
"Sukma (← Dakshin Bastar Dantewada)",
"Surajpur (Surguja)",
"Surguja",
"Uttar Bastar Kanker",
"Dadra & Nagar Haveli",
"Dadra & Nagar Haveli",
"Daman & Diu",
"Daman",
"Diu",
"Delhi",
"Central",
"East",
"New Delhi",
"North",
"North East",
"North West",
"Shahdara ( East & North East)",
"South",
"South East (South)",
"South West",
"West",
"Goa",
"North Goa",
"South Goa",
"Gujarat",
"Ahmadabad",
"Amreli",
"Anand",
"Aravalli ",
"Banas Kantha",
"Bharuch",
"Bhavnagar",
"Botad ( Ahmadabad & Bhavnagar)",
"Chhota Udaipur ( Vadodara)",
"Devbhumi Dwarka (Jamnagar)",
"Dohad",
"Gandhinagar",
"Gir Somnath ( Junagadh)",
"Jamnagar",
"Junagadh",
"Kachchh",
"Kheda",
"Mahesana",
"Mahisagar ( Kheda & Panch Mahals)",
"Morbi ( Rajkot & Surendranagar)",
"Narmada",
"Navsari",
"Panch Mahals",
"Patan",
"Porbandar",
"Rajkot",
"Sabar Kantha",
"Surat",
"Surendranagar",
"Tapi",
"The Dangs",
"Vadodara",
"Valsad",
"Haryana",
"Ambala",
"Bhiwani",
"Charkhi Dadri (Bhiwani)",
"Faridabad",
"Fatehabad",
"Gurgaon",
"Hisar",
"Jhajjar",
"Jind",
"Kaithal",
"Karnal",
"Kurukshetra",
"Mahendragarh",
"Mewat",
"Palwal",
"Panchkula",
"Panipat",
"Rewari",
"Rohtak",
"Sirsa",
"Sonipat",
"Yamunanagar",
"Himachal Pradesh",
"Bilaspur",
"Chamba",
"Hamirpur",
"Kangra",
"Kinnaur",
"Kullu",
"Lahul & Spiti",
"Mandi",
"Shimla",
"Sirmaur",
"Solan",
"Una",
"Jammu & Kashmir",
"Anantnag",
"Badgam",
"Bandipore",
"Baramula",
"Doda",
"Ganderbal",
"Jammu",
"Kargil",
"Kathua",
"Kishtwar",
"Kulgam",
"Kupwara",
"Leh",
"Pulwama",
"Punch",
"Rajouri",
"Ramban",
"Reasi",
"Samba",
"Shupiyan",
"Srinagar",
"Udhampur",
"Jharkhand",
"Bokaro",
"Chatra",
"Deoghar",
"Dhanbad",
"Dumka",
"Garhwa",
"Giridih",
"Godda",
"Gumla",
"Hazaribagh",
"Jamtara",
"Khunti",
"Kodarma",
"Latehar",
"Lohardaga",
"Pakur",
"Palamu",
"Pashchimi Singhbhum",
"Purbi Singhbhum",
"Ramgarh",
"Ranchi",
"Sahibganj",
"Saraikela-kharsawan",
"Simdega",
"Karnataka",
"Bagalkot",
"Bangalore",
"Bangalore Rural",
"Belgaum",
"Bellary",
"Bidar",
"Bijapur",
"Chamarajanagar",
"Chikkaballapura",
"Chikmagalur",
"Chitradurga",
"Dakshina Kannada",
"Davanagere",
"Dharwad",
"Gadag",
"Gulbarga",
"Hassan",
"Haveri",
"Kodagu",
"Kolar",
"Koppal",
"Mandya",
"Mysore",
"Raichur",
"Ramanagara",
"Shimoga",
"Tumkur",
"Udupi",
"Uttara Kannada",
"Yadgir",
"Kerala",
"Alappuzha",
"Ernakulam",
"Idukki",
"Kannur",
"Kasaragod",
"Kollam",
"Kottayam",
"Kozhikode",
"Malappuram",
"Palakkad",
"Pathanamthitta",
"Thiruvananthapuram",
"Thrissur",
"Wayanad",
"Lakshadweep",
"Lakshadweep",
"Madhya Pradesh",
"Agar Malwa ( Shajapur)",
"Alirajpur",
"Anuppur",
"Ashoknagar",
"Balaghat",
"Barwani",
"Betul",
"Bhind",
"Bhopal",
"Burhanpur",
"Chhatarpur",
"Chhindwara",
"Damoh",
"Datia",
"Dewas",
"Dhar",
"Dindori",
"Guna",
"Gwalior",
"Harda",
"Hoshangabad",
"Indore",
"Jabalpur",
"Jhabua",
"Katni",
"Khandwa (East Nimar)",
"Khargone (West Nimar)",
"Mandla",
"Mandsaur",
"Morena",
"Narsimhapur",
"Neemuch",
"Panna",
"Raisen",
"Rajgarh",
"Ratlam",
"Rewa",
"Sagar",
"Satna",
"Sehore",
"Seoni",
"Shahdol",
"Shajapur",
"Sheopur",
"Shivpuri",
"Sidhi",
"Singrauli",
"Tikamgarh",
"Ujjain",
"Umaria",
"Vidisha",
"Maharashtra",
"Ahmadnagar",
"Akola",
"Amravati",
"Aurangabad",
"Bhandara",
"Bid",
"Buldana",
"Chandrapur",
"Dhule",
"Gadchiroli",
"Gondiya",
"Hingoli",
"Jalgaon",
"Jalna",
"Kolhapur",
"Latur",
"Mumbai",
"Mumbai Suburban",
"Nagpur",
"Nanded",
"Nandurbar",
"Nashik",
"Osmanabad",
"Palghar (Thane)",
"Parbhani",
"Pune",
"Raigad (Raigarh)",
"Ratnagiri",
"Sangli",
"Satara",
"Sindhudurg",
"Solapur",
"Thane",
"Wardha",
"Washim",
"Yavatmal",
"Manipur",
"Bishnupur",
"Chandel",
"Churachandpur",
"Imphal East",
"Imphal West",
"Jiribam ( Imphal East)",
"Kakching ( Thoubal)",
"Kamjong ( Ukhrul)",
"Kangpokpi ( Senapati)",
"Noney (Tamenglong)",
"Pherzawl ( Churachandpur)",
"Senapati",
"Tamenglong",
"Tengnoupal ( Chandel)",
"Thoubal",
"Ukhrul",
"Meghalaya",
"East Garo Hills",
"East Jaintia Hills ( Jaintia Hills)",
"East Khasi Hills",
"North Garo Hills ( East Garo Hills)",
"Ribhoi",
"South Garo Hills",
"South West Garo Hills ( West Garo Hills)",
"South West Khasi Hills ( West Khasi Hills)",
"West Garo Hills",
"West Jaintia Hills ( Jaintia Hills)",
"West Khasi Hills",
"Mizoram",
"Aizawl",
"Champhai",
"Kolasib",
"Lawngtlai",
"Lunglei",
"Mamit",
"Saiha",
"Serchhip",
"Nagaland",
"Dimapur",
"Kiphire",
"Kohima",
"Longleng",
"Mokokchung",
"Mon",
"Peren",
"Phek",
"Tuensang",
"Wokha",
"Zunheboto",
"Odisha (Orissa)",
"Anugul",
"Balangir",
"Baleshwar",
"Bargarh",
"Baudh",
"Bhadrak",
"Cuttack",
"Debagarh",
"Dhenkanal",
"Gajapati",
"Ganjam",
"Jagatsinghapur",
"Jajapur",
"Jharsuguda",
"Kalahandi",
"Kandhamal",
"Kendrapara",
"Kendujhar",
"Khordha",
"Koraput",
"Malkangiri",
"Mayurbhanj",
"Nabarangapur",
"Nayagarh",
"Nuapada",
"Puri",
"Rayagada",
"Sambalpur",
"Subarnapur",
"Sundargarh",
"Puducherry (Pondicherry)",
"Karaikal",
"Mahe",
"Puducherry",
"Yanam",
"Punjab",
"Amritsar",
"Barnala",
"Bathinda",
"Faridkot",
"Fatehgarh Sahib",
"Fazilka ( Firozpur)",
"Firozpur",
"Gurdaspur",
"Hoshiarpur",
"Jalandhar",
"Kapurthala",
"Ludhiana",
"Mansa",
"Moga",
"Muktsar",
"Pathankot ( Gurdaspur)",
"Patiala",
"Rupnagar",
"Sahibzada Ajit Singh Nagar",
"Sangrur",
"Shahid Bhagat Singh Nagar",
"Tarn Taran",
"Rajasthan",
"Ajmer",
"Alwar",
"Banswara",
"Baran",
"Barmer",
"Bharatpur",
"Bhilwara",
"Bikaner",
"Bundi",
"Chittaurgarh",
"Churu",
"Dausa",
"Dhaulpur",
"Dungarpur",
"Ganganagar",
"Hanumangarh",
"Jaipur",
"Jaisalmer",
"Jalor",
"Jhalawar",
"Jhunjhunu",
"Jodhpur",
"Karauli",
"Kota",
"Nagaur",
"Pali",
"Pratapgarh",
"Rajsamand",
"Sawai Madhopur",
"Sikar",
"Sirohi",
"Tonk",
"Udaipur",
"Sikkim",
"East District",
"North District",
"South District",
"West District",
"Tamil Nadu",
"Ariyalur",
"Chennai",
"Coimbatore",
"Cuddalore",
"Dharmapuri",
"Dindigul",
"Erode",
"Kanchipuram",
"Kanniyakumari",
"Karur",
"Krishnagiri",
"Madurai",
"Nagapattinam",
"Namakkal",
"Perambalur",
"Pudukkottai",
"Ramanathapuram",
"Salem",
"Sivaganga",
"Thanjavur",
"Theni",
"The Nilgiris",
"Thiruvallur",
"Thiruvarur",
"Thoothukkudi",
"Tiruchirappalli",
"Tirunelveli",
"Tiruppur",
"Tiruvannamalai",
"Vellore",
"Viluppuram",
"Virudhunagar",
"Telangana",
"Adilabad",
"Bhadradri Kothagudem ( Khammam)",
"Hyderabad",
"Jagtial ( Karimnagar)",
"Jangaon ( Warangal & Nalgonda)",
"Jayashankar Bhupalpally (Warangal, Karimnagar & Khammam)",
"Jogulamba Gadwal ( Mahabubnagar)",
"Kamareddy ( Nizamabad)",
"Karimnagar",
"Khammam",
"Kumaram Bheem Asifabad (Adilabad)",
"Mahabubabad ( Warangal & Khammam)",
"Mahabubnagar",
"Mancherial ( Adilabad)",
"Medak",
"Medchal Malkajgiri ( Rangareddy)",
"Nagarkurnool ( Mahabubnagar)",
"Nalgonda",
"Nirmal ( Adilabad)",
"Nizamabad",
"Peddapalli ( Karimnagar)",
"Rajanna Sircilla ( Karimnagar)",
"Rangareddy",
"Sangareddy ( Medak)",
"Siddipet ( Medak, Karimnagar & Warangal)",
"Suryapet ( Nalgonda)",
"Vikarabad ( Rangareddy & Mahabubnagar)",
"Wanaparthy ( Mahabubnagar)",
"Warangal Rural ( Warangal)",
"Warangal Urban ( Warangal & Karimnagar)",
"Yadadri Bhuvanagiri ( Nalgonda)",
"Tripura",
"Dhalai",
"Gomati ( South Tripura)",
"Khowai ( West Tripura)",
"North Tripura",
"Sipahijala ( West Tripura)",
"South Tripura",
"Unokoti ( North Tripura)",
"West Tripura",
"Uttarakhand (Uttaranchal)",
"Almora",
"Bageshwar",
"Chamoli",
"Champawat",
"Dehradun",
"Garhwal",
"Hardwar",
"Nainital",
"Pithoragarh",
"Rudraprayag",
"Tehri Garhwal",
"Udham Singh Nagar",
"Uttarkashi",
"Uttar Pradesh",
"Agra",
"Aligarh",
"Allahabad",
"Ambedkar Nagar",
"Amethi ( Sultanpur & Rae Bareli)",
"Amroha",
"Auraiya",
"Azamgarh",
"Baghpat",
"Bahraich",
"Ballia",
"Balrampur",
"Banda",
"Bara Banki",
"Bareilly",
"Basti",
"Bhadohi (Sant Ravidas Nagar)",
"Bijnor",
"Budaun",
"Bulandshahr",
"Chandauli",
"Chitrakoot",
"Deoria",
"Etah",
"Etawah",
"Faizabad",
"Farrukhabad",
"Fatehpur",
"Firozabad",
"Gautam Buddha Nagar",
"Ghaziabad",
"Ghazipur",
"Gonda",
"Gorakhpur",
"Hamirpur",
"Hapur ( Ghaziabad)",
"Hardoi",
"Hathras (Mahamaya Nagar)",
"Jalaun",
"Jaunpur",
"Jhansi",
"Kannauj",
"Kanpur Dehat",
"Kanpur Nagar",
"Kasganj",
"Kaushambi",
"Kheri",
"Kushinagar",
"Lalitpur",
"Lucknow",
"Mahoba",
"Mahrajganj",
"Mainpuri",
"Mathura",
"Mau",
"Meerut",
"Mirzapur",
"Moradabad",
"Muzaffarnagar",
"Pilibhit",
"Pratapgarh",
"Rae Bareli",
"Rampur",
"Saharanpur",
"Sambhal ( Moradabad & Budaun)",
"Sant Kabir Nagar",
"Shahjahanpur",
"Shamli (← Muzaffarnagar)",
"Shrawasti",
"Siddharthnagar",
"Sitapur",
"Sonbhadra",
"Sultanpur",
"Unnao",
"Varanasi",
"West Bengal",
"Alipurduar ( Jalpaiguri)",
"Bankura",
"Birbhum",
"Cooch Behar (Koch Bihar)",
"Dakshin Dinajpur",
"Darjiling",
"Hooghly (Hugli)",
"Howrah (Haora)",
"Jalpaiguri",
"Jhargram (Paschim Medinipur)",
"Kalimpong ( Darjiling)",
"Kolkata",
"Maldah",
"Murshidabad",
"Nadia",
"North Twenty Four Parganas",
"Paschim Bardhaman ( Bardhaman)",
"Paschim Medinipur",
"Purba Bardhaman ( Bardhaman)",
"Purba Medinipur",
"Puruliya",
"South Twenty Four Parganas",
"Uttar Dinajpur",];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);
</script>


</div>
</body>
</html>