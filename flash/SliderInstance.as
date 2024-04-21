import skyui.util.DialogManager;
import skyui.util.GlobalFunctions;
import skyui.util.Translator;
import gfx.managers.FocusHandler;
import gfx.ui.NavigationCode;
import Shared.GlobalFunc;
import skyui.defines.Input;

class SliderInstance extends MovieClip
{
	public var slider: MovieClip;
	public var valueTextField: TextField;
	public var nameTextField: TextField;
	
	public var sliderValue: Number;
	public var sliderDefault: Number;
	public var sliderMax: Number;
	public var sliderMin: Number;
	public var sliderInterval: Number;
	public var sliderFormatString: String;
	
	function SliderInstance(){
		super();
		slider = this.slider;
		valueTextField = this.valueTextField;
		nameTextField = this.nameTextField;
	}
	
	function onLoad(){
		test();
	}
	
	function test(){
		sliderValue = 0;
		sliderDefault = 0;
		sliderMax = 10;
		sliderMin= 0;
		sliderInterval = 0.1;
		initSlider();
	}
	
	function initSlider(){
		slider.maximum = sliderMax;
		slider.minimum = sliderMin;
		slider.liveDragging = true;
		slider.snapInterval = sliderInterval;
		slider.snapping = true;
		slider.value = sliderValue;

		sliderFormatString = Translator.translate(sliderFormatString);
		updateValueText();

		slider.addEventListener("change", this, "onValueChange");

		//FocusHandler.instance.setFocus(slider, 0);
	}

	function onValueChange(event: Object): Void
	{
		sliderValue = event.target.value;
		updateValueText();
	}
	
	function updateValueText(): Void
	{
		valueTextField.text = sliderValue.toString();
	}
	
}