package;


import openfl.Lib;
import openfl.display.Sprite;

import org.zamedev.particles.ParticleSystem;
import org.zamedev.particles.loaders.ParticleLoader;
import org.zamedev.particles.renderers.DefaultParticleRenderer;
import org.zamedev.particles.renderers.ParticleSystemRenderer;
/**
 * ...
 * @author vega7
 */
class Main extends Sprite 
{
	
	private var ps:ParticleSystem;
	private var renderer:ParticleSystemRenderer;
	private var container:Sprite;

	public function new() 
	{
		super();
		
		
		createMc();
		loadParticles();
	}
	
	public function createMc():Void
	{
		container = new Sprite();
		
		var w = 50;
		var h = 100;
		
		for (i in 0...10)
		{
			var child = new Sprite();
			child.graphics.beginFill( Math.round(Math.random()*0xFFFFFF),  0.6 + (0.4 * Math.random()));
			child.graphics.drawRect(0, 0, w, h);
			
			child.y =  Math.floor(i / 5)*(h  +10);
			child.x =   (i % 5) *(w+ 10);
	
			container.addChild(child);
		} 
		
		container.x = (Lib.current.stage.stageWidth - container.width) * 0.5;
		container.y = (Lib.current.stage.stageHeight - container.height) * 0.5;
		
		stage.addChild(container);
	}

	public function loadParticles():Void //ParticleSystem
	{
		ps = ParticleLoader.load("particle/particle.pex");
		ps.maxParticles = 20;
		var desireWidth = (Lib.current.stage.stageWidth * 0.2);
		ps.particleScaleSize=desireWidth / ps.textureBitmapData.width;
		
		var renderer = DefaultParticleRenderer.createInstance();
		renderer.addParticleSystem(ps);
		container.addChild(cast renderer);
		
		
		ps.emit(0,0);
	}
	
}
