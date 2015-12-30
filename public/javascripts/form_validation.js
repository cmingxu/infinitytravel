// INITIALIZE GLOBAL FORM VALIDATION VARIABLES
// VALIDATION IS THE VARIABLE WHERE ALL VALIDATION DATA WILL BE HELD
var validation = [];
// CREATE AN ARRAY OF ALL VALID DATA TYPES THAT CAN BE VALIDATED
var data_types = ["integer","float","noblanks","email","usdate","eurodate","creditcard","password","fields_match","iata","noemail"];
// BY DEFAULT WE DON'T WANT TO BYPASS VALIDATION. IN SOME INSTANCES WE WILL, LIKE SUBMITTING WITH A DELETE BUTTON
var bypass_validation = false;

// ADD THE DISCOVER FORM FUNCTION TO THE WINDOW ONLOAD FUNCTION
$(document).ready(function(e) {
    discoverForm();
});
/*
if (window.addEventListener) {
	// DOM METHOD FOR BINDING AN EVENT
	window.addEventListener("load", $discoverForm, false);
} else if (window.attachEvent) {
	// IE EXCLUSIVE METHOD FOR BINDING AN EVENT
	window.attachEvent("onload",$discoverForm);
} else if (document.getElementById) {
	// SUPPORT OLDER MODERN BROWSERS
	window.onload = function() {
		$discoverForm();
	}
}*/

function editValidation(method, form, field, required, type, validate, related_field) {
	if (method == "add") {
		// ADD VALIDATION - THIS OVERWRITES ANY EXISTING VALIDATION
		validation[form][field] = {id:field, required:required, type:type, validate:validate, related_field:related_field};
	} else if (method == "remove") {
		// REMOVE VALIDATION - THIS REMOVES ALL VALIDATION FOR A FIELD
		// DO NOT CLEAR THE VALIDATION FIELD. IF THEY FILL OUT AN OPTIONAL FIELD IT SHOULD STILL VALIDATE
		validation[form][field].required = false;
	}
}

function discoverForm() {
	if ( document.getElementById && document.getElementsByTagName ) {
		
		// GET ALL FORMS ON THE PAGE
		var forms = document.getElementsByTagName('form');
		
		// LOOP THROUGH EACH FORM
		for (var i=0; i<forms.length; i++) {
			// CHECK THE FORM CLASS. IF IT DOESN'T INCLUDE THE UNIFORM CLASS DON'T PROCESS IT.
			if ( forms[i].className.toLowerCase().indexOf("uniform") == -1 ) {
				continue;
			}
			// GET THE CURRENT FORM ID. USE getAttribute HERE TO AVOID CONFLICTS WHEN A FORM
			// HAS A FIELD NAMED ID (WHICH A LOT OF A&K FORMS DO). THE CONFLICT IS THAT YOU CAN
			// ACCESS A FORM NAMED fieldName AS forms[0].fieldName. WHEN THE FIELD NAME IS ID
			// THE BROWSER ACCESSES THE INPUT OBJECT INSTEAD OF THE ATTRIBUTE ID
			//var form_id = forms[i].getAttribute('id');
			var form_id = forms[i].attributes['id'].value
			// CREATE A NEW OBJECT IN THE VALIDATION ARRAY
			// THIS WAY WE CAN SEPARATE THE FIELDS IN EACH FORM
			validation[form_id] = {};
		
			// GET ALL INPUTS IN THE CURRENT FORM
			var inputs = forms[i].getElementsByTagName('input');
			
			// LOOP THROUGH INPUTS
			for(var j=0; j < inputs.length; j++) {
				// ONLY PROCESS TEXT, PASSWORD, CHECKBOX AND RADIO INPUTS. DO NOT PROCESS BUTTON, RESET OR SUBMIT INPUTS
				if ( inputs[j].type == "text" || inputs[j].type == "password" || inputs[j].type == "checkbox" || inputs[j].type == "radio" ) {
					// DEFAULT VARIABLES
					var required = false;
					var validate = "";
					var id = inputs[j].id;
					var maxlen = 0;
					var related_field = "";
					
					// GET CLASS LIST
					var classes = inputs[j].className.split(" ");
					var pos = arrayFindNoCase(data_types,classes);
					if (pos != -1) {
						validate = data_types[pos];
					}
					
					// CHECK TO SEE IF THE INPUT IS REQUIRED
					if ( inputs[j].className.toLowerCase().indexOf("required") != -1 ) {
						required = true;
						// FOR CHECKBOXES AND RADIO BUTTONS SET THE TYPE TO CHECKBOX OR RADIO
						if (inputs[j].type == "checkbox" || inputs[j].type == "radio") {
							validate = inputs[j].type;
						}
					}
					
					// CHECK TO SEE IF THIS IS A PASSWORD CONFIRMATION FIELD. THIS IS A SPECIAL VALIDATION SINCE WE
					// NEED TO KNOW THE ID OF THE OTHER FIELD TO COMPARE THEIR VALUES.
					for(var m=0; m < classes.length; m++) {
						if( classes[m].toLowerCase().indexOf(":") != -1 ) {
							validate = classes[m].split(":")[0];
							related_field = classes[m].split(":")[1];
						}
					}
					
					// DETERMINE MAXLENGTH, IF SPECIFIED
//					if (inputs[j].maxLength > 0) {
//						maxlen = inputs[j].maxLength;
//					}
//					var max_pos = classes.indexOf("maxlength");
//					if (max_pos > -1 and classes[max_pos + 1]) {
//						alert(max_pos);
//						alert(classes[max_pos + 1]);
//					}
					
					// UPDATE THE VALIDATION OBJECT
					editValidation('add',form_id,id,required,inputs[j].type,validate,related_field);
				}
			}
			
			// GET ALL TEXTAREAS IN THE CURRENT FORM
			var textareas = forms[i].getElementsByTagName('textarea');
				
			// LOOP THROUGH TEXTAREAS
			for(var k=0; k < textareas.length; k++) {
				// DEFAULT VARIABLES
				var required = false;
				var validate = "";
				var id = textareas[k].id;
				
				// CHECK TO SEE IF THE INPUT IS REQUIRED
				if ( textareas[k].className.toLowerCase().indexOf("required") != -1 ) {
					required = true;
				}
				
				// UPDATE THE VALIDATION OBJECT
				editValidation('add',form_id,id,required,textareas[k].type,validate);
			}
			
			// GET ALL SELECTS IN THE CURRENT FORM
			var selects = forms[i].getElementsByTagName('select');
				
			// LOOP THROUGH SELECTS
			for(var l=0; l < selects.length; l++) {
				// DEFAULT VARIABLES
				var required = false;
				var validate = selects[l].type;
				var id = selects[l].id;
				
				// CHECK TO SEE IF THE INPUT IS REQUIRED
				if ( selects[l].className.toLowerCase().indexOf("required") != -1 ) {
					required = true;
				}
				
				// UPDATE THE VALIDATION OBJECT
				editValidation('add',form_id,id,required,selects[l].type,validate);
			}
			
			// ATTACH EVENT TO THE FORM ONSUBMIT			
			forms[i].onsubmit = function(e) {
				// PREVENT MULTIPLE SUBMISSIONS
				if(this.submitted){
					return false;
				} else {
					if(validateForm(this.id)){
						if(runQasValidation(this.id,e)){
							this.submitted = true;
							return true;
						} else {
							return false;
						}
					} else {
						return false;
					}
				}
			}
			
		} // END FOR LOOP FOR FORM
	} // END IF
} // END FUNCTION

function validateForm(form_id) {
	// INITIALIZE ERR AND OK ARRAYS
	var err = [];
	var ok = [];
	
	// IF THE DELETE BUTTON HAS BEEN CLICKED, DON'T BOTHER VALIDATING THE FORM
	if ( bypass_validation ) {
		return true;
	} else {
		// IF A VALID FORM ID WAS PASSED IN, VALIDATE IT.
		if (validation[form_id]) {
			var obj = validation[form_id];
			for (var f in obj) {
				var valid = false;
				// VALIDATE REQUIRED FIELDS
				if (obj[f].required) {
					valid = validateField(f,obj[f]);
					if (valid) {
						ok.push(f);
					} else {
						err.push(f);
					}
					//alert(f + " required\nIs Valid: " + valid);
				} else { // VALIDATE NON REQUIRED FIELDS WE ONLY NEED TO WORRY ABOUT TEXT FIELDS BECAUSE ALL OTHER FIELDS ARE JUST REQUIRED OR NOT
					if (obj[f].type == "text" && obj[f].validate.length > 0 && isNotBlank(document.getElementById(f).value)) {
						valid = validateField(f,obj[f]);
					} else {
						valid = true;
					} // END IF ELSE
					if (valid) {
						ok.push(f);
					} else {
						err.push(f);
					} // END IF ELSE
				} // END IF ELSE
			} // END FOR
		} // END IF
		
		// SHOW AND HIDE ERROR MESSAGES BASED ON THE OK AND ERR ARRAYS
		if(ok.length > 0) {
			for ( var j=0; j < ok.length; j++ ) {
				
				if (document.getElementById(ok[j] + "_err") != null) {
					document.getElementById(ok[j] + "_err").className = "errorFieldHide";
				}
					
				// WALK UP THE DOM TREE UNTIL YOU FIND THE FIRST PARENT THAT IS A DIV
				var p = document.getElementById(ok[j]).parentNode;
				// SINCE FCKEDITOR EMBEDS HIDDEN FIELDS AND AN IFRAME INSIDE A DIV WE MUST CHECK FOR IT FIRST
				if (p.nodeName == "DIV" && p.className == "fckEditor") {
					p = p.parentNode;
				}
				while (p.nodeName != "DIV") {
					p = p.parentNode;
				}
				/* IF THE PARENT HAS THE borderTop CLASS ASSIGNED WE NEED TO MAINTAIN IT */
				if  (p.className.toLowerCase().indexOf("bordertop") != -1) {
					p.className = "ctrlHolder borderTop";
				} else {
					p.className = "ctrlHolder";
				}
			}
		} // END IF
		
		if(err.length > 0){
			for(var i=0; i<err.length; i++){
				
				if (document.getElementById(err[i] + "_err") != null) {
					document.getElementById(err[i] + "_err").className = "errorField";
				}
					
				// WALK UP THE DOM TREE UNTIL YOU FIND THE FIRST PARENT THAT IS A DIV	
				var p = document.getElementById(err[i]).parentNode;
				// SINCE FCKEDITOR EMBEDS HIDDEN FIELDS AND AN IFRAME INSIDE A DIV WE MUST CHECK FOR IT FIRST
				if (p.nodeName == "DIV" && p.className == "fckEditor") {
					p = p.parentNode;
				}
				while (p.nodeName != "DIV") {
					p = p.parentNode;
				}
				/* IF THE PARENT HAS THE borderTop CLASS ASSIGNED WE NEED TO MAINTAIN IT */
				if  (p.className.toLowerCase().indexOf("bordertop") != -1) {
					p.className = "ctrlHolder error borderTop";
				} else {
					p.className = "ctrlHolder error";
				}
			} // END FOR
			document.getElementById(err[0]).focus();
			return false;
		} // END IF
		
		else {
			return true;
		} // END ELSE
	}
	
} // END FUNCTION

// $VALIDATEFIELD DETERMINES IF AN ELEMENT (E) IS VALID BASED ON THE VALIDATION TYPE (V) AND OPTIONALLY COMPARING IT TO A RELATED FIELD (R)
function validateField(e,o) {
	var valid = false;
	var v = o.validate;
	var r = o.related_field;
	switch (v) {
		// VALIDATE INTEGERS
		case "integer":
			valid = isInt(document.getElementById(e).value);
			break;
		// VALIDATE FLOATS
		case "float":
			valid = isFloat(document.getElementById(e).value);
			break;
		// VALIDATE NO BLANKS - FIELDS THAT JUST NEED SOMETHING FILLED OUT, EXCLUDING WHITESPACE CHARACTERS
		case "noblanks":
			valid = isNotBlank(document.getElementById(e).value);
			break;
		// VALIDATE EMAIL ADDRESSES
		case "email":
			valid = isEmail(document.getElementById(e).value);
			break;
		// VALIDATE PASSWORDS
		case "password":
			//valid = $isNotBlank($(e).value);
			valid = isPassword(document.getElementById(e).value);
			break;
		// CONFIRM THE PASSWORDS
		case "fields_match":
			if(o.required){
				valid = ( document.getElementById(e).value == document.getElementById(r).value && isNotBlank(document.getElementById(e).value));
			} else {
				valid = (document.getElementById(e).value == document.getElementById(r).value);
			}
			break;
		// VALIDATE IATA NUMBERS
		case "iata":
			// A VALID IATA IS EITHER AN INTEGER OR ONE OR OUR CUSTOM DNAG NUMBERS
			valid = isInt(document.getElementById(e).value) || isDNAG(document.getElementById(e).value);
			break;
		// VALIDATE NO EMAIL - FIELDS THAT NEED SOMETHING FILLED IN, BUT NOT AN EMAIL ADDRESS
		case "noemail":
			valid = isNotBlank(document.getElementById(e).value) && !isEmail(document.getElementById(e).value);
			break;
		// VALIDATE US FORMATTED DATES
		case "usdate":
			valid = isUSDate(document.getElementById(e).value);
			break;
		// VALIDATE EURO FORMATTED DATES
		case "eurodate":
			valid = isEuroDate(document.getElementById(e).value);
			break;
		// VALIDATE CHECKBOX FIELDS
		case "checkbox":
			var n = document.getElementsByName(document.getElementById(e).name);
			for (var i=0; i<n.length; i++) {
				if (n[i].checked) {
					valid = true;
					break;
				}
			}
			break;
		// VALIDATE RADIO FIELDS
		case "radio":
			var n = document.getElementsByName(document.getElementById(e).name);
			for (var i=0; i<n.length; i++) {
				if (n[i].checked) {
					valid = true;
					break;
				}
			}
			break;
		// VALIDATE SELECT FIELDS
		case "select-one":
			if (document.getElementById(e).selectedIndex > 0) {
				valid = true;
			} else {
				valid = false;
			}
			break;
		case "select-multiple":
			if (document.getElementById(e).selectedIndex > -1) {
				valid = true;
			} else {
				valid = false;
			}
			break;
		// VALIDATE CREDIT CARD NUMBERS
		case "creditcard":
			valid = isCreditCardNumber(document.getElementById(e).value);
			break;
		// THE DEFAULT VALIDATION FOR A REQUIRED FIELD IS NO BLANKS
		default:
			valid = isNotBlank(document.getElementById(e).value);
			break;
	}
	return valid;
}

function runQasValidation(form_id,e){
	var obj = validation[form_id];
	var bypass_qas_verification = $("#BYPASS_QAS_VERIFICATION");
	var check_address = false;
	
	// IF THE FORM FIELDS ARE REQUIRED, THEN THEY SHOULD BE FILLED OUT AT THIS POINT. IF THE ADDRESS IS NOT REQUIRED,
	// THEN WE ONLY WANT TO VALIDATE THE ADDRESS IF THEY FILLED IT OUT.
	if(bypass_qas_verification != null){
		var address1_ctl = $('#LINEONECTL').val();
		var address2_ctl = $('#LINETWOCTL').val();
		var address3_ctl = $('#LINETHREECTL').val();
		var city_ctl = $('#CITYCTL').val();
		var state_ctl = $('#STATECTL').val();
		var postal_code_ctl = $('#ZIPCTL').val();
		var country_ctl = $('#COUNTRYCTL').val();
		
		// IF ANY ADDRESS FIELD IS REQUIRED, THEN WE NEED TO CHECK THE ENTIRE ADDRESS. THE COUNTRY DROPDOWN DOESN'T HAVE A DEFAULT OPTION, SO IT DOESN'T MATTER IF IT IS REQUIRED OR NOT
		if(obj[address1_ctl].required || obj[address2_ctl].required || obj[city_ctl].required || obj[state_ctl].required || obj[postal_code_ctl].required){
			check_address = true;
		} 
		// IF NO ADDRESS FIELDS ARE REQUIRED, BUT AT LEAST 1 IS FILLED IN (OTHER THAN THE COUNTRY), THEN WE NEED TO CHECK THE ADDRESS
		else if(isNotBlank($("#" + address1_ctl).val()) || isNotBlank($("#" + address2_ctl).val()) || isNotBlank($("#" + city_ctl).val()) || $("#" + state_ctl).val() > 0 || isNotBlank($("#" + postal_code_ctl).val())){
			check_address = true;
		}
		var country_field = $("#" + country_ctl);
		
		/* 
			IN ORDER TO RUN QAS VALIDATION THE FOLLOWING MUST BE TRUE:
			1. THE BYPASS_QAS_VERIFICATION FIELD HAS TO EXIST AND ITS VALUE MUST BE FALSE
			2. ADDRESS FIELDS MUST BE REQUIRED OR PARTIALLY FILLED OUT
			3. THE COUNTRY MUST BE USA
			
			NOTE: YOU CANNOT TREAT BYPASS_QAS_VERIFICATION AS A BOOLEAN SINCE ANY NON-EMPTY STRING TRANSLATES INTO A BOOLEAN TRUE (INCLUDING THE STRING 'FALSE')
		*/
		if(bypass_qas_verification.val() == 'false' && check_address && country_field != undefined && ( country_field.val() == 'USA' || country_field.val() == 'CAN' )){
			return events.handleThirdPartyButtonClick(e);
		} else {
			// OTHERWISE, WE DON'T NEED TO RUN QAS ON THIS FORM, SO WE ARE OK TO SUBMIT
			return true;
		}
	} else {
		// IF THE BYPASS_QAS_VERIFICATION FIELD DOESN'T EXIST, THEN WE DON'T NEED TO RUN QAS
		return true;
	}
}

// THIS IS A FUNCTION THAT ENSURES THAT THE CURRENT HTML IN THE FCKEDITOR IS IN THE HIDDEN INPUT FIELD THAT 
// IS SUPPOSED TO HOLD THAT DATA. FROM TESTING IT LOOKS LIKE THAT VALUE DOESN'T GET UPDATED WHEN THE SUBMIT
// BUTTON IS CLICKED. SOMEHOW IT DOES GET UDPATED BEFORE THE FORM IS SUBMITTED, BUT NOT BEFORE THE VALIDATION ROUTINE RUNS
function validateRte(field) {
	var oEditor = FCKeditorAPI.GetInstance(field);
	document.getElementById(field).value = oEditor.GetHTML();
}

function validateDelete(message) {
	if( confirm(message) ) {
		// UPDATE THE BYPASS VALIDATION FLAG SO THAT THE FORM VALIDATION IS NOT RUN
		// OTHERWISE THE USER HAS TO FILL OUT THE FORM IN ORDER TO DELETE THE ITEM
		bypass_validation = true;
		return true;
	} else { 
		return false;
	}
}

// THIS IS A FUNCTION THAT DUMPS THE VALIDATION OBJECT TO A DIV IF YOU WANT TO LOOK AT IT
function showValidation() {
	if ( $('show_validation') ) {
		var div = $('show_validation');
		var content = "";
		for (var z in validation) {
			content += "<h1>" + z + "</h1>";
			//alert("form: " + z);
			for (var y in validation[z]) {
				content = content + "<p>id: " + validation[z][y].id + "<br>required: " + validation[z][y].required + "<br>type: " + validation[z][y].type + "<br>validate: " + validation[z][y].validate + "</p>";
				//alert("id: " + validation[z][y].id + "\nrequired: " + validation[z][y].required + "\ntype: " + validation[z][y].type + "\nvalidate: " + validation[z][y].validate);
			}
		}
		div.innerHTML = content;
	}
}