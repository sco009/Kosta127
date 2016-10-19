window.onload = function() {

	var editor = new Behave({

		textarea : document.getElementById('demo'),
		replaceTab : true,
		softTabs : true,
		tabSize : 4,
		autoOpen : true,
		overwrite : true,
		autoStrip : true,
		autoIndent : true
	});

};

function setup_editor(div, nr) {

	var editor_div = div.find(".editor" + nr);
	var diagram_div = div.find(".diagram" + nr);
	var theme_div = div.find(".theme" + nr);

	// Setup the editor diagram
	var editor = ace.edit(editor_div.get(0));
	editor.setTheme("ace/theme/crimson_editor");
	editor.getSession().setMode("ace/mode/asciidoc");
	editor.getSession().on('change', _.debounce(on_change, 100));

	theme_div.change(on_change);
	on_change();

	function on_change() {
		try {
			var diagram = flowchart.parse(editor.getValue());

			editor.getSession().setAnnotations([]);

			// Clear out old diagram
			diagram_div.html('');

			// Draw
			if (nr === 1) {
				diagram.drawSVG(diagram_div.get(0));
			} else if (nr === 2) {
				diagram.drawSVG(diagram_div.get(0), {
					'flowstate' : {
						'past' : {
							'fill' : '#CCCCCC',
							'font-size' : 12
						},
						'current' : {
							'fill' : 'yellow',
							'font-color' : 'red',
							'font-weight' : 'bold'
						},
						'future' : {
							'fill' : '#FFFF99'
						},
						'invalid' : {
							'fill' : '#444444'
						},
						'approved' : {
							'fill' : '#58C4A3',
							'font-size' : 12,
							'yes-text' : 'APPROVED',
							'no-text' : 'n/a'
						},
						'rejected' : {
							'fill' : '#C45879',
							'font-size' : 12,
							'yes-text' : 'n/a',
							'no-text' : 'REJECTED'
						}
					}
				});
			}

		} catch (err) {
			var annotation = {
				type : "error", // also warning and information
				column : 0,
				row : 0,
				text : err.message
			};
			if (err instanceof diagram.ParseError) {
				annotation.row = err.loc.first_line - 1;
				annotation.column = err.loc.first_column;
			}
			editor.getSession().setAnnotations([ annotation ]);
			throw err;
		}
	}
}

$(document).ready(function() {
	// Example diagrams

	// Setup all the editors
	setup_editor($('#demo1'), 1);
});

$(document).ready(
		function() {
			var i18nextOptions = {
				fallbackLng : 'en',
				backend : {
					referenceLng : 'en',
					projectId : '8166472e-7ac6-44e5-a53f-96a6ca165e2b'
				}
			};
			var i18nextInstance = window.i18next.use(
					window.i18nextLocizeBackend).use(
					window.i18nextBrowserLanguageDetector).init(i18nextOptions,
					function() {
						window.i18nextJquery.init(i18nextInstance, $, {
							tName : 't', // --> appends $.t = i18next.t
							i18nName : 'i18n', // --> appends $.i18n = i18next
							handleName : 'localize', // --> appends $(selector).localize(opts);
							selectorAttr : 'data-i18n', // selector for translating elements
							targetAttr : 'i18n-target', // data-() attribute to grab target element to translate (if diffrent then itself)
							optionsAttr : 'i18n-options', // data-() attribute that contains options, will load/set if useOptionsAttr = true
							useOptionsAttr : false, // see optionsAttr
							parseDefaultValueFromContent : true
						// parses default values from content ele.val or ele.text
						});

						$('body').localize();
					});
		});