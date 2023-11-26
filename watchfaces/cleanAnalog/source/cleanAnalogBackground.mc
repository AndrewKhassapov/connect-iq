import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    function initialize() {
        var dictionary = {
            :identifier => "Background"
        };

        Drawable.initialize(dictionary);
    }

    function draw(dc as Dc) as Void {
        // Set the background color then call to clear the screen
        dc.setColor(getApp().getProperty("RingColor") as Number, getApp().getProperty("RingColor") as Number);
        dc.clear();
        var w = Toybox.System.getDeviceSettings().screenWidth;
        var h = Toybox.System.getDeviceSettings().screenHeight;

        dc.setColor(0xaaaaaa, 0xaaaaaa);
        dc.setPenWidth(20);
        dc.drawCircle(w/2, h/2, w/2);

        dc.setColor(0xeeeeee, 0xeeeeee);
        dc.setPenWidth(20);
        dc.drawCircle(w/2, h/2, (w/4 + 40));

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.setPenWidth(Toybox.System.getDeviceSettings().screenWidth/4);
        //dc.drawCircle(Toybox.System.getDeviceSettings().screenWidth/2, Toybox.System.getDeviceSettings().screenWidth/2, Toybox.System.getDeviceSettings().screenWidth/4);
        dc.fillCircle(w/2, h/2, w/4 + 40);

        /*
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_DK_BLUE);
        dc.setPenWidth(160);
        dc.drawArc(Toybox.System.getDeviceSettings().screenWidth/2, Toybox.System.getDeviceSettings().screenWidth/2, Toybox.System.getDeviceSettings().screenWidth/2.2 ,Graphics.ARC_COUNTER_CLOCKWISE,0,20);

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        dc.setPenWidth(220);
        dc.drawArc(Toybox.System.getDeviceSettings().screenWidth/2, Toybox.System.getDeviceSettings().screenWidth/2, Toybox.System.getDeviceSettings().screenWidth/2.2 ,Graphics.ARC_COUNTER_CLOCKWISE,100,112);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.setPenWidth(280);
        dc.drawArc(Toybox.System.getDeviceSettings().screenWidth/2, Toybox.System.getDeviceSettings().screenWidth/2, Toybox.System.getDeviceSettings().screenWidth/2.2 ,Graphics.ARC_COUNTER_CLOCKWISE,100,105);
        */
    }

}
