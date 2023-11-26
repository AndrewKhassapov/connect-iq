import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class cleanAnalogView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function drawGradient(start, end, dc){
		var width = dc.getWidth();
		var rincrement = (end[0].toFloat() - start[0].toFloat())/(width*2);
		var gincrement = (end[1].toFloat()-start[1].toFloat())/(width*2);
		var bincrement = (end[2].toFloat()-start[2].toFloat())/(width*2);

		var r = start[0];
		var g = start[1];
		var b = start[2];

		for(var i = 0; i < width*2; i++) {
			var rstr = r.format("%X");
			var gstr = g.format("%X");
			var bstr = b.format("%X");

			while(rstr.length() < 2) {
				rstr = "0" + rstr;
			}

			while(gstr.length() < 2) {
				gstr = "0" + gstr;
			}

			while(bstr.length() < 2) {
				bstr = "0" + bstr;
			}

			dc.setColor((rstr + gstr + bstr).toLongWithBase(16), 0x000000);
			dc.drawLine(0, i, i, 0);
			r += rincrement;
			g += gincrement;
			b += bincrement;
		}
	}

	// Returns a decimal as a degree. eg. 0.5 = 180
	function decimalAsDegree(decimal as Double, width as Double) as Number {
		var widthPercent = width / 360;
		var degreeOut = 360 * (decimal - (widthPercent/2)) as Number;
		degreeOut = degreeOut % 360;
		return degreeOut;
	}

    function drawBackground(dc) {
		var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        var minutes = clockTime.min;
        var seconds = clockTime.sec;
        var width = Toybox.System.getDeviceSettings().screenWidth;//dc.getWidth();
        var height = Toybox.System.getDeviceSettings().screenHeight;//dc.getHeight();
        
    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    	dc.clear();

		drawGradient(getRGB(getApp().getProperty("BackgroundColor") as Number), getRGB(getApp().getProperty("ForegroundColor") as Number), dc);

		
		/*
		// Hour
		var hoursArc = (hours % 12)/12;
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_DK_BLUE);
        dc.setPenWidth(160);
        dc.drawArc(width/2, height/2, width/2.2, Graphics.ARC_COUNTER_CLOCKWISE, 0, 20);
		// Minute
		var minutesArc = minutes / 60;
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        dc.setPenWidth(220);
        dc.drawArc(width/2, height/2, width/2.2, Graphics.ARC_COUNTER_CLOCKWISE, 100, 112);
		// Second
		var secondArc = seconds / 60;
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.setPenWidth(280);
        dc.drawArc(width/2, height/2, width/2.2, Graphics.ARC_COUNTER_CLOCKWISE, 60, 66);
		*/


		// for(var i = 0; i < width*2; i++) {
		// 	dc.setColor(i*3, 0x000000 + i);
		// 	dc.drawLine(width, i, i, width);
		// }
    	
        /*
		if(tick_style == 1) {
    		dc.setColor(foreground_color, Graphics.COLOR_TRANSPARENT);
			if(show_min_ticks) {
				drawTicks(dc, relative_hour_tick_length*width, relative_hour_tick_stroke*width, 12);
    			drawTicks(dc, relative_min_tick_length*width, relative_min_tick_stroke*width, 60);
			} else {
				drawTicks(dc, relative_min_tick_length*width, relative_min_tick_stroke*width, 12);
			}
		} else if(tick_style == 2) {
			dc.setColor(foreground_color, Graphics.COLOR_TRANSPARENT);
			if(show_min_ticks) {
				drawTicksCircle(dc, relative_hour_circle_tick_size*width, 1, 12);
    			drawTicksCircle(dc, relative_min_circle_tick_size*width, 1, 60);
			} else {
				drawTicksCircle(dc, relative_min_circle_tick_size*width, 1, 12);
			}
		} else if(tick_style == 3) {
			dc.setColor(foreground_color, Graphics.COLOR_TRANSPARENT);
			if(show_min_ticks) {
				drawTicksTriangle(dc, relative_hour_triangle_tick_size*width, 1, 12);
    			drawTicksTriangle(dc, relative_min_triangle_tick_size*width, 1, 60);
			} else {
				drawTicksTriangle(dc, relative_min_triangle_tick_size*width, 1, 12);
			}
		}

    	drawDate(dc, centerOnLeft(dc, dow_size[0] + 4 + date_size[0]), width/2 - dow_size[1]/2);	
		drawBox(dc);
		drawStatusBox(dc, width/2, centerOnLeft(dc, status_box_size[1]));
    	
    	dc.setColor(hour_min_hand_color, Graphics.COLOR_TRANSPARENT);
    	drawHandOffset(dc, 12.00, 60.00, hours, minutes, relative_hour_hand_length*width, relative_hour_hand_stroke*width);

    	drawHand(dc, 60, minutes, relative_min_hand_length*width, relative_min_hand_stroke*width);*/
	}

    // Draws a circle with radius in decimal, eg. radius = 1 = 100%
    function drawCircle(dc, x, y, radius){
        var screenWidth = dc.getWidth();
        var screenHeight = dc.getHeight();
        var screenSmallerVal = screenHeight;
        if(screenHeight > screenWidth){
            screenSmallerVal = screenWidth;
        }
        System.println("WORK!");
        var centerX = screenWidth / 2;
        var centerY = screenHeight / 2;
        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(10);
        dc.drawCircle(centerX + x, centerY + y, screenSmallerVal * radius);
    }

    function getRGB(color) {
		var color1 = color.format("%X");
		var r = 0;
		var g = 0;
		var b = 0;

		if(color1.length() <= 2 && color1.length() > 0) {
			r = 0;
			g = 0;
			b = color1.toLongWithBase(16);
		} else if(color1.length() == 3) {
			r = 0;
			g = color1.substring(0, 1).toLongWithBase(16);
			b = color1.substring(1, 3).toLongWithBase(16);
		} else if(color1.length() == 4){
			r = 0;
			g = color1.substring(0, 2).toLongWithBase(16);
			b = color1.substring(2, 4).toLongWithBase(16);
		} else if(color1.length() == 5) {
			r = color1.substring(0, 1).toLongWithBase(16);
			g = color1.substring(1, 3).toLongWithBase(16);
			b = color1.substring(3, 5).toLongWithBase(16);
		} else if(color1.length() == 6) {
			r = color1.substring(0, 2).toLongWithBase(16);
			g = color1.substring(2, 4).toLongWithBase(16);
			b = color1.substring(4, 6).toLongWithBase(16);
		}

		return [r, g, b];
	}

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Update the view
        var view = View.findDrawableById("TimeLabel") as Text;
        view.setColor(getApp().getProperty("ForegroundColor") as Number);
        view.setText(timeString);

        // Custom updates to display
        // drawCircle(dc, 0, 0, 50);
        //dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLACK);
        //dc.fillCircle(50, 100, 75);
        //drawBackground(dc);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    	dc.clear();
		//drawBackground(dc);
		//drawGradient(getRGB(getApp().getProperty("BackgroundColor") as Number), getRGB(getApp().getProperty("ForegroundColor") as Number), dc);
        //dc.setColor(getRGB(getApp().getProperty("ForegroundColor")) as Number, getApp().getProperty("BackgroundColor") as Number);
		var clock = System.getClockTime();
        var th = clockTime.hour;
        var tm = clockTime.min;
        var ts = clockTime.sec;
        var w = Toybox.System.getDeviceSettings().screenWidth;//dc.getWidth();
        var h = Toybox.System.getDeviceSettings().screenHeight;//dc.getHeight();
		// Hour
		var hoursArc = (th % 12)/12;
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_DK_BLUE);
        dc.setPenWidth(160);
        dc.drawArc(w/2, h/2, w/2.2, Graphics.ARC_COUNTER_CLOCKWISE, 0, 20);
		// Minute
		var minutesArc = tm / 60;
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        dc.setPenWidth(220);
        dc.drawArc(w/2, h/2, w/2.2, Graphics.ARC_COUNTER_CLOCKWISE, 100, 112);
		// Second
		var secondArc = ts / 60;
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.setPenWidth(280);
        dc.drawArc(w/2, h/2, w/2.2, Graphics.ARC_COUNTER_CLOCKWISE, 60, 66);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
