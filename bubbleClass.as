class bubbleClass extends MovieClip {
	private var life:Number = 30
	private var isDead:Boolean = false
	private var isDying:Boolean = false
	function bubbleClass() {
		
		onEnterFrame = bubbleLoop
	}
	public function  bubbleLoop():Void {
		
		
		if (isDying) {
			life--
			if (life < 1) {
				isDead = true
			}
		}
		if (isDead) {
			removeMovieClip(this)
		}
	}
	public function  kill():Void {
		isDying = true
		
	}
}