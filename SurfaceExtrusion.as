package {
	import com.zavoo.threedee.Surface3D;
	
	import flash.events.Event;
	
	import org.papervision3d.lights.PointLight3D;
	import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.view.BasicView;
	
	[SWF(width="500", height="200", backgroundColor="#ffffff", frameRate="60")]
	public class SurfaceExtrusion extends BasicView {
		
		private var holder:DisplayObject3D;
		
		public function SurfaceExtrusion() {
			holder = new DisplayObject3D();
			this.scene.addChild(holder);
			
			var surface3D:Surface3D = new Surface3D();			
			holder.addChild(surface3D);
			
			var light:PointLight3D = new PointLight3D();
			light.x = 100;
			light.y = 100;
			light.z = 2000;
			this.scene.addChild(light);
			
			var yellowColor:FlatShadeMaterial = new FlatShadeMaterial(light, 0xfffc00);
			yellowColor.doubleSided = true;
			
			surface3D.graphics3D.depth = 10; //Set depth of surface extrusion
			surface3D.z = -surface3D.graphics3D.depth / 2;
			
			surface3D.graphics3D.linesPerCurve = 6; //Set curve quality
			
			surface3D.graphics3D.beginFill(yellowColor);
			
			//Main body of smiley face
			surface3D.graphics3D.drawCircle(0, 0, 0, 50);
			
			//Now we draw inside the main body to create holes		
			
			//Draw eyes	
			surface3D.graphics3D.drawCircle(-18, 18, 5, 10); 
			surface3D.graphics3D.drawCircle(18, 18, 5, 10);
			
			//Draw mouth
			surface3D.graphics3D.drawRect(-20, -25, -5, 40, 8);
			
			
			holder.scale = 5;
			
			surface3D.graphics3D.endFill();
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		private function onEnterFrame(event:Event):void {
			holder.rotationY += (this.viewport.containerSprite.mouseX - holder.rotationY) * .01;
			this.singleRender();
		}
	}
}
