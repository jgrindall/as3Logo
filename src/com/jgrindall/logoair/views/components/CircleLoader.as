package com.jgrindall.logoair.views.components{
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    public class CircleLoader extends Sprite{
        private var _timer:Timer;
        private var _slices:int;
        private var _r0:int;
		private var _thick:int;
		private var _r1:int;
		private var _autoStart:Boolean;
		
        public function CircleLoader(slices:int = 12, r0:int = 2, r1:int=6, thick:int=2, autoStart:Boolean=false){
            super();
            this._slices = slices;
            this._r0 = r0;
			this._r1 = r1;
			this._thick = thick;
			_autoStart=autoStart;
            draw();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
		public function start():void{
			_timer.start();
		}
		public function stop():void{
			_timer.stop();	
		}
		
        private function onAddedToStage(event:Event):void{
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
            _timer = new Timer(65);
            _timer.addEventListener(TimerEvent.TIMER, onTimer, false, 0, true);
			if(_autoStart){
				this.start();
			}
        }
        private function onRemovedFromStage(event:Event):void{
            removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            _timer.reset();
            _timer.removeEventListener(TimerEvent.TIMER, onTimer);
            _timer = null;
        }
        private function onTimer(event:TimerEvent):void {
            rotation = (rotation + (360 / _slices)) % 360;
        }
        private function draw():void{
            var i:int = _slices;
            var degrees:int = 360 / _slices;
			for(i=_slices;i>=1;i--){
                var slice:Shape = getSlice();
                slice.alpha = Math.max(0.2, 1 - (0.1 * i));
                var radianAngle:Number = (degrees * i) * Math.PI / 180;
                slice.rotation = -degrees * i;
                slice.x = Math.sin(radianAngle) * _r0;
                slice.y = Math.cos(radianAngle) * _r0;
                addChild(slice);
            }
        }
        private function getSlice():Shape {
            var slice:Shape = new Shape();
            slice.graphics.beginFill(0x666666);
            slice.graphics.drawRect(-_thick/2,0,_thick,_r1-_r0);
            slice.graphics.endFill();
            return slice;
        }
    }
}