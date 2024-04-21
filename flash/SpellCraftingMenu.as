import skyui.util.DialogManager;
import skyui.util.GlobalFunctions;
import gfx.managers.FocusHandler;
import gfx.controls.TextInput;
import gfx.ui.NavigationCode;
import Shared.GlobalFunc;
import skyui.components.ButtonPanel;
import skyui.defines.Input;
import skyui.util.Translator;
import skse;
import json;

class SpellCraftingMenu extends MovieClip
{
	var durationSlider: MovieClip;
	var magnitudeSlider: MovieClip;
	var spellName: TextInput;
	var buttonPanel: ButtonPanel;
	
	var outputJson: String;
	
	function SpellCraftingMenu(){
		super();
		skse.AllowTextInput(true);
		
		durationSlider = this.durationSlider;
		magnitudeSlider = this.magnitudeSlider;
		spellName = this.spellName;
		spellName.text = "Custom Flames";
		//FocusHandler.instance.setFocus(spellName.textField, 0);
		//spellName.focused = true;
		//Selection.setSelection(0,0);
		buttonPanel.clearButtons();
		//var cancelButton = buttonPanel.addButton({text: "$Cancel", controls: cancelControls});
		//var acceptButton = buttonPanel.addButton({text: "$Accept", controls: acceptControls});
		//acceptButton.addEventListener("click", this, "onAcceptPress");
		//cancelButton.addEventListener("click", this, "onCancelPress");
		buttonPanel.updateButtons();
		_root.spellcraft.test1234.onRollOut = function(){
			trace(1);
			_parent.onAcceptPress();
		}
		
	}
	
	function onAcceptPress(): Void
	{
		var output:Array = new Array();
		output.push({spellName: spellName.text, magnitude: magnitudeSlider.sliderValue, duration: durationSlider.sliderValue});
		
		trace(output[0]["spellName"]);
		trace(output[0]["magnitude"]);
		trace(output[0]["duration"]);
		
		exitMenu(false);
	}
	
	function onCancelPress(): Void
	{
		exitMenu(true);
	}
	
	
	private function exitMenu(canceled: Boolean): Void
	{
		skse.AllowTextInput(false);
		//skse.SendModEvent("SpellCrafting2_exit", output.text, canceled ? 1 : 0);
		skse.CloseMenu("CustomMenu");
	}
}