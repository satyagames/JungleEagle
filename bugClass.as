class bugClass extends MovieClip {
	private var life:Number = 30
	private var isDead:Boolean = false
	private var isDying:Boolean = false
	private var bug1:MovieClip
	private var c:Number = 0
	private var d:Number = 0
	private var hangAroundFor:Number = 0

	function bugClass() {
		hangAroundFor = 90
		life = 10
	d = Math.random()*40+15;
	
	}
	public function  manageBug():Void {
		
		if (hangAroundFor >0 && !isDying) {
			hangAroundFor--
			if (hangAroundFor < 1) {
				isDying = true
				life = 10
				this.gotoAndPlay("vanish")
			}
		}
		
		c++;
		if (c>d) {
			this.bug1.wing1.play();
			c = 0;
		}
		
		if (isDying) {
			
			life--
			if (life < 1) {
				isDead = true
				
			}
		}
		
	}
	public function  collected():Void {
		life = 20
		isDying = true
		this.gotoAndPlay("collected")
	}
	public function  getIsDead():Boolean {
		return isDying
	}
	
}
