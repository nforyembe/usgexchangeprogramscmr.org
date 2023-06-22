// Call Functions When the user scrolls down a defined height from the top of the document
window.onscroll = function() {
  
	modify_header();
	show_or_hide_scroll_button();

};


// Add a class to the header upon scroll 
function modify_header() {

	if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
		document.getElementById("navigation").classList.add("scrolled");
	} else {
		document.getElementById("navigation").classList.remove("scrolled");
	}

}


// Scroll to Top Button 
// Get the button:
mybutton = document.getElementById("backToTop");

// Show or Hide the button when user scrolls 20px
function show_or_hide_scroll_button() {

	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		mybutton.style.display = "block";
	} else {
		mybutton.style.display = "none";
	}

}

// When the user clicks on the button, scroll to the top of the document
function scroll_to_top() {

	document.body.scrollTop = 0;                  // For Safari
	document.documentElement.scrollTop = 0;       // For Chrome, Firefox, IE and Opera

}


// Activate tooltips
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	return new bootstrap.Tooltip(tooltipTriggerEl)
})


// Activate Popovers 
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
	return new bootstrap.Popover(popoverTriggerEl)
})


// Initiate TinyMCE
const example_image_upload_handler = (blobInfo, progress) => new Promise((resolve, reject) => {
	const xhr = new XMLHttpRequest();
	
	xhr.withCredentials = false;
	xhr.open('POST', 'content/themes/default/assets/tinymce/postAcceptor.php');

	console.log(xhr);
  
	xhr.upload.onprogress = (e) => {
		progress(e.loaded / e.total * 100);
	};
  
	xhr.onload = () => {
		if (xhr.status === 403) {
			reject({ message: 'HTTP Error: ' + xhr.status, remove: true });
			return;
		}
	
		if (xhr.status < 200 || xhr.status >= 300) {
			reject('HTTP Error: ' + xhr.status);
			return;
		}
	
		const json = JSON.parse(xhr.responseText);
	
		if (!json || typeof json.location != 'string') {
			reject('Invalid JSON: ' + xhr.responseText);
			return;
		}
	
		resolve(json.location);
	};
  
	xhr.onerror = () => {
		reject('Image upload failed due to a XHR Transport error. Code: ' + xhr.status);
	};
  
	const formData = new FormData();
	formData.append('file', blobInfo.blob(), blobInfo.filename());
  
	xhr.send(formData);
});

tinymce.init({
	selector: 'textarea.editor',
	menubar: false,
	plugins: [
	'code','autolink',
	'lists','link','image','charmap','preview','anchor','searchreplace','visualblocks','emoticons',
	'fullscreen','insertdatetime','media','table','help','wordcount','codesample', 'quickbars'
	],
	quickbars_insert_toolbar: false,
	toolbar: 'h2 h3 blockquote | bold italic underline strikethrough subscript superscript | bullist numlist | link quickimage media | undo redo | alignleft aligncenter alignright alignjustify | outdent indent hr | charmap emoticons removeformat | searchreplace code table help',
	images_upload_url: 'postAcceptor.php',
	images_upload_handler: example_image_upload_handler
});