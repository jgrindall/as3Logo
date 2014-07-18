 package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.views.*;
	import mx.controls.Alert;
	
	public class BugMediator extends RMediator{
	
	    [Inject]
	    public var view:BugView;
	  
	    override public function onRegister():void {
	    	super.onRegister();
			this.eventMap.mapListener(this.eventDispatcher,BugEvent.REPORT_BUG,onReportBug);
			this.eventMap.mapListener(this.eventDispatcher,BugEvent.CLICK_BUG,onBugClick);
	    }
		private function onBugClick(e:BugEvent):void{
			e.stopPropagation();
			var vis:Boolean = view.visible;
			view.visible = view.includeInLayout = !vis;
		}
		private function onReportBug(e:BugEvent):void{
			e.stopPropagation();
			var data:String = e.getData() as String;
			Alert.show(data, "Error");
			view.bugs.text = data;
		}
	}
}
